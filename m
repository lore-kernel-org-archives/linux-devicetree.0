From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: berlin4ct: add default pinmux for
 uart0
Date: Fri, 9 Oct 2015 11:07:28 +0200
Message-ID: <20151009090728.GF2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-7-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-7-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 04:17:09PM +0800, Jisheng Zhang wrote:
> Add urt0 txd and rxd muxing setup in the dtsi because uart0 always us=
es
> them to work, no other possibilities.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

> ---
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/=
boot/dts/marvell/berlin4ct.dtsi
> index 8e66355..a4a1876 100644
> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -288,12 +288,19 @@
>  				clocks =3D <&osc>;
>  				reg-shift =3D <2>;
>  				status =3D "disabled";
> +				pinctrl-0 =3D <&uart0_pmux>;
> +				pinctrl-names =3D "default";
>  			};
>  		};
> =20
>  		system_pinctrl: pin-controller@fe2200 {
>  			compatible =3D "marvell,berlin4ct-system-pinctrl";
>  			reg =3D <0xfe2200 0xc>;
> +
> +			uart0_pmux: uart0-pmux {
> +				groups =3D "SM_URT0_TXD", "SM_URT0_RXD";
> +				function =3D "uart0";
> +			};
>  		};
>  	};
>  };
> --=20
> 2.6.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
