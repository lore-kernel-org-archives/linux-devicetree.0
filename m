From: "Keiji Hayashibara" <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: RE: [PATCH V3 2/3] watchdog: uniphier: add UniPhier watchdog driver
Date: Wed, 14 Jun 2017 15:50:37 +0900
Message-ID: <000101d2e4da$87e7e210$97b7a630$@socionext.com>
References: <1497316499-22254-1-git-send-email-hayashibara.keiji@socionext.com> <1497316499-22254-3-git-send-email-hayashibara.keiji@socionext.com> <CAK7LNASq9MxUwDrNeRrg_eNkJbXR2J-9hHKGZe6-DtioO3p4cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASq9MxUwDrNeRrg_eNkJbXR2J-9hHKGZe6-DtioO3p4cQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ja
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?WWFtYWRhLCBNYXNhaGlyby/lsbHnlLAg55yf5byY?= <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?Q?Hayashi=2C_Kunihiko/=E6=9E=97_=E9=82=A6=E5=BD=A6?= <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?utf-8?B?T3dhZGEsIEtpeW9zaGkv5aSn5ZKM55SwIOa4heW/lw==?= <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Yamada-san,

From: Masahiro Yamada [mailto:yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org]
Sent: Wednesday, June 14, 2017 12:08 PM
>
> 2017-06-13 10:14 GMT+09:00 Keiji Hayashibara
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 52a70ee..2a9d9a6 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -744,6 +744,17 @@ config ZX2967_WATCHDOG
> >           To compile this driver as a module, choose M here: the
> >           module will be called zx2967_wdt.
> >
> > +config UNIPHIER_WATCHDOG
> > +       tristate "UniPhier watchdog support"
> > +       depends on ARCH_UNIPHIER || COMPILE_TEST
> 
> This driver relies on syscon_node_to_regmap().
> Could you also add "depends on OF && MFD_SYSCON" ?

OK. I will fix this.
> 
> 
> > +       select WATCHDOG_CORE
> > +       help
> > +         Say Y here to include support watchdog timer embedded
> > +         into the UniPhier system.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called uniphier_wdt.
> > +

----------
Best Regards,
Keiji Hayashibara


--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
