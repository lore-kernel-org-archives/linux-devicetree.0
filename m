Return-Path: <SRS0=KvoA=RK=mediatek.com=ck.hu@kernel.org>
Message-ID: <1551921866.20144.1.camel@mtksdaap41>
Subject: Re: [PATCH] arm64: dts: add gce node for mt8183
From: CK Hu <ck.hu@mediatek.com>
Date: Thu, 7 Mar 2019 09:24:26 +0800
In-Reply-To: <1551867024-52951-1-git-send-email-bibby.hsieh@mediatek.com>
References: <1551867024-52951-1-git-send-email-bibby.hsieh@mediatek.com>
Content-Type: multipart/alternative; boundary="=-WgsR0WNQHjJzNSWHwqb6"
MIME-Version: 1.0
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, "Philipp Zabel  <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>,  YT Shen  <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang" <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

--=-WgsR0WNQHjJzNSWHwqb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi, Bibby:

On Wed, 2019-03-06 at 18:10 +0800, Bibby Hsieh wrote:

> This patch need based on v5.0-rc1 and these series
> http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html
> http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html
> http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017196.html
> http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018005.html
> 
> add gce device node for mt8183
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 165b859..5006368 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8183-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gce/mt8183-gce.h>
>  #include "mt8183-pinfunc.h"
>  
>  / {
> @@ -238,6 +239,18 @@
>  			clock-names = "spi", "wrap";
>  		};
>  
> +		gce: gce@10238000 {
> +			compatible = "mediatek,mt8183-gce";
> +			reg = <0 0x10238000 0 0x4000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> +			thread-num = <CMDQ_THR_MAX_COUNT>;


I does not find 'thread-num' in binding document [1].

[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/mtk-gce.txt

Regards,
CK


> +			#mbox-cells = <3>;
> +			#gce-event-cells = <1>;
> +			#gce-subsys-cells = <2>;
> +			clocks = <&infracfg CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt8183-uart",
>  				     "mediatek,mt6577-uart";



--=-WgsR0WNQHjJzNSWHwqb6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.6">
</HEAD>
<BODY>
Hi, Bibby:<BR>
<BR>
On Wed, 2019-03-06 at 18:10 +0800, Bibby Hsieh wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
This patch need based on v5.0-rc1 and these series
<A HREF="http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html">http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html</A>
<A HREF="http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html">http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html</A>
<A HREF="http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017196.html">http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017196.html</A>
<A HREF="http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018005.html">http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018005.html</A>

add gce device node for mt8183

Signed-off-by: Bibby Hsieh &lt;<A HREF="mailto:bibby.hsieh@mediatek.com">bibby.hsieh@mediatek.com</A>&gt;
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 165b859..5006368 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include &lt;dt-bindings/clock/mt8183-clk.h&gt;
 #include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
 #include &lt;dt-bindings/interrupt-controller/irq.h&gt;
+#include &lt;dt-bindings/gce/mt8183-gce.h&gt;
 #include &quot;mt8183-pinfunc.h&quot;
 
 / {
@@ -238,6 +239,18 @@
 			clock-names = &quot;spi&quot;, &quot;wrap&quot;;
 		};
 
+		gce: gce@10238000 {
+			compatible = &quot;mediatek,mt8183-gce&quot;;
+			reg = &lt;0 0x10238000 0 0x4000&gt;;
+			interrupts = &lt;GIC_SPI 162 IRQ_TYPE_LEVEL_LOW&gt;;
+			thread-num = &lt;CMDQ_THR_MAX_COUNT&gt;;
</PRE>
</BLOCKQUOTE>
<BR>
I does not find 'thread-num' in binding document [1].<BR>
<BR>
[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/mtk-gce.txt<BR>
<BR>
Regards,<BR>
CK<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
+			#mbox-cells = &lt;3&gt;;
+			#gce-event-cells = &lt;1&gt;;
+			#gce-subsys-cells = &lt;2&gt;;
+			clocks = &lt;&amp;infracfg CLK_INFRA_GCE&gt;;
+			clock-names = &quot;gce&quot;;
+		};
+
 		uart0: serial@11002000 {
 			compatible = &quot;mediatek,mt8183-uart&quot;,
 				     &quot;mediatek,mt6577-uart&quot;;
</PRE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-WgsR0WNQHjJzNSWHwqb6--
