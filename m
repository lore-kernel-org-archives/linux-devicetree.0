From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] devicetree: add UniPhier WDT devicetree bindings documentation
Date: Thu, 8 Jun 2017 11:11:00 +0900
Message-ID: <CAK7LNATMRPW3PYU-fX+biRdez-mgkUKRbVi+w+dBNb3szOuXdw@mail.gmail.com>
References: <1496740294-12653-1-git-send-email-hayashibara.keiji@socionext.com>
 <1496740294-12653-2-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496740294-12653-2-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Kiyoshi Owada <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hayashibara-san


Just nitpicking.


2017-06-06 18:11 GMT+09:00 Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Add uniphier-wdt bindings documentation.
>
> Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


Maybe "dt-bindings: watchdog: ..." for the subject.

This seems what Rob prefers.

For example,
https://patchwork.kernel.org/patch/9606365/



> ---
>  .../devicetree/bindings/watchdog/uniphier-wdt.txt    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> new file mode 100644
> index 0000000..a59d1ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> @@ -0,0 +1,20 @@
> +UniPhier watchdog timer controller
> +
> +This UniPhier watchdog timer controller must be under sysctrl compatible node.

Do you mean "syscon compatible" ?


> +Required properties:
> +- compatible: should be "socionext,uniphier-wdt"
> +
> +Example:
> +
> +       sysctrl@61840000 {
> +               compatible = "socionext,uniphier-ld11-sysctrl",
> +                            "simple-mfd", "syscon";
> +               reg = <0x61840000 0x4000>;
> +
> +               sys_wdt: watchdog {
> +                       compatible = "socionext,uniphier-wdt";
> +               }

Could you remove the "sys_dwt: " label?
I'd like the example matched with actual DT files.


Thanks.


> +               other nodes ...
> +       };
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
