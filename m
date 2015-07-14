From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/8] Documentation: add sbsa-gwdt.txt documentation
Date: Tue, 14 Jul 2015 09:49:38 -0500
Message-ID: <CAL_JsqJA4FNs4QSjep-sX-Oe=bGX087ZHcHOpASas5dKq0jZVQ@mail.gmail.com>
References: <=fu.wei@linaro.org> <1435068994-13526-1-git-send-email-fu.wei@linaro.org>
 <1435068994-13526-2-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435068994-13526-2-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Suravee Suthikulanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, "linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, leo.duran-5C7GfCeVMHo@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael
List-Id: devicetree@vger.kernel.org

On Tue, Jun 23, 2015 at 9:16 AM,  <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> The sbsa-gwdt.txt documentation in devicetree/bindings/watchdog is for
> introducing SBSA(Server Base System Architecture) Generic Watchdog
> device node info into FDT.
>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/sbsa-gwdt.txt     | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
> new file mode 100644
> index 0000000..010e5c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
> @@ -0,0 +1,36 @@
> +* SBSA(Server Base System Architecture) Generic Watchdog
> +
> +The SBSA Generic Watchdog Timer is used for resetting the system after
> +two stages of timeout.
> +More details: ARM-DEN-0029 - Server Base System Architecture (SBSA)
> +
> +Required properties:
> +- compatible : Should at least contain "arm,sbsa-gwdt".
> +
> +- reg : base physical address of the frames and length of memory mapped region.

This needs to specify the ordering of refresh and control.

> +
> +- reg-names : Should contain the resource reg names to show the order of
> +  the values in "reg".
> +  Must include the following entries : "refresh", "control".

This should be optional.

> +- interrupts : Should at least contain WS0 interrupt,
> +  the WS1 Signal is optional.

s/Signal/interrupt/ ?

> +
> +- interrupt-names : Should contain the resource interrupt names.
> +  Must include the following entries : "ws0". "ws1" is optional.

This should be optional.

> +
> +Optional properties
> +- timeout-sec : Watchdog pre-timeout and timeout values (in seconds).
> +       The first is timeout values, then pre-timeout.
> +
> +Example for FVP Foundation Model v8:
> +
> +watchdog@2a440000 {
> +       compatible = "arm,sbsa-gwdt";
> +       reg = <0x0 0x2a440000 0 0x1000>,
> +             <0x0 0x2a450000 0 0x1000>;
> +       reg-names = "control", "refresh";
> +       interrupts = <0 27 4>;
> +       interrupt-names = "ws0";
> +       timeout-sec = <10 5>;
> +};
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
