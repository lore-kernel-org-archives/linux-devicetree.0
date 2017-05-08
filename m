From: Tom Psyborg <pozega.tomislav@gmail.com>
Subject: Re: [PATCH 1/2 v2] clk: Add bindings for the Gemini
 Clock Controller
Date: Mon, 8 May 2017 23:17:07 +0200
Message-ID: <CAKR_QVKKocajdnuyivWCuaLQssxkcrfdiMqcFxeWeesmFfHhRw@mail.gmail.com>
References: <20170508201159.31634-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6014417638816828420=="
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <20170508201159.31634-1-linus.walleij@linaro.org>
List-Unsubscribe: <https://lists.openwrt.org/cgi-bin/mailman/options/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=unsubscribe>
List-Archive: <http://lists.openwrt.org/pipermail/openwrt-devel/>
List-Post: <mailto:openwrt-devel@lists.openwrt.org>
List-Help: <mailto:openwrt-devel-request@lists.openwrt.org?subject=help>
List-Subscribe: <https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=subscribe>
Errors-To: openwrt-devel-bounces@lists.openwrt.org
Sender: "openwrt-devel" <openwrt-devel-bounces@lists.openwrt.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: openwrt-devel@openwrt.org, devicetree@vger.kernel.org, Paulius Zaleckas <paulius.zaleckas@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Janos Laube <janos.dev@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============6014417638816828420==
Content-Type: multipart/alternative; boundary=f40304354a58f710a9054f09c2dc

--f40304354a58f710a9054f09c2dc
Content-Type: text/plain; charset=UTF-8

Is it ever going to be added so this endless spam can end?


On 8 May 2017 at 22:11, Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds device tree bindings and a header for the Gemini SoC
> Clock Controller.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Move the clock controller to be directly in the parent syscon
>   node.
> ---
>  .../clock/cortina,gemini-clock-controller.txt      | 22 ++++++++++++++++
>  include/dt-bindings/clock/cortina,gemini-clock.h   | 29
> ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/
> bindings/clock/cortina,gemini-clock-controller.txt
>  create mode 100644 include/dt-bindings/clock/cortina,gemini-clock.h
>
> diff --git a/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
> b/Documentation/devicetree/bindings/clock/cortina,gemini-
> clock-controller.txt
> new file mode 100644
> index 000000000000..ae0046bccba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cortina,gemini-
> clock-controller.txt
> @@ -0,0 +1,22 @@
> +Clock bindings for the Cortina Systems Gemini SoC Clock Controller
> +
> +Required properties :
> +- compatible : shall contain the following:
> +  "cortina,gemini-clock-controller"
> +- #clock-cells should be <1>
> +
> +The Gemini clock controller needs to be identical to the system controller
> +node.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/cortina,gemini-clock.h header and can be used in device
> +tree sources.
> +
> +Example:
> +
> +syscon: syscon@40000000 {
> +       compatible = "cortina,gemini-syscon", "cortina,gemini-clock-
> controller",
> +                    "syscon", "simple-mfd";
> +       reg = <0x40000000 0x1000>;
> +       #clock-cells = <1>;
> +};
> diff --git a/include/dt-bindings/clock/cortina,gemini-clock.h
> b/include/dt-bindings/clock/cortina,gemini-clock.h
> new file mode 100644
> index 000000000000..acf5cd550b0c
> --- /dev/null
> +++ b/include/dt-bindings/clock/cortina,gemini-clock.h
> @@ -0,0 +1,29 @@
> +#ifndef DT_BINDINGS_CORTINA_GEMINI_CLOCK_H
> +#define DT_BINDINGS_CORTINA_GEMINI_CLOCK_H
> +
> +/* RTC, AHB, APB, CPU, PCI, TVC, UART clocks and 13 gates */
> +#define GEMINI_NUM_CLKS 20
> +
> +#define GEMINI_CLK_RTC 0
> +#define GEMINI_CLK_AHB 1
> +#define GEMINI_CLK_APB 2
> +#define GEMINI_CLK_CPU 3
> +#define GEMINI_CLK_PCI 4
> +#define GEMINI_CLK_TVC 5
> +#define GEMINI_CLK_UART 6
> +#define GEMINI_CLK_GATES 7
> +#define GEMINI_CLK_GATE_SECURITY 7
> +#define GEMINI_CLK_GATE_GMAC0 8
> +#define GEMINI_CLK_GATE_GMAC1 9
> +#define GEMINI_CLK_GATE_SATA0 10
> +#define GEMINI_CLK_GATE_SATA1 11
> +#define GEMINI_CLK_GATE_USB0 12
> +#define GEMINI_CLK_GATE_USB1 13
> +#define GEMINI_CLK_GATE_IDE 14
> +#define GEMINI_CLK_GATE_PCI 15
> +#define GEMINI_CLK_GATE_DDR 16
> +#define GEMINI_CLK_GATE_FLASH 17
> +#define GEMINI_CLK_GATE_TVC 18
> +#define GEMINI_CLK_GATE_BOOT 19
> +
> +#endif /* DT_BINDINGS_CORTINA_GEMINI_CLOCK_H */
> --
> 2.9.3
> _______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel
>

