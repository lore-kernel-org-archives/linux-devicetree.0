From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 3/3] ARM: dts: Add Arria10 SD/MMC EDAC devicetree entry
Date: Tue, 9 Aug 2016 09:40:53 -0500
Message-ID: <1470753653-23465-4-git-send-email-tthayer@opensource.altera.com>
References: <1470753653-23465-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470753653-23465-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@osg.samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree entries needed to support the Altera SD/MMC
FIFO buffer EDAC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
v2  No change
---
 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
index 8a7dfa4..040a164 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
@@ -25,3 +25,15 @@
 	broken-cd;
 	bus-width = <4>;
 };
+
+&eccmgr {
+	sdmmca-ecc@ff8c2c00 {
+		compatible = "altr,socfpga-sdmmc-ecc";
+		reg = <0xff8c2c00 0x400>;
+		altr,ecc-parent = <&mmc>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
+			     <47 IRQ_TYPE_LEVEL_HIGH>,
+			     <16 IRQ_TYPE_LEVEL_HIGH>,
+			     <48 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
1.7.9.5
