From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: eagle: Enable HDMI output
Date: Tue, 10 Apr 2018 15:39:26 +0300
Message-ID: <3323439.zBQ8E5gyW2@avalon>
References: <1523357646-3946-1-git-send-email-jacopo+renesas@jmondi.org> <1523357646-3946-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523357646-3946-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tuesday, 10 April 2018 13:54:06 EEST Jacopo Mondi wrote:
> Enable HDMI output on Renesas R-Car V3M Eagle board.
>=20
> The HDMI output is enabled connecting the DU LVDS output to the
> transparent LVDS converter THC63LVD1024, and successively routing its
> RGB output to the ADV7511W HDMI encoder.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> [for THC63LVD1024: ]
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>=20
> ---
> v1 -> v2:
> - Squash patches [5/7], [6/7] and [7/7] of v1 in a single patch as
>   suggested by Laurent
> - Remove DU pinmuxing as it is used for DU parallel RGB output only used
>   by Eagle's display expander board not enabled by this series.
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 93 ++++++++++++++++++++=
+++
>  1 file changed, 93 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts index 3c5f598..1e2191d
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -31,6 +31,51 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg =3D <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	hdmi-out {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint =3D <&adv7511_out>;
> +			};
> +		};
> +	};
> +
> +	d3p3: regulator-fixed {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "fixed-3.3V";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	thc63lvd1024: lvds-decoder {

Nitpicking, no need for a label, you never reference it.

Apart from that, you can keep my Reviewed-by.

> +		compatible =3D "thine,thc63lvd1024";
> +
> +		vcc-supply =3D <&d3p3>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				thc63lvd1024_in: endpoint {
> +					remote-endpoint =3D <&lvds0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +				thc63lvd1024_out: endpoint {
> +					remote-endpoint =3D <&adv7511_in>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &avb {
> @@ -68,6 +113,38 @@
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  	};
> +
> +	hdmi@39 {
> +		compatible =3D "adi,adv7511w";
> +		reg =3D <0x39>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +
> +		adi,input-depth =3D <8>;
> +		adi,input-colorspace =3D "rgb";
> +		adi,input-clock =3D "1x";
> +		adi,input-style =3D <1>;
> +		adi,input-justification =3D "evenly";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint =3D <&thc63lvd1024_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint =3D <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &pfc {
> @@ -93,3 +170,19 @@
>=20
>  	status =3D "okay";
>  };
> +
> +&du {
> +	status =3D "okay";
> +};
> +
> +&lvds0 {
> +	status =3D "okay";
> +
> +	ports {
> +		port@1 {
> +			lvds0_out: endpoint {
> +				remote-endpoint =3D <&thc63lvd1024_in>;
> +			};
> +		};
> +	};
> +};

=2D-=20
Regards,

Laurent Pinchart
