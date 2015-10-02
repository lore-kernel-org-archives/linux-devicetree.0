From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: berlin4ct: add default pinmux for
 uart0
Date: Fri, 2 Oct 2015 15:26:05 +0200
Message-ID: <20151002132605.GF3162@kwain>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
 <1442829860-4647-7-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442829860-4647-7-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jisheng,

Please s/urt/uart/ in this patch.

Thanks!

Antoine

On Mon, Sep 21, 2015 at 06:04:20PM +0800, Jisheng Zhang wrote:
> Add urt0 txd and rxd muxing setup in the dtsi because uart0 always us=
es
> them to work, no other possibilities.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/=
boot/dts/marvell/berlin4ct.dtsi
> index c374f1d..e9409ec 100644
> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -288,12 +288,19 @@
>  				clocks =3D <&osc>;
>  				reg-shift =3D <2>;
>  				status =3D "disabled";
> +				pinctrl-0 =3D <&urt0_pmux>;
> +				pinctrl-names =3D "default";
>  			};
>  		};
> =20
>  		sm_pinctrl: pinctrl@fe2200 {
>  			compatible =3D "marvell,berlin4ct-sm-pinctrl";
>  			reg =3D <0xfe2200 0xc>;
> +
> +			urt0_pmux: urt0-pmux {
> +				groups =3D "SM_URT0_TXD", "SM_URT0_RXD";
> +				function =3D "urt0";
> +			};
>  		};
>  	};
>  };
> --=20
> 2.5.3
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
