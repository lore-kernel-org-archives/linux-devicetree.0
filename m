From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: add mtk-timer bindings
Date: Wed,  9 Apr 2014 21:45:34 +0200
Message-ID: <1397072736-10793-3-git-send-email-matthias.bgg@gmail.com>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397072736-10793-1-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko.stuebner-K3U4GQvHnyU@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the General Porpose Timer driver of
the Mediatek SoCs.

Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/timer/mediatek,mtk-timer.txt          |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
new file mode 100644
index 0000000..db3c836
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -0,0 +1,19 @@
+Mediatek MT6598, MT6577 and MT6572 Timers
+---------------------------------------
+
+Required properties:
+- compatible: Should be "mediatek,mtk6589-timer"
+- reg: Should contain location and length for timers register.
+- clock-names : Must include the following entries:
+  "sysclk" (13 MHz system clock),
+  "rtcclk" (32 KHz RTC clock).
+
+Examples:
+
+	timer {
+		compatible = "mediatek,mtk6589-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc-clk>;
+		clock-names = "sysclk", "rtcclk";
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
