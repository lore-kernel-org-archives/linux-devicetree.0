Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1435633127-31952-5-git-send-email-jamesjj.liao@mediatek.com>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com> <1435633127-31952-5-git-send-email-jamesjj.liao@mediatek.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Wed, 1 Jul 2015 23:22:12 +0800
Message-ID: <CAGS+omBRAJVN3uPYn9YdKZ3VBj61c-rpY_cNgnK6x9U0uJBPYw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS
Content-Type: multipart/alternative; boundary=001a114904863c3fde0519d1e496
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, srv_heupstream <srv_heupstream@mediatek.com>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a114904863c3fde0519d1e496
Content-Type: text/plain; charset=UTF-8

Hi James,

This looks like 3 separate gate clocks in a chain, with a timing
constraint: USB_LPF must be enabled 100 us after USB_TX.

  26MHz--> [GATE] --USB_TX--> [LPF] --USB_LPF--> [GATE] --USB_OUT-->
            ^                  ^                  ^
            +--------------+   |                  |
AP_PLL_CON2.REF2USB_TX_EN -+   |                  |
AP_PLL_CON2.REF2USB_TX_LPF_EN -+                  |
AP_PLL_CON2.REF2USB_TX_OUT_EN --------------------+


I think we can model the gate parts using a proper clock tree model and the
existing clock gate semantics.
I'm not sure the best way to model the delay; but in theory that could be
handled by the clock user (USB driver).

-Dan

