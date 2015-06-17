From: Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCH] ARM: DT: STiH410: Add bdisp dt nodes
Date: Wed, 17 Jun 2015 15:52:47 +0200
Message-ID: <15ED7CB7B68B4D4C96C7D27A1A23941201BA003733@SAFEX1MAIL2.st.com>
References: <1434461440-3965-1-git-send-email-fabien.dessenne@st.com>
 <55816455.1030503@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55816455.1030503-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

> -----Original Message-----
> From: Maxime COQUELIN
> Sent: mercredi 17 juin 2015 14:13
> To: Fabien DESSENNE; Srinivas Kandagatla; Patrice CHOTARD; Rob Herring;
> Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Russell King; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Benjamin Gaignard
> Subject: Re: [PATCH] ARM: DT: STiH410: Add bdisp dt nodes
> 
> Hi Fabien,
> 
> On 06/16/2015 03:30 PM, Fabien Dessenne wrote:
> > Add the bdisp (2D blitter for STMicroelectronics SoC) dt nodes for the
> > first of the two bdisp devices, defining register address, interrupt
> > and clock.
> >
> > Signed-off-by: Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/stih410.dtsi | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stih410.dtsi
> > b/arch/arm/boot/dts/stih410.dtsi index 208b5e8..6f40bc9 100644
> > --- a/arch/arm/boot/dts/stih410.dtsi
> > +++ b/arch/arm/boot/dts/stih410.dtsi
> > @@ -10,6 +10,10 @@
> >   #include "stih407-family.dtsi"
> >   #include "stih410-pinctrl.dtsi"
> >   / {
> > +	aliases {
> > +		bdisp0 = &bdisp0;
> > +	};
> > +
> >   	soc {
> >   		usb2_picophy1: phy2 {
> >   			compatible = "st,stih407-usb2-phy"; @@ -218,5
> +222,13 @@
> >   				};
> >   			};
> >   		};
> > +
> > +		bdisp0:bdisp@9f10000 {
> > +			compatible = "st,stih407-bdisp";
> > +			reg = <0x9f10000 0x1000>;
> > +			interrupts = <GIC_SPI 38 IRQ_TYPE_NONE>;
> > +			clock-names = "bdisp";
> > +			clocks = <&clk_s_c0_flexgen CLK_IC_BDISP_0>;
> > +		};
> 
> Isn't the bdisp also present on STiH407 SoC?
> If so, could you please move this node to stih407-family file?
> 
> Thanks,
> Maxime

For the time being, it is not planned to be supported on STiH407. Maybe one day...

Fabien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
