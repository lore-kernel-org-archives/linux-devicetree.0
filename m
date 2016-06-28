From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] Document: DT: Add bindings for mediatek MT6755 SoC
 Platform
Date: Tue, 28 Jun 2016 13:15:55 +0800
Message-ID: <1467090956-31757-2-git-send-email-mars.cheng@mediatek.com>
References: <1467090956-31757-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467090956-31757-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds DT binding documentation for Mediatek MT6755.

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index d9c2a37..c860b24 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -10,6 +10,7 @@ compatible: Must contain one of
    "mediatek,mt6580"
    "mediatek,mt6589"
    "mediatek,mt6592"
+   "mediatek,mt6755"
    "mediatek,mt6795"
    "mediatek,mt7623"
    "mediatek,mt8127"
@@ -31,6 +32,9 @@ Supported boards:
 - Evaluation board for MT6592:
     Required root node properties:
       - compatible = "mediatek,mt6592-evb", "mediatek,mt6592";
+- Evaluation phone for MT6755(Helio P10):
+    Required root node properties:
+      - compatible = "mediatek,mt6755-evb", "mediatek,mt6755";
 - Evaluation board for MT6795(Helio X10):
     Required root node properties:
       - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 8cf564d..9d1d72c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -9,6 +9,7 @@ Required properties:
 	"mediatek,mt8135-sysirq"
 	"mediatek,mt8127-sysirq"
 	"mediatek,mt6795-sysirq"
+	"mediatek,mt6755-sysirq"
 	"mediatek,mt6592-sysirq"
 	"mediatek,mt6589-sysirq"
 	"mediatek,mt6582-sysirq"
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index e99e10a..0015c72 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -6,6 +6,7 @@ Required properties:
   * "mediatek,mt6580-uart" for MT6580 compatible UARTS
   * "mediatek,mt6582-uart" for MT6582 compatible UARTS
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
+  * "mediatek,mt6755-uart" for MT6755 compatible UARTS
   * "mediatek,mt6795-uart" for MT6795 compatible UARTS
   * "mediatek,mt7623-uart" for MT7623 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
-- 
1.7.9.5
