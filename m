From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: berlin4ct: add the pinctrl node
Date: Fri, 2 Oct 2015 15:24:54 +0200
Message-ID: <20151002132454.GE3162@kwain>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
 <1442829860-4647-6-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442829860-4647-6-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jisheng,

On Mon, Sep 21, 2015 at 06:04:19PM +0800, Jisheng Zhang wrote:
> Add the avio, soc, sm pinctrl nodes for Marvell berlin4ct SoC.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/=
boot/dts/marvell/berlin4ct.dtsi
> index a3b5f1d..c374f1d 100644
> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -225,6 +225,16 @@
>  			};
>  		};
> =20
> +		soc_pinctrl: pinctrl@ea8000 {

We tend to use "pin-controller@" instead of "pinctrl@" in Berlin device
trees.

> +			compatible =3D "marvell,berlin4ct-soc-pinctrl";
> +			reg =3D <0xea8000 0x14>;
> +		};
> +
> +		avio_pinctrl: pinctrl@ea8400 {

Ditto.

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
> +		sm_pinctrl: pinctrl@fe2200 {

Ditto.

> +			compatible =3D "marvell,berlin4ct-sm-pinctrl";
> +			reg =3D <0xfe2200 0xc>;
> +		};
>  	};
>  };

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
