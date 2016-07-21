From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH 06/18] ARM: mvebu: a390: add missing compatibility string and
 add missing bracket
Date: Thu, 21 Jul 2016 14:44:02 +0200
Message-ID: <1469105055-25181-7-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, jaz@semihalf.com, linux@armlinux.org.uk, stable@vger.kernel.org, alior@marvell.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, mw@semihalf.com, thomas.petazzoni@free-electrons.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

The armada-390.dtsi was broken since the first patch which adds Device Tree
files for Armada 39x SoC was introduced.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: <stable@vger.kernel.org> # 4.0+
Fixes 538da83 ("ARM: mvebu: add Device Tree files for Armada 39x SoC and board")
---
 arch/arm/boot/dts/armada-390.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/armada-390.dtsi b/arch/arm/boot/dts/armada-390.dtsi
index 094e39c..6cd18d8 100644
--- a/arch/arm/boot/dts/armada-390.dtsi
+++ b/arch/arm/boot/dts/armada-390.dtsi
@@ -47,6 +47,8 @@
 #include "armada-39x.dtsi"
 
 / {
+	compatible = "marvell,armada390";
+
 	soc {
 		internal-regs {
 			pinctrl@18000 {
@@ -54,4 +56,5 @@
 				reg = <0x18000 0x20>;
 			};
 		};
+	};
 };
-- 
1.8.3.1
