From: <yongqiang.niu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5,
 01/32] dt-bindings: mediatek: add binding for mt8183 display
Date: Thu, 29 Aug 2019 22:50:23 +0800
Message-ID: <1567090254-15566-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob
 Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yongqiang Niu <yongqiang.niu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Update device tree binding documention for the display subsystem for
Mediatek MT8183 SOCs

Signed-off-by: Yongqiang Niu <yongqiang.niu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../bindings/display/mediatek/mediatek,display.txt  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,display.txt

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,display.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,display.txt
new file mode 100644
index 0000000..951d2a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,display.txt
@@ -0,0 +1,21 @@
+Mediatek Display Device
+============================
+
+The Mediatek Display Device provides power control to the system.
+
+Required Properties:
+
+- compatible: Should be one of:
+	- "mediatek,mt8183-display"
+
+The Display Device power name are defined in
+include\dt-bindings\power\mt*-power.h
+
+
+Example:
+
+display_components: dispsys@14000000 {
+	compatible = "mediatek,mt8183-display";
+	reg = <0 0x14000000 0 0x1000>;
+	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+};
\ No newline at end of file
-- 
1.8.1.1.dirty
