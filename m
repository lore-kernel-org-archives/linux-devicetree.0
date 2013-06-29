From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 07/12] ARM: mvebu: Use the preprocessor on Armada 370/XP
 device tree files
Date: Sat, 29 Jun 2013 16:04:10 -0300
Message-ID: <1372532655-20321-8-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1372532655-20321-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372532655-20321-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-db.dts              | 2 +-
 arch/arm/boot/dts/armada-370-mirabox.dts         | 2 +-
 arch/arm/boot/dts/armada-370-rd.dts              | 2 +-
 arch/arm/boot/dts/armada-370.dtsi                | 2 +-
 arch/arm/boot/dts/armada-xp-db.dts               | 2 +-
 arch/arm/boot/dts/armada-xp-gp.dts               | 2 +-
 arch/arm/boot/dts/armada-xp-mv78260.dtsi         | 2 +-
 arch/arm/boot/dts/armada-xp-mv78460.dtsi         | 2 +-
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 2 +-
 arch/arm/boot/dts/armada-xp.dtsi                 | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 2353b1f..231f8b2 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -14,7 +14,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-370.dtsi"
+#include "armada-370.dtsi"
 
 / {
 	model = "Marvell Armada 370 Evaluation Board";
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 14e36e1..7005f27 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -9,7 +9,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-370.dtsi"
+#include "armada-370.dtsi"
 
 / {
 	model = "Globalscale Mirabox";
diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index 130f839..5c3a1ec 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -12,7 +12,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-370.dtsi"
+#include "armada-370.dtsi"
 
 / {
 	model = "Marvell Armada 370 Reference Design";
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index fa3dfc6..08ec6e3 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -15,7 +15,7 @@
  * common to all Armada SoCs.
  */
 
-/include/ "armada-370-xp.dtsi"
+#include "armada-370-xp.dtsi"
 /include/ "skeleton.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index d6cc8bf..9a6ad0e 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -14,7 +14,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-xp-mv78460.dtsi"
+#include "armada-xp-mv78460.dtsi"
 
 / {
 	model = "Marvell Armada XP Evaluation Board";
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 76db557..df1caa3 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -14,7 +14,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-xp-mv78460.dtsi"
+#include "armada-xp-mv78460.dtsi"
 
 / {
 	model = "Marvell Armada XP Development Board DB-MV784MP-GP";
diff --git a/arch/arm/boot/dts/armada-xp-mv78260.dtsi b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
index 2d9335d..985373a 100644
--- a/arch/arm/boot/dts/armada-xp-mv78260.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
@@ -13,7 +13,7 @@
  * common to all Armada XP SoCs.
  */
 
-/include/ "armada-xp.dtsi"
+#include "armada-xp.dtsi"
 
 / {
 	model = "Marvell Armada XP MV78260 SoC";
diff --git a/arch/arm/boot/dts/armada-xp-mv78460.dtsi b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
index 488ca5e..3874548 100644
--- a/arch/arm/boot/dts/armada-xp-mv78460.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
@@ -13,7 +13,7 @@
  * common to all Armada XP SoCs.
  */
 
-/include/ "armada-xp.dtsi"
+#include "armada-xp.dtsi"
 
 / {
 	model = "Marvell Armada XP MV78460 SoC";
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index fdea75c..5f59a17 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -11,7 +11,7 @@
  */
 
 /dts-v1/;
-/include/ "armada-xp-mv78260.dtsi"
+#include "armada-xp-mv78260.dtsi"
 
 / {
 	model = "PlatHome OpenBlocks AX3-4 board";
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 1ee8540..3e770db 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -16,7 +16,7 @@
  * common to all Armada SoCs.
  */
 
-/include/ "armada-370-xp.dtsi"
+#include "armada-370-xp.dtsi"
 
 / {
 	model = "Marvell Armada XP family SoC";
-- 
1.8.1.5
