Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
In-Reply-To: <20150727055232.GW18700@pengutronix.de>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	<1437706925-3222-3-git-send-email-jamesjj.liao@mediatek.com>
	<CAGS+omC=84oWFcv1Eumsj6FHzSQc+Ba9zVOn6USS9ymQS3mTSQ@mail.gmail.com>
	<20150727055232.GW18700@pengutronix.de>
Date: Mon, 27 Jul 2015 14:19:41 +0800
Message-ID: <CAGS+omDjr6d9=+d-uphrENu3Kenr8QUc3VgbaWTd45wqWzi7tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] clk: mediatek: Fix rate and dependency of MT8173 clocks
From: Daniel Kurtz <djkurtz@google.com>
Content-Type: multipart/alternative; boundary=001a114c78acdb09ac051bd55641
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>, Mike Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream <srv_heupstream@mediatek.com>, Heiko Stubner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ricky Liang <jcliang@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--001a114c78acdb09ac051bd55641
Content-Type: text/plain; charset=UTF-8

On Jul 27, 2015 12:52, "Sascha Hauer" <s.hauer@pengutronix.de> wrote:
>
> On Fri, Jul 24, 2015 at 07:10:14PM +0800, Daniel Kurtz wrote:
> > On Fri, Jul 24, 2015 at 11:02 AM, James Liao <jamesjj.liao@mediatek.com>
wrote:
> > > Remove the dependency from clk_null, and give all root clocks a
> > > typical rate, include clkph_mck_o, usb_syspll_125m and hdmitx_dig_cts.
> > >
> > > dpi_ck was removed due to no clock reference to it.
> > >
> > > Replace parent clock of infra_cpum with cpum_ck, which is an external
> > > clock and can be defined in the deivce tree.
> > >
> > > Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> > > ---
> > >  drivers/clk/mediatek/clk-mt8173.c      | 13 ++++++-------
> > >  include/dt-bindings/clock/mt8173-clk.h |  1 -
> > >  2 files changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/clk/mediatek/clk-mt8173.c
b/drivers/clk/mediatek/clk-mt8173.c
> > > index 4b9e04c..50b3266 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173.c
> > > @@ -24,11 +24,9 @@
> > >
> > >  static DEFINE_SPINLOCK(mt8173_clk_lock);
> > >
> > > -static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
> > > -       FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
> > > -       FACTOR(CLK_TOP_DPI, "dpi_ck", "clk_null", 1, 1),
> > > -       FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m",
"clk_null", 1, 1),
> > > -       FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null",
1, 1),
> > > +static const struct mtk_fixed_clk fixed_clks[] __initconst = {
> > > +       FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 *
MHZ),
> > > +       FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m",
"clk26m", 125 * MHZ),
> > >  };
> > >
> > >  static const struct mtk_fixed_factor top_divs[] __initconst = {
> > > @@ -53,6 +51,7 @@ static const struct mtk_fixed_factor top_divs[]
__initconst = {
> > >         FACTOR(CLK_TOP_CLKRTC_INT, "clkrtc_int", "clk26m", 1, 793),
> > >         FACTOR(CLK_TOP_FPC, "fpc_ck", "clk26m", 1, 1),
> > >
> > > +       FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts",
"tvdpll_445p5m", 1, 3),
> > >         FACTOR(CLK_TOP_HDMITXPLL_D2, "hdmitxpll_d2",
"hdmitx_dig_cts", 1, 2),
> > >         FACTOR(CLK_TOP_HDMITXPLL_D3, "hdmitxpll_d3",
"hdmitx_dig_cts", 1, 3),
> > >
> > > @@ -611,7 +610,7 @@ static const struct mtk_gate infra_clks[]
__initconst = {
> > >         GATE_ICG(CLK_INFRA_GCE, "infra_gce", "axi_sel", 6),
> > >         GATE_ICG(CLK_INFRA_L2C_SRAM, "infra_l2c_sram", "axi_sel", 7),
> > >         GATE_ICG(CLK_INFRA_M4U, "infra_m4u", "mem_sel", 8),
> > > -       GATE_ICG(CLK_INFRA_CPUM, "infra_cpum", "clk_null", 15),
> > > +       GATE_ICG(CLK_INFRA_CPUM, "infra_cpum", "cpum_ck", 15),
> > >         GATE_ICG(CLK_INFRA_KP, "infra_kp", "axi_sel", 16),
> > >         GATE_ICG(CLK_INFRA_CEC, "infra_cec", "clk26m", 18),
> > >         GATE_ICG(CLK_INFRA_PMICSPI, "infra_pmicspi", "pmicspi_sel",
22),
> > > @@ -714,7 +713,7 @@ static void __init mtk_topckgen_init(struct
device_node *node)
> > >
> > >         clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> > >
> > > -       mtk_clk_register_factors(root_clk_alias,
ARRAY_SIZE(root_clk_alias), clk_data);
> > > +       mtk_clk_register_fixed_clks(fixed_clks,
ARRAY_SIZE(fixed_clks), clk_data);
> > >         mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs),
clk_data);
> > >         mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes),
base,
> > >                         &mt8173_clk_lock, clk_data);
> > > diff --git a/include/dt-bindings/clock/mt8173-clk.h
b/include/dt-bindings/clock/mt8173-clk.h
> > > index 4ad76ed..7230c38 100644
> > > --- a/include/dt-bindings/clock/mt8173-clk.h
> > > +++ b/include/dt-bindings/clock/mt8173-clk.h
> > > @@ -18,7 +18,6 @@
> > >  /* TOPCKGEN */
> > >
> > >  #define CLK_TOP_CLKPH_MCK_O            1
> > > -#define CLK_TOP_DPI                    2
> > >  #define CLK_TOP_USB_SYSPLL_125M                3
> >
> > I think we should renumber the rest of the CLK_TOP_*
>
> They shouldn't be renumbered at all as this makes all binary device
> trees out there useless. That may not be a big issue with the MT8173
> at the moment as there are hardly any binary device trees with the
> mainline device trees shipped, but still we should get used to not
> break existing device trees without need.

