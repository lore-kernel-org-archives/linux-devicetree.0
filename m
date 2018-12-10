From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: a64: Add
 Video Engine node
Date: Mon, 10 Dec 2018 10:00:34 +0100
Message-ID: <c276fb045ab285c0907c4831f3b71a31f09cd4a5.camel@bootlin.com>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
	 <20181205092444.29497-16-paul.kocialkowski@bootlin.com>
	 <2823800.C4zEU5jiS7@jernej-laptop>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBROWXDQAKGQEOAEY6IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2823800.C4zEU5jiS7@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2018-12-07 at 22:22 +0100, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne sreda, 05. december 2018 ob 10:24:44 CET je Paul Kocialkowski napisal=
(a):
> > This adds the Video Engine node for the A64. Since it can map the whole
> > DRAM range, there is no particular need for a reserved memory node
> > (unlike platforms preceding the A33).
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> > 8557d52c7c99..8d024c10d7cb 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -397,6 +397,17 @@
> >  			};
> >  		};
> >=20
> > +		video-codec@1c0e000 {
> > +			compatible =3D "allwinner,sun50i-h5-video-engine";
>=20
> You meant A64 instead of H5, right?

Ah yes definitely, that's a mistake right here.

I'll send a follow-up patch for switching the compatible to describe
the a64 instead of the h5. In practice, having the a64 use the h5
compatible doesn't cause any issue, but it should be fixed
nevertheless.

Cheers,

Paul

> Best regards,
> Jernej
>=20
> > +			reg =3D <0x01c0e000 0x1000>;
> > +			clocks =3D <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> > +				 <&ccu CLK_DRAM_VE>;
> > +			clock-names =3D "ahb", "mod", "ram";
> > +			resets =3D <&ccu RST_BUS_VE>;
> > +			interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> > +			allwinner,sram =3D <&ve_sram 1>;
> > +		};
> > +
> >  		mmc0: mmc@1c0f000 {
> >  			compatible =3D "allwinner,sun50i-a64-mmc";
> >  			reg =3D <0x01c0f000 0x1000>;
>=20
>=20
>=20
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
