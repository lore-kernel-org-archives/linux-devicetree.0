From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt: fsl-fec.txt: Fix GPIO comment and remove hardcoded MAC
 address
Date: Tue, 24 Apr 2012 00:58:35 -0300
Message-ID: <1335239915-2563-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the comment for the GPIO number used for PHY reset and also avoid passing a 
hardcoded MAC address.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/net/fsl-fec.txt |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index de43951..3261203 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -9,9 +9,6 @@ Required properties:
   "rgmii", "rgmii-id", "rgmii-rxid", "rgmii-txid", "rtbi", "smii".
 - phy-reset-gpios : Should specify the gpio for phy reset
 
-Optional properties:
-- local-mac-address : 6 bytes, mac address
-
 Example:
 
 fec@83fec000 {
@@ -19,6 +16,5 @@ fec@83fec000 {
 	reg = <0x83fec000 0x4000>;
 	interrupts = <87>;
 	phy-mode = "mii";
-	phy-reset-gpios = <&gpio1 14 0>; /* GPIO2_14 */
-	local-mac-address = [00 04 9F 01 1B B9];
+	phy-reset-gpios = <&gpio1 14 0>; /* GPIO1_14 */
 };
-- 
1.7.1
