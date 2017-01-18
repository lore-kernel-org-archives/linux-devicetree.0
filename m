From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/3] arm64: dts: juno: Add dma-ranges property
Date: Wed, 18 Jan 2017 12:12:50 +0000
Message-ID: <74595d6d866518db7cfabc39b4cf9b54d3be9bde.1484741104.git.robin.murphy@arm.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: lorenzo.pieralisi@arm.com, liviu.dudau@arm.com, sudeep.holla@arm.com
List-Id: devicetree@vger.kernel.org

The interconnects around Juno have a 40-bit address width, and DMA
masters have no restrictions beyond their own individual limitations.
Describe this to ensure that DT-based DMA masks get set up correctly
for all devices capable of 40-bit addressing.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

These apply on top of Sudeep's for-next/updates/juno branch, which
supercedes the .dtsi cleanup I had locally to make this one work.

Robin.

 arch/arm64/boot/dts/arm/juno-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 44db27776b9d..5e7640d6ec69 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -4,6 +4,7 @@
 	/*
 	 *  Devices shared by all Juno boards
 	 */
+	dma-ranges = <0 0 0 0 0x100 0>;
 
 	memtimer: timer@2a810000 {
 		compatible = "arm,armv7-timer-mem";
-- 
2.11.0.dirty
