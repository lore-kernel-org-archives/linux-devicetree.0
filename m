From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: berlin4ct: add the pinctrl node
Date: Fri, 9 Oct 2015 11:06:40 +0200
Message-ID: <20151009090640.GE2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-6-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-6-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 04:17:08PM +0800, Jisheng Zhang wrote:
> Add the avio, soc, sm pinctrl nodes for Marvell berlin4ct SoC.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

> ---
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/=
boot/dts/marvell/berlin4ct.dtsi
> index a3b5f1d..8e66355 100644
> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -225,6 +225,16 @@
>  			};
>  		};
> =20
> +		soc_pinctrl: pin-controller@ea8000 {
> +			compatible =3D "marvell,berlin4ct-soc-pinctrl";
> +			reg =3D <0xea8000 0x14>;
> +		};
> +
> +		avio_pinctrl: pin-controller@ea8400 {
> +			compatible =3D "marvell,berlin4ct-avio-pinctrl";
> +			reg =3D <0xea8400 0x8>;
> +		};
> +
>  		apb@fc0000 {
>  			compatible =3D "simple-bus";
>  			#address-cells =3D <1>;
> @@ -280,5 +290,10 @@
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		system_pinctrl: pin-controller@fe2200 {
> +			compatible =3D "marvell,berlin4ct-system-pinctrl";
> +			reg =3D <0xfe2200 0xc>;
> +		};
>  	};
>  };
> --=20
> 2.6.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
