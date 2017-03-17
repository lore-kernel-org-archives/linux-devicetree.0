From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/5] rtc: Add rtc-sh
Date: Fri, 17 Mar 2017 09:17:20 +0100
Message-ID: <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com> <20170316175112.27913-3-chris.brandt@renesas.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCQJP74GSUDRBEVXV3DAKGQEMDRNKZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <20170316175112.27913-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> rtc-sh is a RTC for SuperH and RZ/A SoCs.

an RTC?

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> @@ -0,0 +1,19 @@
> +* Real Time Clock for Renesas SH and ARM SoCs
> +
> +Required properties:
> +- compatible: Should be "renesas,r7s72100-rtc" or "renesas,sh-rtc" as a

s/or/and/

> +  fallback.
> +- reg: physical base address and length of memory mapped region.
> +- interrupts: 3 interrupts for alarm, period, and carry.

If there's a need for multiple interrupts, it's always a good idea to use
interrupt-names. The datasheet calls them "arm", "prd", and "cup", but
I wouldn't object against "alarm", "period", and "carry" ;-)

> +- clocks: the clock source for the RTC controller.

The datasheet mentions 3 possible clock sources?

> +Example:
> +rtc: rtc@fcff1000 {
> +       compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> +       reg = <0xfcff1000 0x2e>;
> +       interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> +                     GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> +                     GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> +       clocks = <&mstp6_clks R7S72100_CLK_RTC>;
> +       power-domains = <&cpg_clocks>;
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
