From: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: LPC32xx: DTS update for devicetree completion of
 spi-pl022
Date: Tue, 18 Sep 2012 15:00:27 +0200
Message-ID: <1347973228-29839-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kevin.wells-3arQi8VN3Tc@public.gmane.org, srinivas.bakki-3arQi8VN3Tc@public.gmane.org
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

spi-pl022 got a further update to its devicetree support, completing properties
such that no platform data is necessary anymore. This patch adjusts
lpc32xx.dtsi accordingly.

Signed-off-by: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>

---
I will do a git pull request for arm-soc.git when the respective change in
spi-pl022.c is merged.

 arch/arm/boot/dts/lpc32xx.dtsi |    2 ++
 1 file changed, 2 insertions(+)

--- linux-2.6.orig/arch/arm/boot/dts/lpc32xx.dtsi
+++ linux-2.6/arch/arm/boot/dts/lpc32xx.dtsi
@@ -91,6 +91,7 @@
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x20084000 0x1000>;
 				interrupts = <0x14 0>;
+				pl022,bus-id = <0>;
 			};
 
 			spi1: spi@20088000 {
@@ -102,6 +103,7 @@
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x2008c000 0x1000>;
 				interrupts = <0x15 0>;
+				pl022,bus-id = <1>;
 			};
 
 			spi2: spi@20090000 {
