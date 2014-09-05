From: klightspeed@killerwolves.net
Subject: [PATCH] ARM: MVEBU: Netgear RN102: Use Hardware BCH ECC
Date: Fri,  5 Sep 2014 16:23:53 +1000
Message-ID: <1409898233-9273-1-git-send-email-klightspeed@killerwolves.net>
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
To: linux-arm-kernel@lists.infradead.org, Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ben Peddell <klightspeed@killerwolves.net>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

The bootloader on the Netgear ReadyNAS RN102 uses Hardware BCH ECC
(strength = 4), while the pxa3xx NAND driver by default uses 
Hamming ECC (strength = 1).

This patch changes the ECC mode on these machines to match that
of the bootloader and of the stock firmware, so that for example
updating the kernel is possible without requiring a serial
connection.

This patch depends on commit 5b3e507 (mtd: nand: pxa3xx: Use ECC
strength and step size devicetree binding)

Signed-off-by: Ben Peddell <klightspeed@killerwolves.net>
---
 arch/arm/boot/dts/armada-370-netgear-rn102.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
index d6d572e..285524f 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
@@ -143,6 +143,10 @@
 				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 
+				/* Use Hardware BCH ECC */
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+
 				partition@0 {
 					label = "u-boot";
 					reg = <0x0000000 0x180000>;  /* 1.5MB */
-- 
1.8.5.5
