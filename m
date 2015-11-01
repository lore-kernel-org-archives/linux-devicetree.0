From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Sun, 1 Nov 2015 10:48:59 +0100
Message-ID: <20151101094859.GR6114@lukather>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-6-git-send-email-jenskuske@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpcCHpaCAbC4X43d"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445964626-6484-6-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--LpcCHpaCAbC4X43d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2015 at 05:50:25PM +0100, Jens Kuske wrote:
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
> +					<114>, <115>, <116>,
> +					<128>, <135>;
> +			clock-output-names =3D "ahb1_ce", "ahb1_dma", "ahb1_mmc0",
> +					"ahb1_mmc1", "ahb1_mmc2", "ahb1_nand",
> +					"ahb1_sdram", "ahb2_gmac", "ahb1_ts",
> +					"ahb1_hstimer", "ahb1_spi0",
> +					"ahb1_spi1", "ahb1_otg",
> +					"ahb1_otg_ehci0", "ahb1_ehic1",
> +					"ahb1_ehic2", "ahb1_ehic3",
> +					"ahb1_otg_ohci0", "ahb2_ohic1",
> +					"ahb2_ohic2", "ahb2_ohic3", "ahb1_ve",
> +					"ahb1_lcd0", "ahb1_lcd1", "ahb1_deint",
> +					"ahb1_csi", "ahb1_tve", "ahb1_hdmi",
> +					"ahb1_de", "ahb1_gpu", "ahb1_msgbox",
> +					"ahb1_spinlock", "apb1_codec",
> +					"apb1_spdif", "apb1_pio", "apb1_ths",
> +					"apb1_i2s0", "apb1_i2s1", "apb1_i2s2",
> +					"apb2_i2c0", "apb2_i2c1", "apb2_i2c2",
> +					"apb2_uart0", "apb2_uart1",
> +					"apb2_uart2", "apb2_uart3", "apb2_scr",
> +					"ahb1_ephy", "ahb1_dbg";
> +		};

Having the bus clocks called bus_* would make more sense I guess, or
at least it would match the datasheet names (as obscure as they are).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--LpcCHpaCAbC4X43d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWNeALAAoJEBx+YmzsjxAgY/QP/30EzXW6D0hMxuHM5/PwZzkP
ponPYREX4kxibPRYa4OJBkC64oczVvxdWCnYktQkkTpgcKAcsiLUJklvQoAfxfwV
4KAPggZoLqJIqyxzB71sW6LWfI4j01OiricAHWhpizYLoTCepXygferD+KQr0Z1g
AFUJcQ02Llx4E9mughg4GMLaW4B9cx772UTb4ZubnokytvKpNqe4OJlTudjpPFwL
We4FjF1kisFdtcGsSHEy6Pf4GzajXQ+Kn5tdUjwkocFolkTo9Al00Yw0qJlakxHS
2wqxcZSLGk9pNwLdsrJ9U0qRBGLZSrVjDo1njU+VI/7ZMAqNWfpZWY7juF1MrbCM
zQoqArJ5tOzwUPwBGqKPlfUWzZuAiP/Bqjwg2NPrdf+/fCJvamxnBQCmIoVjXcEi
pnMn7Ayk9tQwvUB1iT0tfEaVDjEtqbrf7BFqgeTkcJFqHcdNNbzB0lqdzY/Gr53T
ziwV4d/hpbA2W+3vXQ9Z7yEuDucIS6TU+kIq55Y4F30XUBiYVriohJxHWYk9cdjv
zuHaKJ5gC2YGA779L569SJdjLZn59UFPrWjA2iINKj+4Eh5rdk4nEsg4/Gk7S8fw
SnGBuuq/lZ+n3JXjldTMK5mRFCYC1Xx0TURDd+fUH1wrU2Eofc6bNkWQNYj03HH0
yOzyVOQ3ggmUEoXgO22T
=G77V
-----END PGP SIGNATURE-----

--LpcCHpaCAbC4X43d--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
