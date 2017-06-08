From: "Keiji Hayashibara" <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: RE: [PATCH V2 1/3] devicetree: add UniPhier WDT devicetree bindings documentation
Date: Thu, 8 Jun 2017 15:22:12 +0900
Message-ID: <000101d2e01f$913fef20$b3bfcd60$@socionext.com>
References: <1496740294-12653-1-git-send-email-hayashibara.keiji@socionext.com> <1496740294-12653-2-git-send-email-hayashibara.keiji@socionext.com> <CAK7LNATMRPW3PYU-fX+biRdez-mgkUKRbVi+w+dBNb3szOuXdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATMRPW3PYU-fX+biRdez-mgkUKRbVi+w+dBNb3szOuXdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ja
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?WWFtYWRhLCBNYXNhaGlyby/lsbHnlLAg55yf5byY?= <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?Q?Hayashi=2C_Kunihiko/=E6=9E=97_=E9=82=A6=E5=BD=A6?= <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?utf-8?B?T3dhZGEsIEtpeW9zaGkv5aSn5ZKM55SwIOa4heW/lw==?= <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Yamada-san

Thank you for your comment.

> > Add uniphier-wdt bindings documentation.
> >
> > Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> 
> 
> Maybe "dt-bindings: watchdog: ..." for the subject.
> 
> This seems what Rob prefers.
> 
> For example,
> https://patchwork.kernel.org/patch/9606365/

OK. I will change the subject in v3 patch.

> 
> > ---
> >  .../devicetree/bindings/watchdog/uniphier-wdt.txt    | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> > new file mode 100644
> > index 0000000..a59d1ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> > @@ -0,0 +1,20 @@
> > +UniPhier watchdog timer controller
> > +
> > +This UniPhier watchdog timer controller must be under sysctrl compatible node.
> 
> Do you mean "syscon compatible" ?

The "compatible" word is inappropriate.
I will remove it in v3 patch.

> 
> > +Required properties:
> > +- compatible: should be "socionext,uniphier-wdt"
> > +
> > +Example:
> > +
> > +       sysctrl@61840000 {
> > +               compatible = "socionext,uniphier-ld11-sysctrl",
> > +                            "simple-mfd", "syscon";
> > +               reg = <0x61840000 0x4000>;
> > +
> > +               sys_wdt: watchdog {
> > +                       compatible = "socionext,uniphier-wdt";
> > +               }
> 
> Could you remove the "sys_dwt: " label?
> I'd like the example matched with actual DT files.

I will remove it.

> 
> Thanks.
> 
> 
> > +               other nodes ...
> > +       };
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

----------
Best Regards,
Keiji Hayashibara


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
