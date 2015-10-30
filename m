From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Fri, 30 Oct 2015 11:34:42 +0100
Message-ID: <20151030113442.1ad381f9103aa052f929d4a9@free.fr>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
	<1445964626-6484-6-git-send-email-jenskuske@gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBRUPZWYQKGQEMUSLA6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445964626-6484-6-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 27 Oct 2015 17:50:25 +0100
Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The Allwinner H3 is a home entertainment system oriented SoC with
> four Cortex-A7 cores and a Mali-400MP2 GPU.
>=20
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 482 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 482 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
.dtsi
> new file mode 100644
> index 0000000..c18b5f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
	[snip]
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		dma: dma-controller@01c02000 {
> +			compatible =3D "allwinner,sun8i-h3-dma";
> +			reg =3D <0x01c02000 0x1000>;
> +			interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&bus_gates 6>;
> +			resets =3D <&bus_rst 6>;
> +			#dma-cells =3D <1>;
> +		};
	[snip]
> +
> +		bus_rst: reset@01c202c0 {
> +			#reset-cells =3D <1>;
> +			compatible =3D "allwinner,sun8i-h3-bus-reset";
> +			reg =3D <0x01c202c0 0x1c>;
> +		};
> +
	[snip]
> +		uart0: serial@01c28000 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c28000 0x400>;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&bus_gates 112>;
> +			resets =3D <&bus_rst 144>;
> +			dmas =3D <&dma 6>, <&dma 6>;
> +			dma-names =3D "rx", "tx";
> +			status =3D "disabled";
> +		};

The reset definitions would be clearer with declarations as the other
Allwinner SoCs and without driver hack:

soc {
	compatible =3D "simple-bus";
	#address-cells =3D <1>;
	#size-cells =3D <1>;
	ranges;

		dma: dma-controller@01c02000 {
		compatible =3D "allwinner,sun8i-h3-dma";
		reg =3D <0x01c02000 0x1000>;
		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
		clocks =3D <&bus_gates 6>;
		resets =3D <&rst_reg0 6>;
		#dma-cells =3D <1>;
	};
    ...
	rst_reg0: reset@01c202c0 {
		#reset-cells =3D <1>;
		compatible =3D "allwinner,sun6i-a31-clock-reset";
		reg =3D <0x01c202c0 0x04>;
	};
	...
 	rst_reg4: reset@01c202d8 {
		#reset-cells =3D <1>;
		compatible =3D "allwinner,sun6i-a31-clock-reset";
		reg =3D <0x01c202d8 0x04>;
	};
   ...
	uart0: serial@01c28000 {
		compatible =3D "snps,dw-apb-uart";
		reg =3D <0x01c28000 0x400>;
		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
		reg-shift =3D <2>;
		reg-io-width =3D <4>;
		clocks =3D <&bus_gates 112>;
		resets =3D <&rst_reg4 16>;
		dmas =3D <&dma 6>, <&dma 6>;
		dma-names =3D "rx", "tx";
		status =3D "disabled";
	};

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
