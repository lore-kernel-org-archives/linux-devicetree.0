From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: Add mtk-systimer bindings
Date: Wed, 27 Jun 2018 15:53:58 +0800
Message-ID: <1530086039-3763-2-git-send-email-stanley.chu@mediatek.com>
References: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1530086039-3763-1-git-send-email-stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the System Timer driver of
the Mediatek SoCs.

Signed-off-by: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../bindings/timer/mediatek,mtk-systimer.txt       |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
new file mode 100644
index 0000000..7a5bde6
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
@@ -0,0 +1,18 @@
+Mediatek System Timers
+----------------------
+
+Required properties:
+- compatible: Should contain
+	"mediatek,sys_timer" for those platforms which support system timer.
+- reg: Should contain the location and length for system timer registers.
+- clocks: System timer is drived by system clock.
+
+Examples:
+
+	sys_timer@10017000 {
+		compatible = "mediatek,sys_timer";
+		reg = <0 0x10017000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sys_clk>;
+	};
+
-- 
1.7.9.5
