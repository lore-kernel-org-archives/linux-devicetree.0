From: Tom Psyborg <pozega.tomislav@gmail.com>
Subject: Re: [PATCH 1/2 v2] reset: Add DT bindings for the
 Gemini reset controller
Date: Mon, 8 May 2017 23:17:56 +0200
Message-ID: <CAKR_QVKmgBObvQ-=knqQ0aNbWPmY0uwG_yRr_6_=5Tu2BWWDVw@mail.gmail.com>
References: <20170508200720.26145-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1133601186691061025=="
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <20170508200720.26145-1-linus.walleij@linaro.org>
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
Cc: openwrt-devel@openwrt.org, devicetree@vger.kernel.org, Paulius Zaleckas <paulius.zaleckas@gmail.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Janos Laube <janos.dev@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1133601186691061025==
Content-Type: multipart/alternative; boundary=001a1134f8b0dd9c6b054f09c526

--001a1134f8b0dd9c6b054f09c526
Content-Type: text/plain; charset=UTF-8

Is it ever going to be added so this endless spam can end?


On 8 May 2017 at 22:07, Linus Walleij <linus.walleij@linaro.org> wrote:

> This is a simple reset controller in a single 32bit
> register.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Move the reset controller node to be the same as the syscon
>   node, no need for a specific child node.
> - Add an include file with nice #defines.
> ---
>  .../bindings/reset/cortina,gemini-reset.txt        | 58
> ++++++++++++++++++++++
>  include/dt-bindings/reset/cortina,gemini-reset.h   | 36 ++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/
> bindings/reset/cortina,gemini-reset.txt
>  create mode 100644 include/dt-bindings/reset/cortina,gemini-reset.h
>
> diff --git a/Documentation/devicetree/bindings/reset/cortina,gemini-reset.txt
> b/Documentation/devicetree/bindings/reset/cortina,gemini-reset.txt
> new file mode 100644
> index 000000000000..aa3d1b2a9677
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cortina,gemini-reset.txt
> @@ -0,0 +1,58 @@
> +Cortina Gemini Reset Controller
> +
> +This reset controller is found in Cortina Systems CS3516 and
> +the predecessor StorLink SL3516.
> +
> +Required properties:
> +- compatible: "cortina,gemini-reset"
> +- #reset-cells: Must be 1
> +
> +The Gemini reset controller must be identical to the system controller
> node.
> +Apart from this it follows the standard reset controller bindings.
> +
> +Valid reset line values:
> +
> +0:  DRAM controller
> +1:  Flash controller
> +2:  IDE controller
> +3:  RAID controller
> +4:  Security module
> +5:  GMAC0 (ethernet)
> +6:  GMAC1 (ethernet)
> +7:  PCI host bridge
> +8:  USB0 USB host controller
> +9:  USB1 USB host controller
> +10: General DMA controller
> +11: APB bridge
> +12: LPC (Low Pin Count) controller
> +13: LCD module
> +14: Interrupt controller 0
> +15: Interrupt controller 1
> +16: RTC module
> +17: Timer module
> +18: UART controller
> +19: SSP controller
> +20: GPIO0 GPIO controller
> +21: GPIO1 GPIO controller
> +22: GPIO2 GPIO controller
> +23: Watchdog timer
> +24: External device reset
> +25: CIR module (infrared)
> +26: SATA0 SATA bridge
> +27: SATA1 SATA bridge
> +28: TVE TV Encoder module
> +29: Reserved
> +30: CPU1 reset
> +31: Global soft reset
> +
> +These also have shorthand defines in the include file:
> +<dt-bindings/reset/cortina,gemini-reset.h>
> +
> +Example:
> +
> +syscon: syscon@40000000 {
> +       compatible = "cortina,gemini-syscon", "cortina,gemini-reset",
> +                    "syscon", "simple-mfd";
> +       reg = <0x40000000 0x1000>;
> +       #reset-cells = <1>;
> +};
> diff --git a/include/dt-bindings/reset/cortina,gemini-reset.h
> b/include/dt-bindings/reset/cortina,gemini-reset.h
> new file mode 100644
> index 000000000000..aebecae43721
> --- /dev/null
> +++ b/include/dt-bindings/reset/cortina,gemini-reset.h
> @@ -0,0 +1,36 @@
> +#ifndef _DT_BINDINGS_RESET_CORTINA_GEMINI_H
> +#define _DT_BINDINGS_RESET_CORTINA_GEMINI_H
> +
> +#define GEMINI_RESET_DRAM      0
> +#define GEMINI_RESET_FLASH     1
> +#define GEMINI_RESET_IDE       2
> +#define GEMINI_RESET_RAID      3
> +#define GEMINI_RESET_SECURITY  4
> +#define GEMINI_RESET_GMAC0     5
> +#define GEMINI_RESET_GMAC1     6
> +#define GEMINI_RESET_PCI       7
> +#define GEMINI_RESET_USB0      8
> +#define GEMINI_RESET_USB1      9
> +#define GEMINI_RESET_DMAC      10
> +#define GEMINI_RESET_APB       11
> +#define GEMINI_RESET_LPC       12
> +#define GEMINI_RESET_LCD       13
> +#define GEMINI_RESET_INTCON0   14
> +#define GEMINI_RESET_INTCON1   15
> +#define GEMINI_RESET_RTC       16
> +#define GEMINI_RESET_TIMER     17
> +#define GEMINI_RESET_UART      18
> +#define GEMINI_RESET_SSP       19
> +#define GEMINI_RESET_GPIO0     20
> +#define GEMINI_RESET_GPIO1     21
> +#define GEMINI_RESET_GPIO2     22
> +#define GEMINI_RESET_WDOG      23
> +#define GEMINI_RESET_EXTERN    24
> +#define GEMINI_RESET_CIR       25
> +#define GEMINI_RESET_SATA0     26
> +#define GEMINI_RESET_SATA1     27
> +#define GEMINI_RESET_TVE       28
> +#define GEMINI_RESET_CPU1      30
> +#define GEMINI_RESET_GLOBAL    31
> +
> +#endif
> --
> 2.9.3
> _______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel
>

