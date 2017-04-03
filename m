From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/7] rtc: Reuse rtc-sh driver to support RZ/A1
Date: Mon, 3 Apr 2017 18:03:37 +0200
Message-ID: <20170403160337.g3fzjbfhllnaoafz@piout.net>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170329173035.67477-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 29/03/2017 at 10:30:28 -0700, Chris Brandt wrote:
> Basically, the same RTC that was used in SuperH devices is now used in
> RZ/A1 devices. Therefore with some slight changes, that driver can be
> reused.
> 
> Additionally, since ARM architectures require Device Tree configurations,
> device tree support has been added.
> 
> This was tested on RZ/A1H RSK board. Once the correct time was programmed
> into the RTC running off a 32.768kHz crystal, you can retain an accurate
> system clock between reboots (hard and soft) until power is finally removed
> from the board (there is no batter backup on the RSK board).
> 
> v3:
> * remove 'power-domains' from example in documentation
> * update commit message subject and body of dt-bindings
> 
> v2:
> * removed HAVE_CLK from Kconfig
> * when using DT, look for "fck" instead of "rtc0"
> * changed (res == NULL) to (!res)
> * added Reviewed-by for rtc-sh.c
> * added interrupt-names and clock-names
> * clocks now include counting sources
> * added clock-names "fck", "rtc_x1", "rtc_x3", "extal"
> * changed 'is a RTC' to 'is an RTC' in commit message
> * changed "rtc0" to "rtc"
> * Added clock nodes for RTC_X1 and RTC_X3 pin inputs
> * each commit now has a log message
> 
> 
> Chris Brandt (7):
>   rtc: rtc-sh: add support for rza series
>   dt-bindings: rtc: document the rtc-sh bindings

I applied those two, I'll let Simon take the device tree patches.

Thanks!

>   ARM: dts: r7s72100: add rtc clock to device tree
>   ARM: dts: r7s72100: add RTC_X clock inputs to device tree
>   ARM: dts: r7s72100: add rtc to device tree
>   ARM: dts: rskrza1: set rtc_x1 clock value
>   ARM: dts: rskrza1: add rtc DT support

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
