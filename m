From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: dts: imx6: Add initial support for
 phyBOARD-Mira
Date: Tue, 19 Dec 2017 18:22:13 +0100
Message-ID: <1513704133.2106.4.camel@googlemail.com>
References: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de>
         <1513698588-13325-3-git-send-email-s.riedmueller@phytec.de>
         <CAOMZO5CSQSpPXTnR69HqHfKZiUpi+eqonqjuEu9mgBECsWG_5g@mail.gmail.com>
Reply-To: chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5CSQSpPXTnR69HqHfKZiUpi+eqonqjuEu9mgBECsWG_5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-12-19 at 15:10 -0200, Fabio Estevam wrote:
> On Tue, Dec 19, 2017 at 1:49 PM, Stefan Riedmueller
> <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org> wrote:
> 
> > +       reg_pcie: regulator-pcie {
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pinctrl_pcie_reg>;
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "mPCIe_1V5";
> > +               regulator-min-microvolt = <1500000>;
> > +               regulator-max-microvolt = <1500000>;
> > +               gpio = <&gpio3 0 GPIO_ACTIVE_HIGH>;
> > +               regulator-always-on;
> 
> Instead of using 'regulator-always-on' here, you could use:
> 
> vpcie-supply = <&reg_pcie>;
> 
> under the &pcie node
> 
> > +       panel {
> > +               compatible = "auo,g104sn02";
> 
> I could not find this compatible in linux-next.

FYI: I've sent this a few days ago:
https://www.spinics.net/lists/devicetree/msg206590.html





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