--001a1134f8b0dd9c6b054f09c526
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it ever going to be added so this endless spam can end?=
<br><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 8 May 2017 at 22:07, Linus Walleij <span dir=3D"ltr">&lt;<a href=
=3D"mailto:linus.walleij@linaro.org" target=3D"_blank">linus.walleij@linaro=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is a simp=
le reset controller in a single 32bit<br>
register.<br>
<br>
Signed-off-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org=
">linus.walleij@linaro.org</a>&gt;<br>
---<br>
ChangeLog v1-&gt;v2:<br>
- Move the reset controller node to be the same as the syscon<br>
=C2=A0 node, no need for a specific child node.<br>
- Add an include file with nice #defines.<br>
---<br>
=C2=A0.../bindings/reset/cortina,<wbr>gemini-reset.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 58 ++++++++++++++++++++++<br>
=C2=A0include/dt-bindings/reset/<wbr>cortina,gemini-reset.h=C2=A0 =C2=A0| 3=
6 ++++++++++++++<br>
=C2=A02 files changed, 94 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/reset/corti=
na,gemini-<wbr>reset.txt<br>
=C2=A0create mode 100644 include/dt-bindings/reset/<wbr>cortina,gemini-rese=
t.h<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/reset/cortina,gemini-<w=
br>reset.txt b/Documentation/devicetree/<wbr>bindings/reset/cortina,gemini-=
<wbr>reset.txt<br>
new file mode 100644<br>
index 000000000000..aa3d1b2a9677<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/reset/cortina,gemini-<wbr>rese=
t.txt<br>
@@ -0,0 +1,58 @@<br>
+Cortina Gemini Reset Controller<br>
+<br>
+This reset controller is found in Cortina Systems CS3516 and<br>
+the predecessor StorLink SL3516.<br>
+<br>
+Required properties:<br>
+- compatible: &quot;cortina,gemini-reset&quot;<br>
+- #reset-cells: Must be 1<br>
+<br>
+The Gemini reset controller must be identical to the system controller nod=
e.<br>
+Apart from this it follows the standard reset controller bindings.<br>
+<br>
+Valid reset line values:<br>
+<br>
+0:=C2=A0 DRAM controller<br>
+1:=C2=A0 Flash controller<br>
+2:=C2=A0 IDE controller<br>
+3:=C2=A0 RAID controller<br>
+4:=C2=A0 Security module<br>
+5:=C2=A0 GMAC0 (ethernet)<br>
+6:=C2=A0 GMAC1 (ethernet)<br>
+7:=C2=A0 PCI host bridge<br>
+8:=C2=A0 USB0 USB host controller<br>
+9:=C2=A0 USB1 USB host controller<br>
+10: General DMA controller<br>
+11: APB bridge<br>
+12: LPC (Low Pin Count) controller<br>
+13: LCD module<br>
+14: Interrupt controller 0<br>
+15: Interrupt controller 1<br>
+16: RTC module<br>
+17: Timer module<br>
+18: UART controller<br>
+19: SSP controller<br>
+20: GPIO0 GPIO controller<br>
+21: GPIO1 GPIO controller<br>
+22: GPIO2 GPIO controller<br>
+23: Watchdog timer<br>
+24: External device reset<br>
+25: CIR module (infrared)<br>
+26: SATA0 SATA bridge<br>
+27: SATA1 SATA bridge<br>
+28: TVE TV Encoder module<br>
+29: Reserved<br>
+30: CPU1 reset<br>
+31: Global soft reset<br>
+<br>
+These also have shorthand defines in the include file:<br>
+&lt;dt-bindings/reset/cortina,<wbr>gemini-reset.h&gt;<br>
+<br>
+Example:<br>
+<br>
+syscon: syscon@40000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;cortina,gemini-syscon&quot=
;, &quot;cortina,gemini-reset&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;syscon&quot;, &quot;simple-mfd&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40000000 0x1000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#reset-cells =3D &lt;1&gt;;<br>
+};<br>
diff --git a/include/dt-bindings/reset/<wbr>cortina,gemini-reset.h b/includ=
e/dt-bindings/reset/<wbr>cortina,gemini-reset.h<br>
new file mode 100644<br>
index 000000000000..aebecae43721<br>
--- /dev/null<br>
+++ b/include/dt-bindings/reset/<wbr>cortina,gemini-reset.h<br>
@@ -0,0 +1,36 @@<br>
+#ifndef _DT_BINDINGS_RESET_CORTINA_<wbr>GEMINI_H<br>
+#define _DT_BINDINGS_RESET_CORTINA_<wbr>GEMINI_H<br>
+<br>
+#define GEMINI_RESET_DRAM=C2=A0 =C2=A0 =C2=A0 0<br>
+#define GEMINI_RESET_FLASH=C2=A0 =C2=A0 =C2=A01<br>
+#define GEMINI_RESET_IDE=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
+#define GEMINI_RESET_RAID=C2=A0 =C2=A0 =C2=A0 3<br>
+#define GEMINI_RESET_SECURITY=C2=A0 4<br>
+#define GEMINI_RESET_GMAC0=C2=A0 =C2=A0 =C2=A05<br>
+#define GEMINI_RESET_GMAC1=C2=A0 =C2=A0 =C2=A06<br>
+#define GEMINI_RESET_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A07<br>
+#define GEMINI_RESET_USB0=C2=A0 =C2=A0 =C2=A0 8<br>
+#define GEMINI_RESET_USB1=C2=A0 =C2=A0 =C2=A0 9<br>
+#define GEMINI_RESET_DMAC=C2=A0 =C2=A0 =C2=A0 10<br>
+#define GEMINI_RESET_APB=C2=A0 =C2=A0 =C2=A0 =C2=A011<br>
+#define GEMINI_RESET_LPC=C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
+#define GEMINI_RESET_LCD=C2=A0 =C2=A0 =C2=A0 =C2=A013<br>
+#define GEMINI_RESET_INTCON0=C2=A0 =C2=A014<br>
+#define GEMINI_RESET_INTCON1=C2=A0 =C2=A015<br>
+#define GEMINI_RESET_RTC=C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
+#define GEMINI_RESET_TIMER=C2=A0 =C2=A0 =C2=A017<br>
+#define GEMINI_RESET_UART=C2=A0 =C2=A0 =C2=A0 18<br>
+#define GEMINI_RESET_SSP=C2=A0 =C2=A0 =C2=A0 =C2=A019<br>
+#define GEMINI_RESET_GPIO0=C2=A0 =C2=A0 =C2=A020<br>
+#define GEMINI_RESET_GPIO1=C2=A0 =C2=A0 =C2=A021<br>
+#define GEMINI_RESET_GPIO2=C2=A0 =C2=A0 =C2=A022<br>
+#define GEMINI_RESET_WDOG=C2=A0 =C2=A0 =C2=A0 23<br>
+#define GEMINI_RESET_EXTERN=C2=A0 =C2=A0 24<br>
+#define GEMINI_RESET_CIR=C2=A0 =C2=A0 =C2=A0 =C2=A025<br>
+#define GEMINI_RESET_SATA0=C2=A0 =C2=A0 =C2=A026<br>
+#define GEMINI_RESET_SATA1=C2=A0 =C2=A0 =C2=A027<br>
+#define GEMINI_RESET_TVE=C2=A0 =C2=A0 =C2=A0 =C2=A028<br>
+#define GEMINI_RESET_CPU1=C2=A0 =C2=A0 =C2=A0 30<br>
+#define GEMINI_RESET_GLOBAL=C2=A0 =C2=A0 31<br>
+<br>
+#endif<br>
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

--001a1134f8b0dd9c6b054f09c526--

--===============1133601186691061025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18Kb3BlbndydC1k
ZXZlbCBtYWlsaW5nIGxpc3QKb3BlbndydC1kZXZlbEBsaXN0cy5vcGVud3J0Lm9yZwpodHRwczov
L2xpc3RzLm9wZW53cnQub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVud3J0LWRldmVs
Cg==

--===============1133601186691061025==--
