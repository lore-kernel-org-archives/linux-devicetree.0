From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] Documentation: dt: Add binding info for jz4740-rtc
 driver
Date: Thu, 17 Mar 2016 06:52:25 -0500
Message-ID: <20160317115225.GA18144@rob-hp-laptop>
References: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
 <1457217531-26064-2-git-send-email-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457217531-26064-2-git-send-email-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 05, 2016 at 11:38:48PM +0100, Paul Cercueil wrote:
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/ingenic,jz4740-rtc.txt | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> new file mode 100644
> index 0000000..71e4ad0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> @@ -0,0 +1,38 @@
> +JZ4740 and similar SoCs real-time clock driver
> +
> +Required properties:
> +
> +- compatible: One of:
> +  - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
> +  - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
> +- reg: Address range of rtc register set
> +- interrupts: IRQ number for the alarm interrupt
> +- interrupt-parent: phandle of the interrupt controller
> +- clocks: phandle to the "rtc" clock
> +- clock-names: must be "rtc"
> +
> +Optional properties:
> +- system-power-controller: To use this component as the
> +  system power controller

> +- reset-pin-assert-time: Reset pin low-level assertion time
> +  after wakeup (default 60ms; range 0-125ms if RTC clock at 
> +  32 kHz)
> +- min-wakeup-pin-assert-time: Minimum wakeup pin assertion time
> +  (default 100ms; range 0-2s if RTC clock at 32 kHz)

Please append units on these (-msec).

> +
> +Example:
> +
> +rtc@10003000 {
> +	compatible = "ingenic,jz4740-rtc";
> +	reg = <0x10003000 0x3F>;
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <32>;
> +
> +	clocks = <&rtc_clock>;
> +	clock-names = "rtc";
> +
> +	system-power-controller;
> +	reset-pin-assert-time = <60>;
> +	min-wakeup-pin-assert-time = <100>;
> +};
> -- 
> 2.7.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
