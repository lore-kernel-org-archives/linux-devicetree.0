From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 04/20] ARM: dts: imx6*-hummingboard2: move microsom includes
 into .dts
Date: Mon, 11 Dec 2017 16:57:37 +0000
Message-ID: <E1eOROb-0000H4-P4@rmk-PC.armlinux.org.uk>
References: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211165631.GW10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move the microsom includes into the .dts files.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard2.dts   | 1 +
 arch/arm/boot/dts/imx6q-hummingboard2.dts    | 1 +
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard2.dts b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
index 207ce329534a..30e042822ec6 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard2.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
@@ -42,6 +42,7 @@
 /dts-v1/;
 
 #include "imx6dl.dtsi"
+#include "imx6qdl-sr-som.dtsi"
 #include "imx6qdl-hummingboard2.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx6q-hummingboard2.dts b/arch/arm/boot/dts/imx6q-hummingboard2.dts
index b850111ddf34..8dcad5668c17 100644
--- a/arch/arm/boot/dts/imx6q-hummingboard2.dts
+++ b/arch/arm/boot/dts/imx6q-hummingboard2.dts
@@ -42,6 +42,7 @@
 /dts-v1/;
 
 #include "imx6q.dtsi"
+#include "imx6qdl-sr-som.dtsi"
 #include "imx6qdl-hummingboard2.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
index 2dfd8f5887fc..676160ef2718 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
@@ -38,7 +38,6 @@
  *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "imx6qdl-sr-som.dtsi"
 
 / {
 	chosen {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
