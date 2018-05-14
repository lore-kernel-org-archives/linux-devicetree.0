From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: draak: Describe HDMI input
Date: Mon, 14 May 2018 05:49:41 +0300
Message-ID: <26780153.JLo9OE30iv@avalon>
References: <1526032802-14376-1-git-send-email-jacopo+renesas@jmondi.org> <1526032802-14376-4-git-send-email-jacopo+renesas@jmondi.org> <20180513125755.GQ18974@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180513125755.GQ18974@bigcity.dyn.berto.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On Sunday, 13 May 2018 15:57:55 EEST Niklas S=F6derlund wrote:
> On 2018-05-11 12:00:02 +0200, Jacopo Mondi wrote:
> > Describe HDMI input connected to VIN4 interface for R-Car D3 Draak
> > development board.
> >=20
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >=20
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 68 ++++++++++++++++++=
+++
> >  1 file changed, 68 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index d03f194..e0ce462
> > 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > @@ -59,6 +59,17 @@
> >=20
> >  		};
> >  =09
> >  	};
> >=20
> > +	hdmi-in {
> > +		compatible =3D "hdmi-connector";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint =3D <&adv7612_in>;
> > +			};
> > +		};
> > +	};
> > +
> >=20
> >  	memory@48000000 {
> >  =09
> >  		device_type =3D "memory";
> >  		/* first 128MB is reserved for secure area. */
> >=20
> > @@ -142,6 +153,11 @@
> >=20
> >  		groups =3D "usb0";
> >  		function =3D "usb0";
> >  =09
> >  	};
> >=20
> > +
> > +	vin4_pins: vin4 {
> > +		groups =3D "vin4_data24", "vin4_sync", "vin4_clk", "vin4_clkenb";
> > +		function =3D "vin4";
> > +	};
> >=20
> >  };
> > =20
> >  &i2c0 {
> >=20
> > @@ -154,6 +170,35 @@
> >=20
> >  		reg =3D <0x50>;
> >  		pagesize =3D <8>;
> >  =09
> >  	};
> >=20
> > +
> > +	hdmi-decoder@4c {
> > +		compatible =3D "adi,adv7612";
> > +		reg =3D <0x4c>;
> > +		default-input =3D <0>;
> > +
> > +		ports {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			port@0 {
> > +				reg =3D <0>;
> > +				adv7612_in: endpoint {
> > +					remote-endpoint =3D <&hdmi_con_in>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg =3D <2>;
> > +				adv7612_out: endpoint {
> > +					pclk-sample =3D <0>;
> > +					hsync-active =3D <0>;
> > +					vsync-active =3D <0>;
>=20
> This differs from the Gen2 DT bindings which is a very similar hardware
> setup using the same components. Defining these properties will make the
> bus marked as V4L2_MBUS_PARALLEL instead of V4L2_MBUS_BT656.
>=20
> This will change how the hardware is configured for capture if the media
> bus is in a UYVY format, see VNMC_INF register in rvin_setup(). Maybe
> this it not an issue here but still I'm curious to why this differ
> between Gen2 and Gen3 :-)
>=20
> > +
> > +					remote-endpoint =3D <&vin4_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> >=20
> >  };
> > =20
> >  &i2c1 {
> >=20
> > @@ -246,3 +291,26 @@
> >=20
> >  	timeout-sec =3D <60>;
> >  	status =3D "okay";
> > =20
> >  };
> >=20
> > +
> > +&vin4 {
> > +	pinctrl-0 =3D <&vin4_pins>;
> > +	pinctrl-names =3D "default";
> > +
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		port@0 {
> > +			reg =3D <0>;
> > +
> > +			vin4_in: endpoint {
> > +				hsync-active =3D <0>;
> > +				vsync-active =3D <0>;
>=20
> Comparing this to the Gen2 bindings some properties are missing,
>=20
> bus-width =3D <24>;
> pclk-sample =3D <1>;
> data-active =3D <1>;
>=20
> This is not a big deal as the VIN driver don't use these properties so
> no functional change should come of this but still a difference.

I think the VIN DT bindings should be updated to explicitly list the endpoi=
nt=20
properties that are mandatory, optional, or not allowed.

> Over all I'm happy with this change but before I add my tag I would like
> to understand why it differs from the Gen2 configuration for the adv7612
> properties.
>=20
> Also on a side not it is possible with hardware switches on the board
> switch the VIN4 source to a completely different pipeline CVBS connector
> -> adv7180 -> VIN4. But I think it's best we keep the HDMI as default as
> this seems to be how the boards are shipped. But maybe mentioning this
> in the commit message would not hurt if you end-up resending the patch.
>=20
> > +
> > +				remote-endpoint =3D <&adv7612_out>;
> > +			};
> > +		};
> > +	};
> > +};

=2D-=20
Regards,

Laurent Pinchart
