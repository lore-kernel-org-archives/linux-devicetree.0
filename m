From: Changming Huang <jerry.huang@nxp.com>
Subject: [PATCH] arm/dts: ls1021a: Add dma-coherent property to usb3 node
Date: Wed, 23 Nov 2016 15:15:24 +0800
Message-ID: <1479885324-5468-1-git-send-email-jerry.huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, Rajesh Bhagat <rajesh.bhagat@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Changming Huang <jerry.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

This sets dma ops as coherent for usb 3.0 platform device

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 368e219..81fb4d9 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -627,6 +627,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			dma-coherent;
 		};
 
 		pcie@3400000 {
-- 
1.7.9.5
