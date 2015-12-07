From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Mon, 7 Dec 2015 09:12:57 +0100
Message-ID: <20151207091257.070723b67db726d9f05c6550@free.fr>
References: <1449264283-25360-1-git-send-email-jenskuske@gmail.com>
	<1449264283-25360-4-git-send-email-jenskuske@gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBDX7SSZQKGQEP7NWX3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449264283-25360-4-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri,  4 Dec 2015 22:24:42 +0100
Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The Allwinner H3 is a home entertainment system oriented SoC with
> four Cortex-A7 cores and a Mali-400MP2 GPU.
>=20
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 497 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 497 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
.dtsi
> new file mode 100644
> index 0000000..1524130e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -0,0 +1,497 @@
	[snip]
> +		bus_gates: clk@01c20060 {
> +			#clock-cells =3D <1>;
> +			compatible =3D "allwinner,sun8i-h3-bus-gates-clk";
> +			reg =3D <0x01c20060 0x14>;
> +			clocks =3D <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
> +			clock-names =3D "ahb1", "ahb2", "apb1", "apb2";
> +			clock-indices =3D <5>, <6>, <8>,
> +					<9>, <10>, <13>,
> +					<14>, <17>, <18>,
> +					<19>, <20>,
> +					<21>, <23>,
> +					<24>, <25>,
> +					<26>, <27>,
> +					<28>, <29>,
> +					<30>, <31>, <32>,
> +					<35>, <36>, <37>,
> +					<40>, <41>, <43>,
> +					<44>, <52>, <53>,
> +					<54>, <64>,
> +					<65>, <69>, <72>,
> +					<76>, <77>, <78>,
> +					<96>, <97>, <98>,
> +					<112>, <113>,
> +					<114>, <115>,
> +					<116>, <128>, <135>;
> +			clock-output-names =3D "bus_ce", "bus_dma", "bus_mmc0",
> +					     "bus_mmc1", "bus_mmc2", "bus_nand",
> +					     "bus_sdram", "bus_gmac", "bus_ts",
> +					     "bus_hstimer", "bus_spi0",
> +					     "bus_spi1", "bus_otg",
> +					     "bus_otg_ehci0", "bus_ehci1",
> +					     "bus_ehci2", "bus_ehci3",
> +					     "bus_otg_ohci0", "bus_ohci1",
> +					     "bus_ohci2", "bus_ohci3", "bus_ve",
> +					     "bus_lcd0", "bus_lcd1", "bus_deint",

The tcon1 clock is used by both lcd0 and lcd1, while the tcon0 clock is use=
d for TV output from lcd1, so, this should be:

	"bus_tcon0", "bus_tcon1", "bus_deint",

(the tcon1 clock is used by both lcd0 and lcd1, while
 the tcon0 clock is used for TV output from lcd1)

> +					     "bus_csi", "bus_tve", "bus_hdmi",
> +					     "bus_de", "bus_gpu", "bus_msgbox",
> +					     "bus_spinlock", "bus_codec",
> +					     "bus_spdif", "bus_pio", "bus_ths",
> +					     "bus_i2s0", "bus_i2s1", "bus_i2s2",
> +					     "bus_i2c0", "bus_i2c1", "bus_i2c2",
> +					     "bus_uart0", "bus_uart1",
> +					     "bus_uart2", "bus_uart3",
> +					     "bus_scr", "bus_ephy", "bus_dbg";
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
