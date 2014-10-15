From: zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Subject: [PATCH 4/4] ARM: rockchip: add pmu-sram sub
Date: Wed, 15 Oct 2014 13:50:25 -0700
Message-ID: <1413406225-16366-1-git-send-email-zyw@rock-chips.com>
References: <1413405987-16196-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413405987-16196-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

The pmu-sram is used to store resume code, suspend/resume need get the
address of it. Therefore add a node and documentation for it.

Signed-off-by: Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 .../devicetree/bindings/arm/rockchip/pmu-sram.txt  |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt b/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
new file mode 100644
index 0000000..7a134cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
@@ -0,0 +1,15 @@
+Rockchip SRAM for pmu:
+------------------------------
+
+The sram of pmu is used to store the function of resume from maskrom(the 1st
+level loader).
+
+Required node properties:
+- compatible : should be "rockchip,rk3288-pmu-sram"
+- reg : physical base address and the size of the registers window
+
+Example:
+	pmu_intmem@ff720000 {
+		compatible = "mmio-sram", "rockchip,rk3288-pmu-sram";
+		reg = <0xff720000 0x4000>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
