From: Darshana Padmadas <darshanapadmadas@gmail.com>
Subject: [PATCH v5 4/4] arch: arm: boot: dts: Correct vendor-prefix for iio
 device isl29028 in compatible property
Date: Sat,  8 Nov 2014 22:52:08 +0530
Message-ID: <1415467328-9745-5-git-send-email-darshanapadmadas@gmail.com>
References: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devicetree@vger.kernel.org
Cc: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, opw-kernel@googlegroups.com, Darshana Padmadas <darshanapadmadas@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch corrects the vendor-prefix for isl29028 in the compatible property from
"isil,isl29028" to "isl,isl29028" according to listed vendor-prefixes in
Documentation/devicetree/bindings/vendor-prefixes.txt. Incorrect vendor-prefix "isl"
was reported by checkpatch.pl warning for drivers/staging/iio/light/isl29028.c.
Thus incorrect vendor-prefix "isil" was corrected for every mention of device isl29028.

Signed-off-by: Darshana Padmadas <darshanapadmadas@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 2063795..dcc6c75 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -187,7 +187,7 @@
 
 		/* ALS and Proximity sensor */
 		isl29028@44 {
-			compatible = "isil,isl29028";
+			compatible = "isl,isl29028";
 			reg = <0x44>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;
-- 
1.9.1
