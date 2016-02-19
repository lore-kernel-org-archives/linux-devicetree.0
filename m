From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM64: dts: Mediatek: mt8173-evb: fix access MMC fail issue
Date: Fri, 19 Feb 2016 14:00:43 +0800
Message-ID: <1455861643-24307-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

MT8173 E1 chip has one bug that if turn off USB power domain, vcore
power will also be off, thus cause modules using vcore power domain
fail, like MMC. The E1 chip only found on MT8173-evb board and this
board only has E1 chip, so implement this as a board specific
workaround.

Pwrapper use vcore power, so add pwrapper using USB power domain to
keep USB power domain not to zero and disabled.

Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

---
Sascha sent similar patch before[0], but MMC support runtime-pm,
vcore power domain still be disabled after MMC and USB suspend.
This silicon bug already fix in MT8173 MP chip.

[0]:http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/358065.html
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index e427f04..7453a47 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -214,6 +214,9 @@
 };
 
 &pwrap {
+	/* Only MT8173 E1 needs USB power domain */
+	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+
 	pmic: mt6397 {
 		compatible = "mediatek,mt6397";
 		interrupt-parent = <&pio>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
