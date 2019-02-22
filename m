From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: [PATCH 1/3 v2] ARM: dts: rk3288-tinker.dtsi: Fix SD card detection
Date: Fri, 22 Feb 2019 18:47:08 +0000
Message-ID: <20190222184708.32004-1-beagleboard@davidjohnsummers.uk>
References: <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190217121513.22965-2-beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Problem:

On ASUS Tinker Board S, when booting from the eMMC, and there is no
card sd slot, then there are constant errors.

Cause:

Thanks must go to Robin Murphy @ ARM for idenifying the problem. The
rk808 on the Tinker Board and Tinker Board S has many regulators, one
vccio_sd powers the IO for the sd card. Unfortunatly this is also used
in the card detect. Now when no card is install, the regulator is
powered down. This means that the card detect floats, and this means
random card detection.

The Solution:

Make sure that the sd IO is always powered, this means card detection
is always active, which is what should be done on a board with an sd
slot, which both the Tinker Board and Tinker Board S are. Hence change
is made to the .dtsi which takes effect on all Tinker Boards as
required.

The change also adds "regulator-boot-on" the Tinker Board boot from
uboot, and the sd card is always one option. Hence the IO must be
powered in uboot, and so setting this flag.

Also removed is "disable-wp" the micro sd card which are used have no
write  protection, so the concept doesn't mean anything, and the
Tinker Boards work without this. Hence it is removed to simply.

This change came from ArchLinux Arm, but we note it is the fix also
used by Armbian:

https://github.com/Miouyouyou/RockMyy/blob/master/patches/kernel/v5.0/DTS/0016-ARM-DTSI-rk3288-tinker-Setting-up-the-SD-regulators.patch

Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index aa107ee41b8b..6b7e55085b0c 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -254,6 +254,8 @@
 			};
 
 			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vccio_sd";
@@ -431,7 +433,6 @@
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	card-detect-delay = <200>;
-	disable-wp;			/* wp not hooked up */
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
 	status = "okay";
-- 
beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
