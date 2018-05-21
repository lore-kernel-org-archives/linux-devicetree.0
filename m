From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: draak: Describe CVBS input
Date: Mon, 21 May 2018 17:50:50 +0300
Message-ID: <1958464.yiJe0NDHa3@avalon>
References: <1526913942-15426-1-git-send-email-jacopo+renesas@jmondi.org> <1526913942-15426-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526913942-15426-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Monday, 21 May 2018 17:45:41 EEST Jacopo Mondi wrote:
> Describe CVBS video input through analog video decoder ADV7180
> connected to video input interface VIN4.
>=20
> The video input signal path is shared with HDMI video input, and
> selected by on-board switches SW-53 and SW-54 with CVBS input selected
> by the default switches configuration.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3 -> v4:
> - Use 'adi,adv7180cp' compatible string in place of just 'adi,adv7180'
>   as suggested by Laurent.
> - Re-structure CVBS input ports definition according to adv7180cp
>   bindings: add port@0 for composite input, add port@3 for parallel
>   video output.
> - Change node label to 'composite-in' as in Gose board bindings.
>=20
> v2 -> v3:
> - Add comment to describe the shared input video path.
> - Add my SoB and Niklas' R-b tags.
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 68
> ++++++++++++++++++++++++++ 1 file changed, 68 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index 9d73de8..ad59032
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -59,6 +59,16 @@
>  		};
>  	};
>=20
> +	composite-in {
> +		compatible =3D "composite-video-connector";
> +
> +		port {
> +			composite_con_in: endpoint {
> +				remote-endpoint =3D <&adv7180_in>;
> +			};
> +		};
> +	};
> +
>  	memory@48000000 {
>  		device_type =3D "memory";
>  		/* first 128MB is reserved for secure area. */
> @@ -142,6 +152,11 @@
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
> @@ -154,6 +169,39 @@
>  		reg =3D <0x50>;
>  		pagesize =3D <8>;
>  	};
> +
> +	composite-in@20 {
> +		compatible =3D "adi,adv7180cp";
> +		reg =3D <0x20>;
> +
> +		port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				adv7180_in: endpoint {
> +					remote-endpoint =3D <&composite_con_in>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg =3D <3>;
> +
> +				/*
> +				 * The VIN4 video input path is shared between
> +				 * CVBS and HDMI inputs through SW[49-53]
> +				 * switches.
> +				 *
> +				 * CVBS is the default selection, link it to
> +				 * VIN4 here.
> +				 */
> +				adv7180_out: endpoint {
> +					remote-endpoint =3D <&vin4_in>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &i2c1 {
> @@ -246,3 +294,23 @@
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
