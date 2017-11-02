From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH v5] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node with
 unit name and no reg property
Date: Thu, 2 Nov 2017 09:18:46 +0100
Message-ID: <20171102091846.2046173a@karo-electronics.de>
References: <1509031514-30602-1-git-send-email-marco.franchi@nxp.com>
        <CAOMZO5ALw3VKkX_rQCfBVNQ1q5Y8a12R3Dn42NyPAn3Te0e6OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5ALw3VKkX_rQCfBVNQ1q5Y8a12R3Dn42NyPAn3Te0e6OQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 26 Oct 2017 16:10:54 -0200 Fabio Estevam wrote:
> On Thu, Oct 26, 2017 at 1:25 PM, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org> wrote:
> > The following build warning is seen with W=1:
> >
> > Warning (unit_address_vs_reg): Node /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has a unit name, but no reg property
> >
> > Fix this warning by adding reg property from such node and, consequently,
> > includes a mdio node into the fec node, with the 'address-cells' and
> > 'size-cells' to avoid these other following warnings:
> >
> > Warning (reg_format): "reg" property in /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> > Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
> > Warning (avoid_default_addr_size): Relying on default #size-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
> >
> > Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
> 
> Lothar, could you please test it?
> 
> > ---
> > Change since v4:
> > -pass the 'address-cells' and 'size-cells' values using a mdio node
> > -change message log
> >  arch/arm/boot/dts/imx53-tx53.dtsi | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
> > index 71b58b6..a22e461 100644
> > --- a/arch/arm/boot/dts/imx53-tx53.dtsi
> > +++ b/arch/arm/boot/dts/imx53-tx53.dtsi
> > @@ -225,10 +225,16 @@
> >         mac-address = [000000000000]; /* placeholder; will be overwritten by bootloader */
> >         status = "okay";
> >
> > -       phy0: ethernet-phy@0 {
> > -               interrupt-parent = <&gpio2>;
> > -               interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> > -               device_type = "ethernet-phy";
> > +       mdio {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               phy0: ethernet-phy@0 {
> > +                       reg = <0>;
> > +                       interrupt-parent = <&gpio2>;
> > +                       interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> > +                       device_type = "ethernet-phy";
> > +               };
> >         };
> >  };
> >
> > --
> > 2.7.4
> >
> 
Tested-by: <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Acked-by: <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
