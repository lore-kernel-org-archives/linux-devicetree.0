From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [v2 PATCH 3/6] dt-bindings: usb: mtu3: update USB wakeup properties
Date: Wed, 3 Jan 2018 16:53:19 +0800
Message-ID: <9ded06bb1264f2c05ba7f52ecf1619d5e595d80f.1514967463.git.chunfeng.yun@mediatek.com>
References: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add two arguments in "mediatek,syscon-wakeup" to support multi
wakeup glue layer between SSUSB and SPM, and use standard property
"wakeup-source" to replace the private "mediatek,enable-wakeup"

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index b2271d8..d589a1e 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -42,9 +42,14 @@ Optional properties:
  - enable-manual-drd : supports manual dual-role switch via debugfs; usually
 	used when receptacle is TYPE-A and also wants to support dual-role
 	mode.
- - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
- - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
-	control register, it depends on "mediatek,enable-wakeup".
+ - wakeup-source: enable USB remote wakeup of host mode.
+ - mediatek,syscon-wakeup : phandle to syscon used to access the register
+	of the USB wakeup glue layer between SSUSB and SPM; it depends on
+	"wakeup-source", and has two arguments:
+	- the first one : register base address of the glue layer in syscon;
+	- the second one : hardware version of the glue layer
+		- 1 : used by mt8173 etc
+		- 2 : used by mt2712 etc
  - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
 	bit1 for u3port1, ... etc;
 
@@ -71,8 +76,8 @@ ssusb: usb@11271000 {
 	vbus-supply = <&usb_p0_vbus>;
 	extcon = <&extcon_usb>;
 	dr_mode = "otg";
-	mediatek,enable-wakeup;
-	mediatek,syscon-wakeup = <&pericfg>;
+	wakeup-source;
+	mediatek,syscon-wakeup = <&pericfg 0x400 1>;
 	#address-cells = <2>;
 	#size-cells = <2>;
 	ranges;
-- 
1.9.1