On Tue, Jun 30, 2015 at 10:58 AM, James Liao <jamesjj.liao@mediatek.com>
wrote:
> Add REF2USB_TX clock support into MT8173 APMIXEDSYS. This clock
> is needed by USB 3.0.
>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8173.c      | 143
+++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.c         |   7 +-
>  include/dt-bindings/clock/mt8173-clk.h |   3 +-
>  3 files changed, 146 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173.c
b/drivers/clk/mediatek/clk-mt8173.c
> index 75be757..333b6af 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -12,6 +12,7 @@
>   * GNU General Public License for more details.
>   */
>
> +#include <linux/delay.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/slab.h>
> @@ -968,6 +969,141 @@ static void __init mtk_pericfg_init(struct
device_node *node)
>  }
>  CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8173-pericfg", mtk_pericfg_init);
>
> +#define REF2USB_TX_EN          BIT(0)
> +#define REF2USB_TX_LPF_EN      BIT(1)
> +#define REF2USB_TX_OUT_EN      BIT(2)
> +#define REF2USB_EN_MASK                (REF2USB_TX_EN |
REF2USB_TX_LPF_EN | \
> +                                REF2USB_TX_OUT_EN)
> +
> +struct mtk_ref2usb_tx {
> +       struct clk_hw   hw;
> +       void __iomem    *base_addr;
> +};
> +
> +static inline struct mtk_ref2usb_tx *to_mtk_ref2usb_tx(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct mtk_ref2usb_tx, hw);
> +}
> +
> +static int mtk_ref2usb_tx_is_prepared(struct clk_hw *hw)
> +{
> +       struct mtk_ref2usb_tx *tx = to_mtk_ref2usb_tx(hw);
> +
> +       return (readl(tx->base_addr) & REF2USB_EN_MASK) ==
REF2USB_EN_MASK;
> +}
> +
> +static int mtk_ref2usb_tx_prepare(struct clk_hw *hw)
> +{
> +       struct mtk_ref2usb_tx *tx = to_mtk_ref2usb_tx(hw);
> +       u32 val;
> +
> +       val = readl(tx->base_addr);
> +
> +       val |= REF2USB_TX_EN;
> +       writel(val, tx->base_addr);
> +       udelay(100);
> +
> +       val |= REF2USB_TX_LPF_EN;
> +       writel(val, tx->base_addr);
> +
> +       val |= REF2USB_TX_OUT_EN;
> +       writel(val, tx->base_addr);
> +
> +       return 0;
> +}
> +
> +static void mtk_ref2usb_tx_unprepare(struct clk_hw *hw)
> +{
> +       struct mtk_ref2usb_tx *tx = to_mtk_ref2usb_tx(hw);
> +       u32 val;
> +
> +       val = readl(tx->base_addr);
> +       val &= ~REF2USB_EN_MASK;
> +       writel(val, tx->base_addr);
> +}
> +
> +static const struct clk_ops mtk_ref2usb_tx_ops = {
> +       .is_prepared    = mtk_ref2usb_tx_is_prepared,
> +       .prepare        = mtk_ref2usb_tx_prepare,
> +       .unprepare      = mtk_ref2usb_tx_unprepare,
> +};
> +
> +static struct clk *mtk_clk_register_ref2usb_tx(const char *name,
> +                       const char *parent_name, void __iomem *reg)
> +{
> +       struct mtk_ref2usb_tx *tx;
> +       struct clk_init_data init = {};
> +       struct clk *clk;
> +
> +       tx = kzalloc(sizeof(*tx), GFP_KERNEL);
> +       if (!tx)
> +               return ERR_PTR(-ENOMEM);
> +
> +       tx->base_addr = reg;
> +       tx->hw.init = &init;
> +
> +       init.name = name;
> +       init.ops = &mtk_ref2usb_tx_ops;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       clk = clk_register(NULL, &tx->hw);
> +
> +       if (IS_ERR(clk)) {
> +               pr_err("Failed to register clk %s: %ld\n", name,
PTR_ERR(clk));
> +               kfree(tx);
> +       }
> +
> +       return clk;
> +}
> +
> +struct mtk_apmixed_ex {
> +       int id;
> +       const char *name;
> +       const char *parent;
> +       u32 reg_ofs;
> +};
> +
> +#define APMIXED_EX(_id, _name, _parent, _reg_ofs) {                    \
> +               .id = _id,                                              \
> +               .name = _name,                                          \
> +               .parent = _parent,                                      \
> +               .reg_ofs = _reg_ofs,                                    \
> +       }
> +
> +static const struct mtk_apmixed_ex apmixed_ex[] = {
> +       APMIXED_EX(CLK_APMIXED_REF2USB_TX, "ref2usb_tx", "clk26m", 0x8),
> +};
> +
> +static void __init mtk_clk_register_apmixedsys_special(struct
device_node *node,
> +                       struct clk_onecell_data *clk_data)
> +{
> +       void __iomem *base;
> +       struct clk *clk;
> +       int i;
> +
> +       base = of_iomap(node, 0);
> +       if (!base) {
> +               pr_err("%s(): ioremap failed\n", __func__);
> +               return;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(apmixed_ex); i++) {
> +               const struct mtk_apmixed_ex *ape = &apmixed_ex[i];
> +
> +               clk = mtk_clk_register_ref2usb_tx(ape->name, ape->parent,
> +                                                       base +
ape->reg_ofs);
> +
> +               if (IS_ERR(clk)) {
> +                       pr_err("Failed to register clk %s: %ld\n",
ape->name,
> +                                       PTR_ERR(clk));
> +                       continue;
> +               }
> +
> +               clk_data->clks[CLK_APMIXED_REF2USB_TX] = clk;
> +       }
> +}
> +
>  #define MT8173_PLL_FMAX                (3000UL * MHZ)
>
>  #define CON0_MT8173_RST_BAR    BIT(24)
> @@ -1010,12 +1146,19 @@ static const struct mtk_pll_data plls[] = {
>  static void __init mtk_apmixedsys_init(struct device_node *node)
>  {
>         struct clk_onecell_data *clk_data;
> +       int r;
>
>         mt8173_pll_clk_data = clk_data =
mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
>         if (!clk_data)
>                 return;
>
>         mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       mtk_clk_register_apmixedsys_special(node, clk_data);
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               pr_err("%s(): could not register clock provider: %d\n",
> +                       __func__, r);
>
>         mtk_clk_enable_critical();
>  }
> diff --git a/drivers/clk/mediatek/clk-pll.c
b/drivers/clk/mediatek/clk-pll.c
> index 44409e9..813f0c7 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -302,7 +302,7 @@ void __init mtk_clk_register_plls(struct device_node
*node,
>                 const struct mtk_pll_data *plls, int num_plls, struct
clk_onecell_data *clk_data)
>  {
>         void __iomem *base;
> -       int r, i;
> +       int i;
>         struct clk *clk;
>
>         base = of_iomap(node, 0);
> @@ -324,9 +324,4 @@ void __init mtk_clk_register_plls(struct device_node
*node,
>
>                 clk_data->clks[pll->id] = clk;
>         }
> -
> -       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -       if (r)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
>  }
> diff --git a/include/dt-bindings/clock/mt8173-clk.h
b/include/dt-bindings/clock/mt8173-clk.h
> index 6ce88bf..7b7c555 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -172,7 +172,8 @@
>  #define CLK_APMIXED_APLL2              12
>  #define CLK_APMIXED_LVDSPLL            13
>  #define CLK_APMIXED_MSDCPLL2           14
> -#define CLK_APMIXED_NR_CLK             15
> +#define CLK_APMIXED_REF2USB_TX         15
> +#define CLK_APMIXED_NR_CLK             16
>
>  /* INFRA_SYS */
>
> --
> 1.8.1.1.dirty
>

--001a114904863c3fde0519d1e496
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>This looks like 3 separate ga=
te clocks in a chain, with a timing constraint:=C2=A0<span style=3D"font-fa=
mily:monospace,monospace">USB_LPF</span>=C2=A0must be enabled 100 us after=
=C2=A0<span style=3D"font-family:monospace,monospace">USB_TX.</span></div><=
div><br></div><div><span style=3D"font-family:monospace,monospace">=C2=A0 2=
6MHz-</span><font face=3D"monospace, monospace">-&gt;=C2=A0</font><span sty=
le=3D"font-family:monospace,monospace">[GATE</span><span style=3D"font-fami=
ly:monospace,monospace">] --USB_TX--&gt;=C2=A0</span><font face=3D"monospac=
e, monospace">[LPF</font><span style=3D"font-family:monospace,monospace">] =
--USB_LPF--&gt; </span><span style=3D"font-family:monospace,monospace">[GAT=
E</span><span style=3D"font-family:monospace,monospace">]=C2=A0</span><span=
 style=3D"font-family:monospace,monospace">--USB_OUT--&gt;</span><br></div>=
<div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</font></div=
><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +--------------+ =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|</font></div><div><span style=3D"font-family:monos=
pace,monospace">AP_PLL_CON2.REF2USB_TX_EN -+ =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|</span><br></div><div><span style=
=3D"font-family:monospace,monospace">AP_PLL_CON2.REF2USB_TX_LPF_EN -+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|</span><span st=
yle=3D"font-family:monospace,monospace"><br></span></div><div><span style=
=3D"font-family:monospace,monospace">AP_PLL_CON2.REF2USB_TX_OUT_EN --------=
------------+</span></div><div><font face=3D"monospace, monospace"><br></fo=
nt></div><div><br></div><div>I think we can model the gate parts using a pr=
oper clock tree model and the existing clock gate semantics.</div><div>I&#3=
9;m not sure the best way to model the delay; but in theory that could be h=
andled by the clock user (USB driver).</div><div><br></div><div>-Dan</div><=
div><br>On Tue, Jun 30, 2015 at 10:58 AM, James Liao &lt;<a href=3D"mailto:=
jamesjj.liao@mediatek.com">jamesjj.liao@mediatek.com</a>&gt; wrote:<br>&gt;=
 Add REF2USB_TX clock support into MT8173 APMIXEDSYS. This clock<br>&gt; is=
 needed by USB 3.0.<br>&gt;<br>&gt; Signed-off-by: James Liao &lt;<a href=
=3D"mailto:jamesjj.liao@mediatek.com">jamesjj.liao@mediatek.com</a>&gt;<br>=
&gt; ---<br>&gt; =C2=A0drivers/clk/mediatek/clk-mt8173.c =C2=A0 =C2=A0 =C2=
=A0| 143 +++++++++++++++++++++++++++++++++<br>&gt; =C2=A0drivers/clk/mediat=
ek/clk-pll.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7 +-<br>&gt; =C2=A0includ=
e/dt-bindings/clock/mt8173-clk.h | =C2=A0 3 +-<br>&gt; =C2=A03 files change=
d, 146 insertions(+), 7 deletions(-)<br>&gt;<br>&gt; diff --git a/drivers/c=
lk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c<br>&gt; index =
75be757..333b6af 100644<br>&gt; --- a/drivers/clk/mediatek/clk-mt8173.c<br>=
&gt; +++ b/drivers/clk/mediatek/clk-mt8173.c<br>&gt; @@ -12,6 +12,7 @@<br>&=
gt; =C2=A0 * GNU General Public License for more details.<br>&gt; =C2=A0 */=
<br>&gt;<br>&gt; +#include &lt;linux/delay.h&gt;<br>&gt; =C2=A0#include &lt=
;linux/of.h&gt;<br>&gt; =C2=A0#include &lt;linux/of_address.h&gt;<br>&gt; =
=C2=A0#include &lt;linux/slab.h&gt;<br>&gt; @@ -968,6 +969,141 @@ static vo=
id __init mtk_pericfg_init(struct device_node *node)<br>&gt; =C2=A0}<br>&gt=
; =C2=A0CLK_OF_DECLARE(mtk_pericfg, &quot;mediatek,mt8173-pericfg&quot;, mt=
k_pericfg_init);<br>&gt;<br>&gt; +#define REF2USB_TX_EN =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(0)<br>&gt; +#define REF2USB_TX_LPF_EN =C2=A0 =C2=A0 =
=C2=A0BIT(1)<br>&gt; +#define REF2USB_TX_OUT_EN =C2=A0 =C2=A0 =C2=A0BIT(2)<=
br>&gt; +#define REF2USB_EN_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(REF2USB_TX_EN | REF2USB_TX_LPF_EN | \<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0REF2USB_TX_OUT_EN)<br>&gt; +<br>&gt; +struct mtk_re=
f2usb_tx {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk_hw =C2=A0 hw;<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0*base_addr;<br>&gt; +};<br=
>&gt; +<br>&gt; +static inline struct mtk_ref2usb_tx *to_mtk_ref2usb_tx(str=
uct clk_hw *hw)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return container_=
of(hw, struct mtk_ref2usb_tx, hw);<br>&gt; +}<br>&gt; +<br>&gt; +static int=
 mtk_ref2usb_tx_is_prepared(struct clk_hw *hw)<br>&gt; +{<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 struct mtk_ref2usb_tx *tx =3D to_mtk_ref2usb_tx(hw);<br>&gt; =
+<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return (readl(tx-&gt;base_addr) &amp; REF2=
USB_EN_MASK) =3D=3D REF2USB_EN_MASK;<br>&gt; +}<br>&gt; +<br>&gt; +static i=
nt mtk_ref2usb_tx_prepare(struct clk_hw *hw)<br>&gt; +{<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 struct mtk_ref2usb_tx *tx =3D to_mtk_ref2usb_tx(hw);<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 u32 val;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 va=
l =3D readl(tx-&gt;base_addr);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 val=
 |=3D REF2USB_TX_EN;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 writel(val, tx-&gt;base=
_addr);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 udelay(100);<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 val |=3D REF2USB_TX_LPF_EN;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 writel(val, tx-&gt;base_addr);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 val |=3D REF2USB_TX_OUT_EN;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 writel(val, tx-=
&gt;base_addr);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt; =
+}<br>&gt; +<br>&gt; +static void mtk_ref2usb_tx_unprepare(struct clk_hw *h=
w)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct mtk_ref2usb_tx *tx =3D =
to_mtk_ref2usb_tx(hw);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>&gt; +<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D readl(tx-&gt;base_addr);<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 val &amp;=3D ~REF2USB_EN_MASK;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 writel(val, tx-&gt;base_addr);<br>&gt; +}<div>&gt; +<br></div><div>&=
gt; +static const struct clk_ops mtk_ref2usb_tx_ops =3D {<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 .is_prepared =C2=A0 =C2=A0=3D mtk_ref2usb_tx_is_prepared,<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 .prepare =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mtk_ref=
2usb_tx_prepare,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .unprepare =C2=A0 =C2=A0 =
=C2=A0=3D mtk_ref2usb_tx_unprepare,<br>&gt; +};<br>&gt; +<br>&gt; +static s=
truct clk *mtk_clk_register_ref2usb_tx(const char *name,<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const=
 char *parent_name, void __iomem *reg)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 struct mtk_ref2usb_tx *tx;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk=
