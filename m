From: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/4] ARM: davinci: da850: Use #include for all device trees
Date: Fri, 14 Jun 2013 15:15:53 +0530
Message-ID: <1371203156-15260-2-git-send-email-avinashphilip@ti.com>
References: <1371203020-15092-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1371203020-15092-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, avinashphilip-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Replace /include/ by #include for da850 device tree files, in order to
use the C pre-processor, making use of #define features possible.

Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
---
Changes since v1:
	- New patch and comes as a dependency of patch 3/4

 arch/arm/boot/dts/da850-enbw-cmc.dts |    2 +-
 arch/arm/boot/dts/da850-evm.dts      |    2 +-
 arch/arm/boot/dts/da850.dtsi         |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/da850-enbw-cmc.dts b/arch/arm/boot/dts/da850-enbw-cmc.dts
index 422fdb3..e750ab9 100644
--- a/arch/arm/boot/dts/da850-enbw-cmc.dts
+++ b/arch/arm/boot/dts/da850-enbw-cmc.dts
@@ -10,7 +10,7 @@
  * option) any later version.
  */
 /dts-v1/;
-/include/ "da850.dtsi"
+#include "da850.dtsi"
 
 / {
 	compatible = "enbw,cmc", "ti,da850";
diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index c914357..5bce7cc 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -8,7 +8,7 @@
  * Free Software Foundation, version 2.
  */
 /dts-v1/;
-/include/ "da850.dtsi"
+#include "da850.dtsi"
 
 / {
 	compatible = "ti,da850-evm", "ti,da850";
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 452bdc6..3b66020 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -7,7 +7,7 @@
  * Free Software Foundation;  either version 2 of the  License, or (at your
  * option) any later version.
  */
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	arm {
-- 
1.7.9.5
