From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>
Subject: Re: strange dtc errors after adding sram node
Date: Sat, 23 Apr 2016 12:33:09 +0200
Message-ID: <1461407589.1986.3.camel@embedded.rocks>
References: <571B283F.8010707@lategoodbye.de>
	 <1461399514.2205.20.camel@embedded.rocks>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461399514.2205.20.camel-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>, kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Sa, 2016-04-23 at 10:18 +0200, J=C3=B6rg Krause wrote:
> Hi Stefan,
>=20
> On Sa, 2016-04-23 at 09:46 +0200, Stefan Wahren wrote:
> > Hi,
> >=20
> > i want to add an sram node to arch/arm/boot/dts/imx28.dtsi.
> > According
> > to=C2=A0
> > the reference manual [1] the On-Chip RAM is connected to AHB,
> > start=C2=A0
> > address 0 and has a size of 128 KB.
> >=20
> > So i modified the imx28.dtsi based on the patch below.
> > Unfortunately
> > the=C2=A0
> > dtc give me some strang errors:
> >=20
> > ERROR (duplicate_label): Duplicate label 'mac0' on=C2=A0
> > /ahb@80080000/ethernet@800f0000 and /ahb@00000000/ethernet@800f0000
> > ERROR: Input tree has errors, aborting (use -f to force output)
> >=20
> > What's wrong with my patch or does it reveal another issue?
> >=20
> > Regards
> > Stefan
> >=20
> > [1] - http://cache.freescale.com/files/dsp/doc/ref_manual/MCIMX28RM
> > .p
> > df
> > i.MX28 Applications Processor Reference Manual, Rev. 2, 08/2013
> > Chapter 4.1 Memory Map Overview
> >=20
> > -------------------------->8---------------------------------------
> > --- a/arch/arm/boot/dts/imx28.dtsi
> > +++ b/arch/arm/boot/dts/imx28.dtsi
> > @@ -1311,13 +1311,18 @@
> > =C2=A0=C2=A0		};
> > =C2=A0=C2=A0	};
> >=20
> > -	ahb@80080000 {
> > +	ahb@00000000 {
> > =C2=A0=C2=A0		compatible =3D "simple-bus";
> > =C2=A0=C2=A0		#address-cells =3D <1>;
> > =C2=A0=C2=A0		#size-cells =3D <1>;
> > -		reg =3D <0x80080000 0x80000>;
> > +		reg =3D <0x00000000 0x20000>, <0x80080000 0x80000>;
> > =C2=A0=C2=A0		ranges;
> >=20
> > +		ocram: sram@00000000 {
> > +			compatible =3D "mmio-sram";
> > +			reg =3D <0x00000000 0x20000>;
> > +		};
> > +
> > =C2=A0=C2=A0		usb0: usb@80080000 {
> > =C2=A0=C2=A0			compatible =3D "fsl,imx28-usb", "fsl,imx27-
> > usb";
> > =C2=A0=C2=A0			reg =3D <0x80080000 0x10000>;
>=20
> Follwing the address map for the i.MX28 (p. 125ff) the AHB is mapped
> to
> different start addresses:
>=20
> Bus	MNEMONIC	START ADDRESS
> --------------------------------------
> AHB	OCRAM=C2=A0		0x00000000
> AHB	USBCTRL0	0x80080000
> AHB	OCROM		0xC0000000
>=20
> So instead of replacing=C2=A0ahb@80080000=C2=A0by=C2=A0ahb@00000000=C2=
=A0a new node
> should
> be created. However, I am not sure if this is really necessary, I
> haven't seen it for all device trees using "mmio-sram".

Sorry, for not looking carefully enough at your patch. Haven't seen you
adjusted the 'reg' property. I tried with an additional=C2=A0ahb@000000=
00=C2=A0no
de and this did work.

So, there is really something odd here...

Best regards
J=C3=B6rg Krause
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
