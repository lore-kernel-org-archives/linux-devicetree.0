From: Dick Middleton <dick-HMexRZvHHsesTnJN9+BGXg@public.gmane.org>
Subject: arm sun8i h3 nanopineo no ethernet device
Date: Mon, 6 Feb 2017 12:49:21 +0000
Message-ID: <7a9a1813-abff-7888-130f-c222c0d4c6a0@fouter.net>
Reply-To: dick-HMexRZvHHsesTnJN9+BGXg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

	I've just installed sun8i-h3-nanopineo.dtb from kernel 4.10.rc7 and notice a
couple of things, I wondered if anybody else had too:

1)  There's no ethernet interface (eth0)
2)  htop shows only 1 cpu. It's supposed to be quad core.

Here's /proc/cpuinfo:

 processor       : 0
model name      : ARMv7 Processor rev 5 (v7l)
BogoMIPS        : 48.00
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xc07
CPU revision    : 5

Hardware        : Allwinner sun8i Family
Revision        : 0000
Serial          : 02c000814bd6d978


Much the same from lscpu:

Architecture:          armv7l
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0
Off-line CPU(s) list:  1-3
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             1
Model:                 5
Model name:            ARMv7 Processor rev 5 (v7l)
BogoMIPS:              48.00
Flags:                 half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm

Dick
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
