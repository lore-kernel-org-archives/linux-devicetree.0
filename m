From: Yong Liang <yong.liang@mediatek.com>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add watchdog device node
Date: Mon, 22 Apr 2019 14:08:04 +0800
Message-ID: <1555913284-5591-2-git-send-email-yong.liang@mediatek.com>
References: <1555913284-5591-1-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555913284-5591-1-git-send-email-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, "yong.liang" <yong.liang@mediatek.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "yong.liang" <yong.liang@mediatek.com>

Add watchdog device node in dtsi file.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 75c4881..491bef0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -253,6 +253,12 @@
 			smi_comm = <&smi_common>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8183-wdt",
+				      "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+		};
+
 		apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8183-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
-- 
1.7.9.5