As you mention, there are no devices shipped with mainline binary device
trees.  So, let's just correct the numbering now while we still can do it
painlessly.  It seems a bit unnecessary to preserve backwards compatibility
when we are still landing basic device support, like the clock tree.

-Dan

>
> Sascha
>
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--001a114c78acdb09ac051bd55641
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 27, 2015 12:52, &quot;Sascha Hauer&quot; &lt;<a href=3D"mailto:s.hau=
er@pengutronix.de">s.hauer@pengutronix.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jul 24, 2015 at 07:10:14PM +0800, Daniel Kurtz wrote:<br>
&gt; &gt; On Fri, Jul 24, 2015 at 11:02 AM, James Liao &lt;<a href=3D"mailt=
o:jamesjj.liao@mediatek.com">jamesjj.liao@mediatek.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Remove the dependency from clk_null, and give all root clock=
s a<br>
&gt; &gt; &gt; typical rate, include clkph_mck_o, usb_syspll_125m and hdmit=
x_dig_cts.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; dpi_ck was removed due to no clock reference to it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Replace parent clock of infra_cpum with cpum_ck, which is an=
 external<br>
&gt; &gt; &gt; clock and can be defined in the deivce tree.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: James Liao &lt;<a href=3D"mailto:jamesjj.liao=
@mediatek.com">jamesjj.liao@mediatek.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/clk/mediatek/clk-mt8173.c=C2=A0 =C2=A0 =C2=A0 =
| 13 ++++++-------<br>
&gt; &gt; &gt;=C2=A0 include/dt-bindings/clock/mt8173-clk.h |=C2=A0 1 -<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 6 insertions(+), 8 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk=
/mediatek/clk-mt8173.c<br>
&gt; &gt; &gt; index 4b9e04c..50b3266 100644<br>
&gt; &gt; &gt; --- a/drivers/clk/mediatek/clk-mt8173.c<br>
&gt; &gt; &gt; +++ b/drivers/clk/mediatek/clk-mt8173.c<br>
&gt; &gt; &gt; @@ -24,11 +24,9 @@<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 static DEFINE_SPINLOCK(mt8173_clk_lock);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -static const struct mtk_fixed_factor root_clk_alias[] __ini=
tconst =3D {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_CLKPH_MCK_O, &quo=
t;clkph_mck_o&quot;, &quot;clk_null&quot;, 1, 1),<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_DPI, &quot;dpi_ck=
&quot;, &quot;clk_null&quot;, 1, 1),<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_USB_SYSPLL_125M, =
&quot;usb_syspll_125m&quot;, &quot;clk_null&quot;, 1, 1),<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_HDMITX_DIG_CTS, &=
quot;hdmitx_dig_cts&quot;, &quot;clk_null&quot;, 1, 1),<br>
&gt; &gt; &gt; +static const struct mtk_fixed_clk fixed_clks[] __initconst =
=3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FIXED_CLK(CLK_TOP_CLKPH_MCK_O, &=
quot;clkph_mck_o&quot;, &quot;clk26m&quot;, 400 * MHZ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FIXED_CLK(CLK_TOP_USB_SYSPLL_125=
M, &quot;usb_syspll_125m&quot;, &quot;clk26m&quot;, 125 * MHZ),<br>
&gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 static const struct mtk_fixed_factor top_divs[] __init=
const =3D {<br>
&gt; &gt; &gt; @@ -53,6 +51,7 @@ static const struct mtk_fixed_factor top_d=
ivs[] __initconst =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_CLKRTC_INT, =
&quot;clkrtc_int&quot;, &quot;clk26m&quot;, 1, 793),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_FPC, &quot;f=
pc_ck&quot;, &quot;clk26m&quot;, 1, 1),<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_HDMITX_DIG_CTS, &=
quot;hdmitx_dig_cts&quot;, &quot;tvdpll_445p5m&quot;, 1, 3),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_HDMITXPLL_D2=
, &quot;hdmitxpll_d2&quot;, &quot;hdmitx_dig_cts&quot;, 1, 2),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FACTOR(CLK_TOP_HDMITXPLL_D3=
, &quot;hdmitxpll_d3&quot;, &quot;hdmitx_dig_cts&quot;, 1, 3),<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -611,7 +610,7 @@ static const struct mtk_gate infra_clks[=
] __initconst =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_GCE, &qu=
ot;infra_gce&quot;, &quot;axi_sel&quot;, 6),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_L2C_SRAM=
, &quot;infra_l2c_sram&quot;, &quot;axi_sel&quot;, 7),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_M4U, &qu=
ot;infra_m4u&quot;, &quot;mem_sel&quot;, 8),<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_CPUM, &quot;i=
nfra_cpum&quot;, &quot;clk_null&quot;, 15),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_CPUM, &quot;i=
nfra_cpum&quot;, &quot;cpum_ck&quot;, 15),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_KP, &quo=
t;infra_kp&quot;, &quot;axi_sel&quot;, 16),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_CEC, &qu=
ot;infra_cec&quot;, &quot;clk26m&quot;, 18),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GATE_ICG(CLK_INFRA_PMICSPI,=
 &quot;infra_pmicspi&quot;, &quot;pmicspi_sel&quot;, 22),<br>
