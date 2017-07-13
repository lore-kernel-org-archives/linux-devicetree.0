From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v5 2/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Date: Thu, 13 Jul 2017 19:23:58 +0000
Message-ID: <20170713192358.GB22375@plaes.org>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <65066c74b8dedfeb8de27d90b5fecfea3a700178.1499197129.git-series.plaes@plaes.org>
 <5099cd90-e019-8a65-38e5-02b3c939a7a8@schinagl.nl>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBTURT7FQKGQEARA354A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5099cd90-e019-8a65-38e5-02b3c939a7a8-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 10, 2017 at 11:45:32AM +0200, Olliver Schinagl wrote:
> Hi Pleas,
>=20
> again, but this time with content :)
>=20
> On 04-07-17 22:04, Priit Laes wrote:
> >Introduce a clock controller driver for sun4i A10 and sun7i A20
> >series SoCs.

[ ... ]

> >+++ b/drivers/clk/sunxi-ng/Kconfig
> >@@ -11,6 +11,19 @@ config SUN50I_A64_CCU
> > 	default ARM64 && ARCH_SUNXI
> > 	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
> >
> >+config SUNXI_A10_CCU
> I understand why you say sunXi here (it's support for both sun4i and sun7=
i)
> but then why A10, as it also supports the A20.
>=20
> I guess the CCU is identical on the A20 and the A10, right? Thus would it
> not be sensible to just call it sun4i_ccu (like we do for sun5i_ccu below=
?

No, it's not identical.

> >+	bool "Support for the Allwinner A10/A20 CCU"
> >+	select SUNXI_CCU_DIV
> >+	select SUNXI_CCU_MULT
> >+	select SUNXI_CCU_NK
> >+	select SUNXI_CCU_NKM
> >+	select SUNXI_CCU_NM
> >+	select SUNXI_CCU_MP
> >+	select SUNXI_CCU_PHASE
> >+	default MACH_SUN4I
> >+	default MACH_SUN7I
> >+	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
> >+
> > config SUN5I_CCU
> > 	bool "Support for the Allwinner sun5i family CCM"
> > 	default MACH_SUN5I
> >@@ -57,4 +70,5 @@ config SUN8I_R_CCU
> > 	bool "Support for Allwinner SoCs' PRCM CCUs"
> > 	default MACH_SUN8I || (ARCH_SUNXI && ARM64)
> >
> >+
> oops?

OK

>=20
> >new file mode 100644
> >index 0000000..49052b7
> >--- /dev/null
> >+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
>=20
> <snip>
>=20
> >+static const char *const apb1_parents[] =3D { "hosc", "pll-periph", "os=
c32k" };
> >+static SUNXI_CCU_MP_WITH_MUX(apb1_clk, "apb1", apb1_parents, 0x058,
> >+			     0, 5,	/* M */
> >+			     16, 2,	/* P */
> >+			     24, 2,	/* mux */
> >+			     0);
> >+
> >+/* Not present on A20 */
> >+static SUNXI_CCU_GATE(axi_dram_clk,	"axi-dram",	"ahb",
> >+		      0x05c, BIT(31), 0);
>=20
> Same here I guess, two defines make this a bit more readable.

You mean SUN4I_CCU_GATE? and SUN7I_CCU_GATE defines?
I don't think it makes things more readable...

> >+
> >+static SUNXI_CCU_GATE(ahb_otg_clk,	"ahb-otg",	"ahb",
...
> >+		      0x060, BIT(14), CLK_IS_CRITICAL);
>=20
> <snip>
>=20
> >+static struct ccu_reset_map sun7i_a20_ccu_resets[] =3D {
> >+	[RST_USB_PHY0]		=3D { 0x0cc, BIT(0) },
> >+	[RST_USB_PHY1]		=3D { 0x0cc, BIT(1) },
> >+	[RST_USB_PHY2]		=3D { 0x0cc, BIT(2) },
> >+	[RST_GPS]		=3D { 0x0d0, BIT(0) },
> >+	[RST_DE_BE0]		=3D { 0x104, BIT(30) },
> >+	[RST_DE_BE1]		=3D { 0x108, BIT(30) },
> >+	[RST_DE_FE0]		=3D { 0x10c, BIT(30) },
> >+	[RST_DE_FE1]		=3D { 0x110, BIT(30) },
> >+	[RST_DE_MP]		=3D { 0x114, BIT(30) },
> >+	[RST_TCON0]		=3D { 0x118, BIT(30) },
> >+	[RST_TCON1]		=3D { 0x11c, BIT(30) },
> You are missing the TV encoder reset:
> +      [RST_TVE0]              =3D { 0x118, BIT(29) },
> +      [RST_TVE1]              =3D { 0x11c, BIT(29) },
>=20
> (to match your table i did not use defines :p)

Where did you get this information?
This is not present in any datasheets I have:
  * A10 - 1.50
  * A20 - 1.4

[...]

P=C3=A4ikest,
Priit Laes

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
