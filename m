From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Thu, 22 Oct 2015 19:30:14 +0200
Message-ID: <20151022193014.59dde965@OPI2>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
	<1445444428-4652-2-git-send-email-jenskuske@gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBN52USYQKGQEXVVEUEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445444428-4652-2-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Oct 2015 18:20:27 +0200
Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The Allwinner H3 is a home entertainment system oriented SoC with
> four Cortex-A7 cores and a Mali-400MP2 GPU.
>=20
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 499 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 499 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
.dtsi
> new file mode 100644
> index 0000000..4114e17
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -0,0 +1,499 @@
	[snip]
> +		pll6: clk@01c20028 {
> +			#clock-cells =3D <1>;
> +			compatible =3D "allwinner,sun6i-a31-pll6-clk";
> +			reg =3D <0x01c20028 0x4>;
> +			clocks =3D <&osc24M>;
> +			clock-output-names =3D "pll6", "pll6x2", "pll6d2";
> +		};
> +
> +		pll8: clk@01c20044 {
> +			#clock-cells =3D <0>;

Should be <1>

> +			compatible =3D "allwinner,sun6i-a31-pll6-clk";
> +			reg =3D <0x01c20044 0x4>;
> +			clocks =3D <&osc24M>;
> +			clock-output-names =3D "pll8", "pll8x2";
> +		};
> +
> +		cpu: cpu_clk@01c20050 {
> +			#clock-cells =3D <0>;
> +			compatible =3D "allwinner,sun4i-a10-cpu-clk";
> +			reg =3D <0x01c20050 0x4>;
> +			clocks =3D <&osc32k>, <&osc24M>, <&pll1>, <&pll1>;
> +			clock-output-names =3D "cpu";
> +		};
	[snip]

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