&gt; &gt; &gt; @@ -714,7 +713,7 @@ static void __init mtk_topckgen_init(str=
uct device_node *node)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_data =3D mtk_alloc_clk_=
data(CLK_TOP_NR_CLK);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_clk_register_factors(root_cl=
k_alias, ARRAY_SIZE(root_clk_alias), clk_data);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_clk_register_fixed_clks(fixe=
d_clks, ARRAY_SIZE(fixed_clks), clk_data);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_clk_register_factors(to=
p_divs, ARRAY_SIZE(top_divs), clk_data);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_clk_register_composites=
(top_muxes, ARRAY_SIZE(top_muxes), base,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mt8173_clk_lock, clk_data);<br>
&gt; &gt; &gt; diff --git a/include/dt-bindings/clock/mt8173-clk.h b/includ=
e/dt-bindings/clock/mt8173-clk.h<br>
&gt; &gt; &gt; index 4ad76ed..7230c38 100644<br>
&gt; &gt; &gt; --- a/include/dt-bindings/clock/mt8173-clk.h<br>
&gt; &gt; &gt; +++ b/include/dt-bindings/clock/mt8173-clk.h<br>
&gt; &gt; &gt; @@ -18,7 +18,6 @@<br>
&gt; &gt; &gt;=C2=A0 /* TOPCKGEN */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 #define CLK_TOP_CLKPH_MCK_O=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 1<br>
&gt; &gt; &gt; -#define CLK_TOP_DPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; &gt; &gt;=C2=A0 #define CLK_TOP_USB_SYSPLL_125M=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt; &gt;<br>
&gt; &gt; I think we should renumber the rest of the CLK_TOP_*<br>
&gt;<br>
&gt; They shouldn&#39;t be renumbered at all as this makes all binary devic=
e<br>
&gt; trees out there useless. That may not be a big issue with the MT8173<b=
r>
&gt; at the moment as there are hardly any binary device trees with the<br>
&gt; mainline device trees shipped, but still we should get used to not<br>
&gt; break existing device trees without need.</p>
<p dir=3D"ltr">As you mention, there are no devices shipped with mainline b=
inary device trees.=C2=A0 So, let&#39;s just correct the numbering now whil=
e we still can do it painlessly.=C2=A0 It seems a bit unnecessary to preser=
ve backwards compatibility when we are still landing basic device support, =
like the clock tree.</p>
<p dir=3D"ltr">-Dan</p>
<p dir=3D"ltr">&gt;<br>
&gt; Sascha<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Pengutronix e.K.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
&gt; Industrial Linux Solutions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| <a href=3D"http://www.pengutronix.de/">http://www.pen=
gutronix.de/</a>=C2=A0 |<br>
&gt; Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
=C2=A0 =C2=A0 |<br>
&gt; Amtsgericht Hildesheim, HRA 2686=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| Fax:=C2=A0 =C2=A0+49-5121-206917-5555 |<br>
</p>

--001a114c78acdb09ac051bd55641--
