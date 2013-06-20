From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/7] metag: *.dts: include using preprocessor
Date: Thu, 20 Jun 2013 13:02:33 +0100
Message-ID: <1371729758-10196-3-git-send-email-james.hogan@imgtec.com>
References: <1371729758-10196-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371729758-10196-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Include *.dtsi files from *.dts using the preprocessor to set a good
example for future device tree files. Files included in the old way
don't get pre-processed.

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 arch/metag/boot/dts/skeleton.dts       | 2 +-
 arch/metag/boot/dts/tz1090.dtsi        | 2 +-
 arch/metag/boot/dts/tz1090_generic.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/metag/boot/dts/skeleton.dts b/arch/metag/boot/dts/skeleton.dts
index 7244d1f..7a49aeb 100644
--- a/arch/metag/boot/dts/skeleton.dts
+++ b/arch/metag/boot/dts/skeleton.dts
@@ -7,4 +7,4 @@
  */
 /dts-v1/;
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
diff --git a/arch/metag/boot/dts/tz1090.dtsi b/arch/metag/boot/dts/tz1090.dtsi
index ca057f0..ff7bb74 100644
--- a/arch/metag/boot/dts/tz1090.dtsi
+++ b/arch/metag/boot/dts/tz1090.dtsi
@@ -6,7 +6,7 @@
  * published by the Free Software Foundation.
  */
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	compatible = "toumaz,tz1090", "img,meta";
diff --git a/arch/metag/boot/dts/tz1090_generic.dts b/arch/metag/boot/dts/tz1090_generic.dts
index aa826cb..f960909 100644
--- a/arch/metag/boot/dts/tz1090_generic.dts
+++ b/arch/metag/boot/dts/tz1090_generic.dts
@@ -7,4 +7,4 @@
  */
 /dts-v1/;
 
-/include/ "tz1090.dtsi"
+#include "tz1090.dtsi"
-- 
1.8.1.2
