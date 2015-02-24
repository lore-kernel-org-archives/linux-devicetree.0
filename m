From: vichy <vichy.kuo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: possible add CONFIG define in dts?
Date: Tue, 24 Feb 2015 17:03:06 +0800
Message-ID: <CAOVJa8FmpFFk=3YwgTX4N3u5AKmM05jpbzww4_xNvS3d=W8sRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi all:
I want to share 1 dts when my linux kernel running on different platform.
is it possible to use #ifdef CONFIGxxx like below?
( Compile is pass, but I still get arm,data-latency, arm,tag-latency as <6 6 6>
Sincerely appreciate your kind help in advance,

        L2: cache-controller@ffe00000 {
                compatible = "arm,pl310-cache";
                reg = <0xffe00000 0x1000>;
                interrupts = <0 96 4>;
                cache-level = <2>;
#ifdef CONFIG_ARCH_PLAT_FPGA
                arm,data-latency = <0 0 0>;
                arm,tag-latency = <0 0 0>;
#else
                arm,data-latency = <6 6 6>;
                arm,tag-latency = <6 6 6>;
#endif
        };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
