From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: bananapi-m3: Enable dwmac-sun8i
Date: Fri, 10 Nov 2017 06:50:15 +0100
Message-ID: <20171110055015.GA11040@Red>
References: <20171109082950.21124-1-clabbe.montjoie@gmail.com>
 <20171109082950.21124-3-clabbe.montjoie@gmail.com>
 <CAGb2v6670K24MTQ8NWGDF8e2iXB+Okghp51kMD7rADgviQ65fg@mail.gmail.com>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBGX4STIAKGQEOZZC3UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v6670K24MTQ8NWGDF8e2iXB+Okghp51kMD7rADgviQ65fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 10, 2017 at 11:48:11AM +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 9, 2017 at 4:29 PM, Corentin Labbe
> <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The dwmac-sun8i hardware is present on the bananapi m3
> > It uses an external PHY rtl8211e via RGMII.
> >
> > This patch create the needed emac and phy nodes.
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> > index c606af3dbfed..45bdd5c17829 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> > +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> > @@ -52,6 +52,7 @@
> >         compatible = "sinovoip,bpi-m3", "allwinner,sun8i-a83t";
> >
> >         aliases {
> > +               ethernet0 = &emac;
> >                 serial0 = &uart0;
> >         };
> >
> > @@ -88,6 +89,23 @@
> >         /* TODO GL830 USB-to-SATA bridge downstream w/ GPIO power controls */
> >  };
> >
> > +&emac {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&emac_rgmii_pins>;
> > +       phy-handle = <&ext_rgmii_phy>;
> > +       phy-mode = "rgmii";
> 
> Schematics say PHY is power by DC1SW from the PMIC.
> Not sure why you don't need that. Have you tested your patch?

Tested on 4.14.0-rc5-next-20171018+ 
I will try to check which uboot is used, perhaps it's an old uboot with some PMIC hack.

Thanks
Regards
