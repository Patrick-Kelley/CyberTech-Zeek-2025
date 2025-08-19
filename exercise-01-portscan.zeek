module PortScan;

export {
    redef enum Notice::Type += {
        Port_Scan
    };
}

global suspicious_activity: table[addr] of set[port] &create_expire=1min;
global threshold: count = 5;  # Threshold of unique ports accessed to trigger an alert

event new_connection(c: connection) {
    local src_ip = c$id$orig_h;
    local dst_port = c$id$resp_p;
    
    if ( ! ([src_ip] in suspicious_activity) ) {
        suspicious_activity[src_ip] = set();
    }

    add suspicious_activity[src_ip][dst_port];

    if (|suspicious_activity[src_ip]| >= threshold) {
        NOTICE([$note=Port_Scan,
                $msg=fmt("Port scan detected from %s (accessed %d unique ports)", src_ip, |suspicious_activity[src_ip]|),
                $src=src_ip,
                $conn=c]);
    }
}
