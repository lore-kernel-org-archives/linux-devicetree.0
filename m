From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: at91/dt: sama5d2: Use new compatible for
 ohci node
Date: Wed, 8 Jun 2016 12:33:00 +0200
Message-ID: <20160608103300.GE2466@piout.net>
References: <1465359311-14544-1-git-send-email-wenyou.yang@atmel.com>
 <1465359311-14544-3-git-send-email-wenyou.yang@atmel.com>
 <5757EE13.1080107@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5757EE13.1080107-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/06/2016 at 12:06:11 +0200, Nicolas Ferre wrote :
> Le 08/06/2016 06:15, Wenyou Yang a =E9crit :
> > Use compatible "atmel,sama5d2-ohci" to be capable of suspending
> > ports while sleep to save the power consumption.
> >=20
> > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >=20
> > Changes in v3: None
> > Changes in v2:
> >  - Use the new compatible for ohci-node.
> >=20
> >  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sam=
a5d2.dtsi
> > index 78996bd..03d6724 100644
> > --- a/arch/arm/boot/dts/sama5d2.dtsi
> > +++ b/arch/arm/boot/dts/sama5d2.dtsi
> > @@ -232,7 +232,7 @@
> >  		};
> > =20
> >  		usb1: ohci@00400000 {
> > -			compatible =3D "atmel,at91rm9200-ohci", "usb-ohci";
> > +			compatible =3D "atmel,sama5d2-ohci", "usb-ohci";
>=20
> We must change this to:
> +			compatible =3D "atmel,sama5d2-ohci", "atmel,at91rm9200-ohci", "us=
b-ohci";
>=20
> To make it independent from the one that may reach Mainline through t=
he USB git tree.
>=20

Well, like discussed, I'd say that a new compatible is not needed as we
already know on which chip we are running depending on the SFR that we
can lookup. My concern was only to avoid calling a function
unnecessarily on !sama5d2 platforms.
>=20
> >  			reg =3D <0x00400000 0x100000>;
> >  			interrupts =3D <41 IRQ_TYPE_LEVEL_HIGH 2>;
> >  			clocks =3D <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
> >=20
>=20
> Bye,
> --=20
> Nicolas Ferre

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
