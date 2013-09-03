From: Fugang Duan <B38611@freescale.com>
Subject: [PATCH v2 1/4] ARM: dts: add iomuxc-gpr device node for imx6sl
Date: Tue, 3 Sep 2013 12:26:22 +0800
Message-ID: <1378182385-9205-2-git-send-email-B38611@freescale.com>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378182385-9205-1-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add iomuxc gpr device node for imx6sl.

Signed-off-by: Fugang Duan  <B38611@freescale.com>
---
 arch/arm/boot/dts/imx6sl.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index c5e5da0..abd1eb9 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -504,6 +504,11 @@
 				interrupts = <0 89 0x04>;
 			};
 
+			gpr: iomuxc-gpr@020e0000 {
+				compatible = "fsl,imx6sl-iomuxc-gpr", "syscon";
+				reg = <0x020e0000 0x38>;
+			};
+
 			iomuxc: iomuxc@020e0000 {
 				compatible = "fsl,imx6sl-iomuxc";
 				reg = <0x020e0000 0x4000>;
-- 
1.7.1
