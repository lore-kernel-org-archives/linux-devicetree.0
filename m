From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: draak: Describe CVBS input
Date: Fri, 18 May 2018 18:12:15 +0300
Message-ID: <1569661.saMqNra8vc@avalon>
References: <1526654878-11143-1-git-send-email-jacopo+renesas@jmondi.org> <1526654878-11143-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526654878-11143-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Friday, 18 May 2018 17:47:57 EEST Jacopo Mondi wrote:
> Describe CVBS video input through analog video decoder ADV7180
> connected to video input interface VIN4.
>=20
> The video input signal path is shared with HDMI video input, and
> selected by on-board switches SW-53 and SW-54 with CVBS input selected
> by the default switches configuration.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> ---
> v2 -> v3:
> - Add comment to describe the shared input video path
> - Add my SoB and Niklas' R-b tags
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 42 ++++++++++++++++++++=
+++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index 9d73de8..95745fc
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -142,6 +142,11 @@
>  		groups =3D "usb0";
>  		function =3D "usb0";
>  	};
> +
> +	vin4_pins_cvbs: vin4 {
> +		groups =3D "vin4_data8", "vin4_sync", "vin4_clk";
> +		function =3D "vin4";
> +	};
>  };
>=20
>  &i2c0 {
> @@ -154,6 +159,23 @@
>  		reg =3D <0x50>;
>  		pagesize =3D <8>;
>  	};
> +
> +	analog-video@20 {
> +		compatible =3D "adi,adv7180";
> +		reg =3D <0x20>;
> +
> +		port {

The adv7180 DT bindings document the output port as 3 or 6 (respectively fo=
r=20
the CP and ST versions of the chip). You should thus number the port. Apart=
=20
from that the patch looks good.

> +			/*
> +			 * The VIN4 video input path is shared between
> +			 * CVBS and HDMI inputs through SW[49-54] switches.
> +			 *
> +			 * CVBS is the default selection, link it to VIN4 here.
> +			 */
> +			adv7180_out: endpoint {
> +				remote-endpoint =3D <&vin4_in>;
> +			};
> +		};
> +	};
>  };
>=20
>  &i2c1 {
> @@ -246,3 +268,23 @@
>  	timeout-sec =3D <60>;
>  	status =3D "okay";
>  };
> +
> +&vin4 {
> +	pinctrl-0 =3D <&vin4_pins_cvbs>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@0 {
> +			reg =3D <0>;
> +
> +			vin4_in: endpoint {
> +				remote-endpoint =3D <&adv7180_out>;
> +			};
> +		};
> +	};
> +};

=2D-=20
Regards,

Laurent Pinchart
