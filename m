From: "Keiji Hayashibara" <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: RE: [PATCH V4 0/3] add UniPhier watchdog support
Date: Wed, 5 Jul 2017 19:06:28 +0900
Message-ID: <000001d2f576$5f011c20$1d035460$@socionext.com>
References: <1497426825-25450-1-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497426825-25450-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Content-Language: ja
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?iso-2022-jp?B?WWFtYWRhLCBNYXNhaGlyby8bJEI7M0VEGyhCIBskQj8/OTAbKEI=?= <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?iso-2022-jp?B?SGF5YXNoaSwgS3VuaWhpa28vGyRCTlMbKEIgGyRCSy5JJxsoQg==?= <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?iso-2022-jp?B?T3dhZGEsIEtpeW9zaGkvGyRCQmdPQkVEGyhCIBskQkA2O1YbKEI=?= <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Let me confirm if I got it.

I guess that this series finished the review.
Could you tell me the current state of this series?

----------
Best Regards,
Keiji Hayashibara


> -----Original Message-----
> From: Keiji Hayashibara [mailto:hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org]
> Sent: Wednesday, June 14, 2017 4:54 PM
> Subject: [PATCH V4 0/3] add UniPhier watchdog support
> 
> This series adds support for watchdog timer implemented on UniPhier LD11 and
> LD20 SoCs. This driver supports watchdog and system reset for SoCs.
> 
> patch V3
> http://www.spinics.net/lists/linux-watchdog/msg11889.html
> 
> patch V2
> http://www.spinics.net/lists/linux-watchdog/msg11852.html
> 
> patch V1
> http://www.spinics.net/lists/linux-watchdog/msg11782.html
> 
> 
> Changes between V4 and V3
> =========================
> 
>  * Add own dependencies to Kconfig.
> 
> Changes between V3 and V2
> =========================
> 
>  * Make it possible to take a timeout from devicetree.
>  * Sort #include headlers alphabetically.
>  * Correct the description of dt-bindings document and this patch comment.
>  * Correct the description of license as GPLv2.
>  * Correct MODULE_AUTHOR()
>  * Remove unnecessary code.
> 
> Changes between V2 and V1
> =========================
> 1. Add barrier code in uniphier_watchdog_ping() and __uniphier_watchdog_start().
> 2. Fix issues according to review comments.
> 
> Keiji Hayashibara (3):
>   dt-bindings: watchdog: add description for UniPhier WDT controller
>   watchdog: uniphier: add UniPhier watchdog driver
>   arm64: dts: uniphier: add watchdog node for LD11 and LD20
> 
>  .../devicetree/bindings/watchdog/uniphier-wdt.txt  |  20 ++
>  Documentation/watchdog/watchdog-parameters.txt     |   6 +
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi   |   4 +
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |   4 +
>  drivers/watchdog/Kconfig                           |  12 +
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/uniphier_wdt.c                    | 268 +++++++++++++++++++++
>  7 files changed, 315 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
>  create mode 100644 drivers/watchdog/uniphier_wdt.c
> 
> --
> 2.7.4



--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
