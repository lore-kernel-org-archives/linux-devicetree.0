From: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6ul-geam: Add Engicam IMX6UL GEA M6UL
 initial support
Date: Sat, 20 Feb 2016 18:19:28 +0100
Message-ID: <20160220171921.GB24064@panicking>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
 <1455963652-24618-5-git-send-email-michael@amarulasolutions.com>
 <CAOMZO5AmePs3aE2zRSXcSS8iKQ0m2kvTAezsfHS13e-Zv1HCrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5AmePs3aE2zRSXcSS8iKQ0m2kvTAezsfHS13e-Zv1HCrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio

On Sat, Feb 20, 2016 at 12:11:14PM -0200, Fabio Estevam wrote:
> On Sat, Feb 20, 2016 at 8:20 AM, Michael Trimarchi
> <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> 
> > +       reg_1p8v: regulator-1p8v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "1P8V";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> 
> These last two properties can be removed.
> 

This map the phy connection. Regulator are really always on and they
are always on

Michael

> > +       };
> > +
> > +       reg_3p3v: regulator-3p3v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "3P3V";
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> 
> Ditto.
> 
> > +       pinctrl_spi4: spi4grp {
> > +               fsl,pins = <
> > +                       MX6UL_PAD_BOOT_MODE0__GPIO5_IO10        0x70a1
> > +                       MX6UL_PAD_BOOT_MODE1__GPIO5_IO11        0x70a1
> > +                       MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07      0x70a1
> > +                       MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08      0x80000000
> > +               >;
> > +       };
> 
> pinctrl_spi4 seems to be unused.

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
