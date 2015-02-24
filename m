From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: possible add CONFIG define in dts?
Date: Tue, 24 Feb 2015 11:02:11 +0000
Message-ID: <20150224110210.GS9714@leverpostej>
References: <CAOVJa8FmpFFk=3YwgTX4N3u5AKmM05jpbzww4_xNvS3d=W8sRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOVJa8FmpFFk=3YwgTX4N3u5AKmM05jpbzww4_xNvS3d=W8sRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vichy <vichy.kuo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 09:03:06AM +0000, vichy wrote:
> hi all:
> I want to share 1 dts when my linux kernel running on different platform.
> is it possible to use #ifdef CONFIGxxx like below?
> ( Compile is pass, but I still get arm,data-latency, arm,tag-latency as <6 6 6>
> Sincerely appreciate your kind help in advance,
> 
>         L2: cache-controller@ffe00000 {
>                 compatible = "arm,pl310-cache";
>                 reg = <0xffe00000 0x1000>;
>                 interrupts = <0 96 4>;
>                 cache-level = <2>;
> #ifdef CONFIG_ARCH_PLAT_FPGA
>                 arm,data-latency = <0 0 0>;
>                 arm,tag-latency = <0 0 0>;
> #else
>                 arm,data-latency = <6 6 6>;
>                 arm,tag-latency = <6 6 6>;
> #endif
>         };

The DTB should describe the HW, and thus should be separate from the
CONFIG options, which control the behaviour of the kernel. So CONFIG_*
in DTBs doesn't make much sense.

This is broken for a multi-platform kernel, no?

If you want to build DTBs for platforms with slight differences as
above, place the common portion in a shared dtsi, and override the parts
which are different in each dts. You'll end up with a dtb for each
variation, but you don't need to repeat all the common parts in each
dts.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
