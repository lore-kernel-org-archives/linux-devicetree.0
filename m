From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: watchdog: Add ImgTec PDC Watchdog Timer binding documentation
Date: Wed, 12 Nov 2014 20:09:24 -0800
Message-ID: <CAL1qeaHrjccd4KYAUMvWEKqhM9DFNyKWE=-2k0ux+76XR+Q5tQ@mail.gmail.com>
References: <1415805483-26268-1-git-send-email-Naidu.Tellapati@imgtec.com>
	<1415805483-26268-3-git-send-email-Naidu.Tellapati@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415805483-26268-3-git-send-email-Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 7:18 AM,  <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add the devicetree binding document for ImgTec PDC Watchdog Timer.
>
> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt b/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
> new file mode 100644
> index 0000000..2f13896
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
> @@ -0,0 +1,18 @@
> +*ImgTec PowerDown Controller (PDC) Watchdog Timer (WDT)
> +
> +Required properties:
> +- compatible : Should be "img,pistachio-pdc-wdt"

I don't see anything Pistachio-specific about this driver or binding
and it looks like IP revision is probable via the WD_CORE_REV
register, so I think you can drop the "pistachio".

> +- reg : Should contain WDT registers location and length
> +- clock-names: Should contain "wdt"

I believe there are two clocks: the 32kHz watchdog timer operating
clock and the system interface gate clock.  Perhaps call them "wdt"
and "sys"?

> +- clocks: phandles to input clocks
> +- interrupts : Should contain WDT interrupt

Not sure the interrupt will really be necessary.

> +Examples:
> +
> +wdt@18102100 {
> +       compatible = "img,pistachio-pdc-wdt";
> +       reg = <0x18102100 0x20>;

The TRM I have shows the watchdog registers occupying a full 256 bytes.

> +       clocks = <&pdc_wdt_clk>;
> +       clock-names = "wdt";
> +       interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
> +};
> --
> 1.7.0.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
