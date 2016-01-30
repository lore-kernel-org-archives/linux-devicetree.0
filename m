From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ARM: dts: cros-ec-keyboard: Add LOCK key to keyboard matrix
Date: Sat, 30 Jan 2016 10:38:24 +0800
Message-ID: <1454121504-12683-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, James Chao <james_chao-4gYQFoH7KfQ@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Chao <james_chao-4gYQFoH7KfQ@public.gmane.org>

The LOCK key is at KSO9/KSI3 for Chromebook Flip and other devices
that use the Chrome OS EC keyboard matrix.

Signed-off-by: James Chao <james_chao-4gYQFoH7KfQ@public.gmane.org>
Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/cros-ec-keyboard.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
index 4e42f30c..c045105 100644
--- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
+++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
@@ -55,6 +55,7 @@
 			MATRIX_KEY(0x03, 0x04, KEY_F5)
 			MATRIX_KEY(0x03, 0x06, KEY_6)
 			MATRIX_KEY(0x03, 0x08, KEY_MINUS)
+			MATRIX_KEY(0x03, 0x09, KEY_F13)
 			MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)
 			MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)
 
-- 
2.7.0.rc3.207.g0ac5344
