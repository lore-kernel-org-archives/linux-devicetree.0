From: <dinguyen@opensource.altera.com>
Subject: [PATCHv2 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Mon, 20 Oct 2014 10:31:18 -0500
Message-ID: <1413819079-17120-2-git-send-email-dinguyen@opensource.altera.com>
References: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, jh80.chung@samsung.com, dianders@chromium.org
Cc: devicetree@vger.kernel.org, dinh.linux@gmail.com, atull@opensource.altera.com, Dinh Nguyen <dinguyen@opensource.altera.com>, s.trumtrar@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Without this patch, the booting the SOCFPGA platform would hang at the
SDMMC driver loading. There were 2 patches that caused this to happen:

- Patch 9795a846e10 "mmc: dw_mmc: remove dw_mci_of_cd_gpio/wp_gpio()" removed
  looking for "cd-gpios", since mmc_of_parse was getting called.
- Patch 3cf890fc42b "mmc: dw_mmc: Pass back errors from mmc_of_parse()" would
  hang the system at the SDMMC driver loading.

This patch will fix booting with SDMMC enabled on SOCFPGA dev kit.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
index d7296a5..739c3b7 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
@@ -69,7 +69,7 @@
 };
 
 &mmc0 {
-	cd-gpios = <&gpio1 18 0>;
+	cd = <&gpio1 18 0>;
 };
 
 &usb1 {
-- 
2.0.3
