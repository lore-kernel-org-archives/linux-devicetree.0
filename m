From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Thu, 29 Aug 2013 11:38:48 +0200
Message-ID: <20130829113848.6d8f7f21@armhf>
References: <20130828113459.48ecbb34@armhf>
	<521E5438.90109@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <521E5438.90109@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2013 23:49:12 +0400
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> wrote:

> > diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.d=
tsi
> > index 499abad..78227e2 100644
> > --- a/arch/arm/boot/dts/dove.dtsi
> > +++ b/arch/arm/boot/dts/dove.dtsi
> > @@ -573,6 +573,24 @@
> >   					phy-handle =3D <&ethphy>;
> >   				};
> >   			};
> > +
> > +			i2s0: audio-controller@b0000 { =20
>=20
>      According to ePAPR [1] the node should be called "sound", not=20
> "audio-controller".
>=20
> > +				compatible =3D "marvell,mvebu-audio";
> > +				reg =3D <0xb0000 0x2210>;
> > +				interrupts =3D <19>, <20>;
> > +				clocks =3D <&gate_clk 12>;
> > +				clock-names =3D "internal";
> > +				status =3D "disabled";
> > +			};

AFAIK, "sound" describes the global audio subsystem. For the Cubox,
this will be done by something like:

	sound {
		compatible =3D "simple-audio";
		audio-controller =3D <&i2s1>;
		audio-codec =3D <&spdif>;
		codec-dai-name =3D "dit-hifi";
	};

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
