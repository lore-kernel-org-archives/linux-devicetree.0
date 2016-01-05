From: <dinguyen@opensource.altera.com>
Subject: [PATCH] ARM: dts: socfpga: add cap-sd-highspeed for SD/MMC node
Date: Tue, 5 Jan 2016 14:26:43 -0600
Message-ID: <1452025603-8801-1-git-send-email-dinguyen@opensource.altera.com>
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
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Enable SD highspeed support for the SoCFPGA Arria10 devkit.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
index dbbb751..8a7dfa4 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
@@ -21,6 +21,7 @@
 &mmc {
 	status = "okay";
 	num-slots = <1>;
+	cap-sd-highspeed;
 	broken-cd;
 	bus-width = <4>;
 };
-- 
2.6.2