_init_data init =3D {};<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk *clk;<br>=
&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 tx =3D kzalloc(sizeof(*tx), GFP_KERNE=
L);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (!tx)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENOMEM);<br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 tx-&gt;base_addr =3D reg;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 tx-&gt;hw.init =3D &amp;init;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
<a href=3D"http://init.name">init.name</a> =3D name;<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 init.ops =3D &amp;mtk_ref2usb_tx_ops;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 init.parent_names =3D &amp;parent_name;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 init.num_parents =3D 1;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 clk =
=3D clk_register(NULL, &amp;tx-&gt;hw);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 if (IS_ERR(clk)) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_err(&quot;Failed to register clk %s: %ld\n&quot;, name, PTR_E=
RR(clk));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(=
tx);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 return clk;<br>&gt; +}<br>&gt; +<br>&gt; +struct mtk_apmixed_ex {<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 int id;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 const char=
 *name;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 const char *parent;<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 u32 reg_ofs;<br>&gt; +};<br>&gt; +<br>&gt; +#define APMIXED_=
EX(_id, _name, _parent, _reg_ofs) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .id =3D _id, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D _name, =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent =3D _parent, =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg_ofs =3D _reg_ofs, =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>=
&gt; +static const struct mtk_apmixed_ex apmixed_ex[] =3D {<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 APMIXED_EX(CLK_APMIXED_REF2USB_TX, &quot;ref2usb_tx&quot;=
, &quot;clk26m&quot;, 0x8),<br>&gt; +};<br>&gt; +<br>&gt; +static void __in=
it mtk_clk_register_apmixedsys_special(struct device_node *node,<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct clk_onecell_data *clk_data)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 void __iomem *base;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk *clk;<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 int i;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 base =3D of_iomap(node, 0);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (!base) {=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;%s=
(): ioremap failed\n&quot;, __func__);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(apmixed_ex)=
; i++) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const s=
truct mtk_apmixed_ex *ape =3D &amp;apmixed_ex[i];<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk =3D mtk_clk_register_ref2=
usb_tx(ape-&gt;name, ape-&gt;parent,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 base + ape-&gt;reg_ofs);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(clk)) {<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&=
quot;Failed to register clk %s: %ld\n&quot;, ape-&gt;name,<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTR_ERR(clk));<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk=
_data-&gt;clks[CLK_APMIXED_REF2USB_TX] =3D clk;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 }<br>&gt; +}<br>&gt; +<br>&gt; =C2=A0#define MT8173_PLL_FMAX =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3000UL * MHZ)<br>&gt;<br>&gt;=
 =C2=A0#define CON0_MT8173_RST_BAR =C2=A0 =C2=A0BIT(24)<br>&gt; @@ -1010,12=
 +1146,19 @@ static const struct mtk_pll_data plls[] =3D {<br>&gt; =C2=A0st=
atic void __init mtk_apmixedsys_init(struct device_node *node)<br>&gt; =C2=
=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_onecell_data *clk_data;=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 int r;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 mt8173_pll_clk_data =3D clk_data =3D mtk_alloc_clk_data(CLK_APMIXED=
_NR_CLK);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!clk_data)<br>&gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>&gt;<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_clk_register_plls(node, plls, ARRAY_SIZE(pl=
ls), clk_data);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 mtk_clk_register_apmixedsys_=
special(node, clk_data);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 r =3D of_=
clk_add_provider(node, of_clk_src_onecell_get, clk_data);<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 if (r)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pr_err(&quot;%s(): could not register clock provider: %d\n&quot;,<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __func__, r);<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_cl=
k_enable_critical();<br>&gt; =C2=A0}<br>&gt; diff --git a/drivers/clk/media=
tek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c<br>&gt; index 44409e9..813f0=
c7 100644<br>&gt; --- a/drivers/clk/mediatek/clk-pll.c<br>&gt; +++ b/driver=
s/clk/mediatek/clk-pll.c<br>&gt; @@ -302,7 +302,7 @@ void __init mtk_clk_re=
gister_plls(struct device_node *node,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct mtk_pll_data *plls, int num_plls, =
struct clk_onecell_data *clk_data)<br>&gt; =C2=A0{<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 void __iomem *base;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 int r, i;<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 int i;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct clk *clk;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D of_iom=
ap(node, 0);<br>&gt; @@ -324,9 +324,4 @@ void __init mtk_clk_register_plls(=
struct device_node *node,<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clk_data-&gt;clks[pll-&gt;id] =3D clk;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; -<br>&gt; - =C2=A0 =C2=A0 =C2=A0 r =3D o=
f_clk_add_provider(node, of_clk_src_onecell_get, clk_data);<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 if (r)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_err(&quot;%s(): could not register clock provider: %d\n&quot;=
,<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 __func__, r);<br>&gt; =C2=A0}<br>&gt; diff --git a/include/dt=
-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h<br>&g=
t; index 6ce88bf..7b7c555 100644<br>&gt; --- a/include/dt-bindings/clock/mt=
8173-clk.h<br>&gt; +++ b/include/dt-bindings/clock/mt8173-clk.h<br>&gt; @@ =
-172,7 +172,8 @@<br>&gt; =C2=A0#define CLK_APMIXED_APLL2 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br>&gt; =C2=A0#define CLK_APMIXED_LVDSPLL=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013<br>&gt; =C2=A0#define CLK_APMI=
XED_MSDCPLL2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 14<br>&gt; -#define CLK_APM=
IXED_NR_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15<br>&gt; +#define C=
LK_APMIXED_REF2USB_TX =C2=A0 =C2=A0 =C2=A0 =C2=A0 15<br>&gt; +#define CLK_A=
PMIXED_NR_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>&gt;<br>&gt; =
=C2=A0/* INFRA_SYS */<br>&gt;<br>&gt; --<br>&gt; 1.8.1.1.dirty<br>&gt;<br><=
br></div></div></div>

--001a114904863c3fde0519d1e496--
