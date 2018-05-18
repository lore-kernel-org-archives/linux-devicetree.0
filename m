From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: draak: Describe HDMI input
Date: Fri, 18 May 2018 18:13:06 +0300
Message-ID: <2264361.MLIkrGFxG7@avalon>
References: <1526654878-11143-1-git-send-email-jacopo+renesas@jmondi.org> <1526654878-11143-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526654878-11143-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Friday, 18 May 2018 17:47:58 EEST Jacopo Mondi wrote:
> Describe HDMI input connector and ADV7612 HDMI decoder installed on
> R-Car Gen3 Draak board.
>=20
> The video signal routing to the HDMI decoder to the video input interface
> VIN4 is multiplexed with CVBS input path, and enabled/disabled through
> on-board switches SW-49, SW-50, SW-51 and SW-52.
>=20
> As the default board switches configuration connects CVBS input to VIN4,
> leave the HDMI decoder unconnected in DTS.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2 -> v3:
> - Add comment on HDMI output port about the shared CVBS/HDMI video path
> - Add Niklas' R-b tag
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 48 ++++++++++++++++++++=
+++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index 95745fc..1e475a4
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -59,6 +59,17 @@
>  		};
>  	};
>=20
> +	hdmi-in {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&adv7612_in>;
> +			};
> +		};
> +	};
> +
>  	memory@48000000 {
>  		device_type =3D "memory";
>  		/* first 128MB is reserved for secure area. */
> @@ -176,6 +187,43 @@
>  			};
>  		};
>  	};
> +
> +	hdmi-decoder@4c {
> +		compatible =3D "adi,adv7612";
> +		reg =3D <0x4c>;
> +		default-input =3D <0>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				adv7612_in: endpoint {
> +					remote-endpoint =3D <&hdmi_con_in>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				/*
> +				 * The VIN4 video input path is shared between
> +				 * CVBS and HDMI inputs through SW[49-54]
> +				 * switches.
> +				 *
> +				 * CVBS is the default selection, leave HDMI
> +				 * not connected here.
> +				 */
> +				adv7612_out: endpoint {
> +					pclk-sample =3D <0>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &i2c1 {

=2D-=20
Regards,

Laurent Pinchart