--f40304354a58f710a9054f09c2dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it ever going to be added so this endless spam can end?=
<br><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 8 May 2017 at 22:11, Linus Walleij <span dir=3D"ltr">&lt;<a href=
=3D"mailto:linus.walleij@linaro.org" target=3D"_blank">linus.walleij@linaro=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This adds devi=
ce tree bindings and a header for the Gemini SoC<br>
Clock Controller.<br>
<br>
Signed-off-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org=
">linus.walleij@linaro.org</a>&gt;<br>
---<br>
ChangeLog v1-&gt;v2:<br>
- Move the clock controller to be directly in the parent syscon<br>
=C2=A0 node.<br>
---<br>
=C2=A0.../clock/cortina,gemini-<wbr>clock-controller.txt=C2=A0 =C2=A0 =C2=
=A0 | 22 ++++++++++++++++<br>
=C2=A0include/dt-bindings/clock/<wbr>cortina,gemini-clock.h=C2=A0 =C2=A0| 2=
9 ++++++++++++++++++++++<br>
=C2=A02 files changed, 51 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/clock/corti=
na,gemini-<wbr>clock-controller.txt<br>
=C2=A0create mode 100644 include/dt-bindings/clock/<wbr>cortina,gemini-cloc=
k.h<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/clock/cortina,gemini-<w=
br>clock-controller.txt b/Documentation/devicetree/<wbr>bindings/clock/cort=
ina,gemini-<wbr>clock-controller.txt<br>
new file mode 100644<br>
index 000000000000..ae0046bccba0<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/clock/cortina,gemini-<wbr>cloc=
k-controller.txt<br>
@@ -0,0 +1,22 @@<br>
+Clock bindings for the Cortina Systems Gemini SoC Clock Controller<br>
+<br>
+Required properties :<br>
+- compatible : shall contain the following:<br>
+=C2=A0 &quot;cortina,gemini-clock-<wbr>controller&quot;<br>
+- #clock-cells should be &lt;1&gt;<br>
+<br>
+The Gemini clock controller needs to be identical to the system controller=
<br>
+node.<br>
+<br>
+All available clocks are defined as preprocessor macros in<br>
+dt-bindings/clock/cortina,<wbr>gemini-clock.h header and can be used in de=
vice<br>
+tree sources.<br>
+<br>
+Example:<br>
+<br>
+syscon: syscon@40000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;cortina,gemini-syscon&quot=
;, &quot;cortina,gemini-clock-<wbr>controller&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;syscon&quot;, &quot;simple-mfd&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40000000 0x1000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#clock-cells =3D &lt;1&gt;;<br>
+};<br>
diff --git a/include/dt-bindings/clock/<wbr>cortina,gemini-clock.h b/includ=
e/dt-bindings/clock/<wbr>cortina,gemini-clock.h<br>
new file mode 100644<br>
index 000000000000..acf5cd550b0c<br>
--- /dev/null<br>
+++ b/include/dt-bindings/clock/<wbr>cortina,gemini-clock.h<br>
@@ -0,0 +1,29 @@<br>
+#ifndef DT_BINDINGS_CORTINA_GEMINI_<wbr>CLOCK_H<br>
+#define DT_BINDINGS_CORTINA_GEMINI_<wbr>CLOCK_H<br>
+<br>
+/* RTC, AHB, APB, CPU, PCI, TVC, UART clocks and 13 gates */<br>
+#define GEMINI_NUM_CLKS 20<br>
+<br>
+#define GEMINI_CLK_RTC 0<br>
+#define GEMINI_CLK_AHB 1<br>
+#define GEMINI_CLK_APB 2<br>
+#define GEMINI_CLK_CPU 3<br>
+#define GEMINI_CLK_PCI 4<br>
+#define GEMINI_CLK_TVC 5<br>
+#define GEMINI_CLK_UART 6<br>
+#define GEMINI_CLK_GATES 7<br>
+#define GEMINI_CLK_GATE_SECURITY 7<br>
+#define GEMINI_CLK_GATE_GMAC0 8<br>
+#define GEMINI_CLK_GATE_GMAC1 9<br>
+#define GEMINI_CLK_GATE_SATA0 10<br>
+#define GEMINI_CLK_GATE_SATA1 11<br>
+#define GEMINI_CLK_GATE_USB0 12<br>
+#define GEMINI_CLK_GATE_USB1 13<br>
+#define GEMINI_CLK_GATE_IDE 14<br>
+#define GEMINI_CLK_GATE_PCI 15<br>
+#define GEMINI_CLK_GATE_DDR 16<br>
+#define GEMINI_CLK_GATE_FLASH 17<br>
+#define GEMINI_CLK_GATE_TVC 18<br>
+#define GEMINI_CLK_GATE_BOOT 19<br>
+<br>
+#endif /* DT_BINDINGS_CORTINA_GEMINI_<wbr>CLOCK_H */<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
______________________________<wbr>_________________<br>
openwrt-devel mailing list<br>
<a href=3D"mailto:openwrt-devel@lists.openwrt.org">openwrt-devel@lists.open=
wrt.<wbr>org</a><br>
<a href=3D"https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel=
" rel=3D"noreferrer" target=3D"_blank">https://lists.openwrt.org/cgi-<wbr>b=
in/mailman/listinfo/openwrt-<wbr>devel</a><br>
</font></span></blockquote></div><br></div>

--f40304354a58f710a9054f09c2dc--

--===============6014417638816828420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18Kb3BlbndydC1k
ZXZlbCBtYWlsaW5nIGxpc3QKb3BlbndydC1kZXZlbEBsaXN0cy5vcGVud3J0Lm9yZwpodHRwczov
L2xpc3RzLm9wZW53cnQub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVud3J0LWRldmVs
Cg==

--===============6014417638816828420==--
