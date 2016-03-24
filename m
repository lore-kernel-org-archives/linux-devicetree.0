From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] Documentation: devicetree: amlogic: Document P20x and ODROID-C2 boards
Date: Thu, 24 Mar 2016 11:05:13 -0700
Message-ID: <1458842715-27066-3-git-send-email-khilman@baylibre.com>
References: <1458842715-27066-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458842715-27066-1-git-send-email-khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, afaerber-IBi9RG/b67k@public.gmane.org, carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add compatible strings for Amlogic S905/GXBB based boards: Hardkernel
ODROID-C2, Amlogic P200 and Amlogic P201.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reviewed-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Docume=
ntation/devicetree/bindings/arm/amlogic.txt
index 8a5122ab19b0..fcc6f6c10803 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -25,3 +25,6 @@ Board compatible values:
   - "tronsmart,vega-s95-pro", "tronsmart,vega-s95" (Meson gxbb)
   - "tronsmart,vega-s95-meta", "tronsmart,vega-s95" (Meson gxbb)
   - "tronsmart,vega-s95-telos", "tronsmart,vega-s95" (Meson gxbb)
+  - "hardkernel,odroid-c2" (Meson gxbb)
+  - "amlogic,p200" (Meson gxbb)
+  - "amlogic,p201" (Meson gxbb)
--=20
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
