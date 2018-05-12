From: Adam Ford <aford173@gmail.com>
Subject: [PATCH V3] ARM: dts: da850-evm: add WP and CD to MMC
Date: Sat, 12 May 2018 07:23:58 -0500
Message-ID: <20180512122358.17459-1-aford173@gmail.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, devicetree@vger.kernel.org, nsekhar@ti.com, khilman@kernel.org
List-Id: devicetree@vger.kernel.org

The legacy mode uses the write protect and card detect but DT does not.
This patch enables Write-Protect and Card-Detect pins for the MMC card, and
the gpio-ranges property sets the gpio pinmuxing for those respective pins.

Signed-off-by: Adam Ford <aford173@gmail.com>
--

V3: Update description of the patch. Rebase on davinci 4.18/dt
V2: Rebase on davinci master and remove GPIO pinmuxing

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index e91f81f21b22..2e817da37fdb 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -149,6 +149,8 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
+	cd-gpios = <&gpio 64 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio 65 GPIO_ACTIVE_HIGH>;
 };
 
 &spi1 {
-- 
2.17.0
