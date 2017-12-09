From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 6/7] dt-bindings: usb: mtu3: add USB wakeup properties
Date: Sat, 9 Dec 2017 16:45:35 +0800
Message-ID: <1512809136-2779-7-git-send-email-chunfeng.yun@mediatek.com>
References: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512809136-2779-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Modify the properties of usb wakeup, and use the new way of mtu_wakeup
which is extracted from SSUSB controller dirver as a new driver.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index b2271d8..2ed546d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -42,9 +42,17 @@ Optional properties:
  - enable-manual-drd : supports manual dual-role switch via debugfs; usually
 	used when receptacle is TYPE-A and also wants to support dual-role
 	mode.
- - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
- - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
-	control register, it depends on "mediatek,enable-wakeup".
+ - mediatek,uwks : a phandle to USB-Wakeup node to control the type of wakeup,
+	it's used to replace the old way which is realized by the property of
+	"mediatek,wakeup-wakeup" and "mediatek,syscon-wakeup",
+	see: Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt
+ - wakeup-source : Decides if the new way of USB wakeup is supported or
+	not, it depends on "mediatek,uwks" property.
+ - mediatek,enable-wakeup : (deprecated) supports ip sleep wakeup used by
+	host mode, only supports mt8173 platform, use the property of
+	"mediatek,uwks" instead on other SoCs.
+ - mediatek,syscon-wakeup : (deprecated) phandle to syscon used to access
+	USB wakeup control register, it depends on "mediatek,enable-wakeup".
  - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
 	bit1 for u3port1, ... etc;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
