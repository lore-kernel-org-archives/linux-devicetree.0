From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v3 06/14] MIPS: dts: qca: ar9132: use short references for
 uart and spi nodes
Date: Mon, 1 Feb 2016 21:41:54 +0300
Message-ID: <20160201214154.d4242555ea8e9f5da6a7abfa@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-7-git-send-email-antonynpavlov@gmail.com>
	<20160125233148.4951e311@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160125233148.4951e311@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016 23:31:48 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Sat, 23 Jan 2016 23:17:23 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> I personally prefer the version without aliases :) Is there any
> guidelines on this?

Here are some Sascha Hauer's arguments for using aliases in the dts fil=
es:

 - Using aliases reduces the number of indentations in dts files;

 - dts files become independent of the layout of the dtsi files (it
   becomes possible to introduce another bus {} hierarchy between a
   toplevel bus and the devices when you have to);

 - less chances for typos. if &i2c2 does not exist you get an error. If
   instead you duplicate the whole path in the dts file a typo in the
   path will just create another node.

And here is a Marek Vasut's additional argument:

 - Aliases allow you to introduce some sort of ordering. For example if=
 you have
   gmac0 and gmac1 and you want to have them ordered correctly, you use=
 aliases.
   (in case we're talking about the /aliases node).


> > Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> > Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  arch/mips/boot/dts/qca/ar9132.dtsi               |  4 +-
> >  arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 70 +++++++++++-=
------------
> >  2 files changed, 35 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dt=
s/qca/ar9132.dtsi
> > index cd1602f..a14f6f2 100644
> > --- a/arch/mips/boot/dts/qca/ar9132.dtsi
> > +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> > @@ -61,7 +61,7 @@
> >  				#qca,ddr-wb-channel-cells =3D <1>;
> >  			};
> > =20
> > -			uart@18020000 {
> > +			uart: uart@18020000 {
> >  				compatible =3D "ns8250";
> >  				reg =3D <0x18020000 0x20>;
> >  				interrupts =3D <3>;
> > @@ -134,7 +134,7 @@
> >  			};
> >  		};
> > =20
> > -		spi@1f000000 {
> > +		spi: spi@1f000000 {
> >  			compatible =3D "qca,ar9132-spi", "qca,ar7100-spi";
> >  			reg =3D <0x1f000000 0x10>;
> > =20
> > diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arc=
h/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> > index 9618105..f22c22c 100644
> > --- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> > +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> > @@ -14,43 +14,6 @@
> >  		reg =3D <0x0 0x2000000>;
> >  	};
> > =20
> > -	ahb {
> > -		apb {
> > -			uart@18020000 {
> > -				status =3D "okay";
> > -			};
> > -		};
> > -
> > -		spi@1f000000 {
> > -			status =3D "okay";
> > -			num-cs =3D <1>;
> > -
> > -			flash@0 {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <1>;
> > -				compatible =3D "s25sl064a";
> > -				reg =3D <0>;
> > -				spi-max-frequency =3D <25000000>;
> > -
> > -				partition@0 {
> > -					label =3D "u-boot";
> > -					reg =3D <0x000000 0x020000>;
> > -				};
> > -
> > -				partition@1 {
> > -					label =3D "firmware";
> > -					reg =3D <0x020000 0x7D0000>;
> > -				};
> > -
> > -				partition@2 {
> > -					label =3D "art";
> > -					reg =3D <0x7F0000 0x010000>;
> > -					read-only;
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> >  	gpio-keys {
> >  		compatible =3D "gpio-keys-polled";
> >  		#address-cells =3D <1>;
> > @@ -100,3 +63,36 @@
> >  &extosc {
> >  	clock-frequency =3D <40000000>;
> >  };
> > +
> > +&uart {
> > +	status =3D "okay";
> > +};
> > +
> > +&spi {
> > +	status =3D "okay";
> > +	num-cs =3D <1>;
> > +
> > +	flash@0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		compatible =3D "s25sl064a";
> > +		reg =3D <0>;
> > +		spi-max-frequency =3D <25000000>;
> > +
> > +		partition@0 {
> > +			label =3D "u-boot";
> > +			reg =3D <0x000000 0x020000>;
> > +		};
> > +
> > +		partition@1 {
> > +			label =3D "firmware";
> > +			reg =3D <0x020000 0x7D0000>;
> > +		};
> > +
> > +		partition@2 {
> > +			label =3D "art";
> > +			reg =3D <0x7F0000 0x010000>;
> > +			read-only;
> > +		};
> > +	};
> > +};
>=20


--=20
--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
