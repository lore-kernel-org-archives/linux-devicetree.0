From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2 03/16] ARM: dts: imx6qdl-microsom: rename to imx6qdl-sr-som
Date: Tue, 28 Nov 2017 15:02:10 +0000
Message-ID: <E1eJhOk-0006NH-8m@rmk-PC.armlinux.org.uk>
References: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171128150045.GV31757@n2100.armlinux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jon Nettleton <jon@solid-run.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Jon and myself feel that "imx6qdl-microsom" is too generic a name for
SolidRun's microsom - some other manufacturer could have their own
microsom.  Change the name to the shorter "imx6qdl-sr-som".

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/imx6q-h100.dts                                 | 2 +-
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi                           | 2 +-
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi                      | 2 +-
 arch/arm/boot/dts/{imx6qdl-microsom.dtsi => imx6qdl-sr-som.dtsi} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm/boot/dts/{imx6qdl-microsom.dtsi => imx6qdl-sr-som.dtsi} (100%)

diff --git a/arch/arm/boot/dts/imx6q-h100.dts b/arch/arm/boot/dts/imx6q-h100.dts
index bf5dfc9c8127..815e9437e3f0 100644
--- a/arch/arm/boot/dts/imx6q-h100.dts
+++ b/arch/arm/boot/dts/imx6q-h100.dts
@@ -42,7 +42,7 @@
 /dts-v1/;
 
 #include "imx6q.dtsi"
-#include "imx6qdl-microsom.dtsi"
+#include "imx6qdl-sr-som.dtsi"
 
 / {
 	model = "Auvidea H100";
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 57ce2dbb6ad9..0bc1734d8bdf 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -38,7 +38,7 @@
  *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "imx6qdl-microsom.dtsi"
+#include "imx6qdl-sr-som.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index afd981e9b5e3..246984992ad0 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -38,7 +38,7 @@
  *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "imx6qdl-microsom.dtsi"
+#include "imx6qdl-sr-som.dtsi"
 
 / {
 	chosen {
diff --git a/arch/arm/boot/dts/imx6qdl-microsom.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
similarity index 100%
rename from arch/arm/boot/dts/imx6qdl-microsom.dtsi
rename to arch/arm/boot/dts/imx6qdl-sr-som.dtsi
-- 
2.7.4
