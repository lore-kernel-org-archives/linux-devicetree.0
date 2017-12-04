From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Mon, 4 Dec 2017 23:50:14 +0100
Message-ID: <20171204225014.GC12805@lunn.ch>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch>
 <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
 <20171129215659.GC1706@lunn.ch>
 <CACRpkdbUig-wb9_CnyF7DM4JsHCv4iruKx92wNXDdZtbrr2HoA@mail.gmail.com>
 <f9bfa1e1-7f05-1e2b-6663-09d4d3bf6a12@gmail.com>
 <CACRpkdYoMVNh8eaTnaDQ59bsh4bC88biLaYSXyhnc4W83PMWzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYoMVNh8eaTnaDQ59bsh4bC88biLaYSXyhnc4W83PMWzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Yeryomin <roman-9zmcapQ0v8Q@public.gmane.org>, Colin Leitner <colin.leitner-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> So why not:
> 
> switch@0 {
>         compatible = "acme,switch";
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         ports {
> 
>                 port@0 {
>                         reg = <0>;
>                         phy@0 {
>                              reg = <0>;
>                         };
>                 };

Hi Linus

So you are suggesting put the PHY node inside the MAC node.

This is sometimes done, but does not describe the hardware. The PHYs
are on an MDIO bus, so device tree should show the MDIO bus and the
PHYs on it.

DSA does have an MDIO bus, so putting the PHYs in the MAC is just
confusing. Although that is not Florians preferred solution, he would
like the DSA driver to export its own MDIO bus and list the PHYs on
it.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
