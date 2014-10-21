From: zyw@rock-chips.com
Subject: [PATCH v3 5/6] ARM: rockchip: Add pmu-sram binding
Date: Mon, 20 Oct 2014 20:44:44 -0700
Message-ID: <1413863084-2851-1-git-send-email-zyw@rock-chips.com>
References: <1413862894-2623-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413862894-2623-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Chris Zhong <zyw@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw@rock-chips.com>

The pmu-sram is used to store resume code, suspend/resume need get the
address of it. Therefore add a binding and documentation for it.

Signed-off-by: Tony Xie <xxx@rock-chips.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/arm/rockchip/pmu-sram.txt  |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt b/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
new file mode 100644
index 0000000..77284c0
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
+		compatible = "rockchip,rk3288-pmu-sram", "mmio-sram";
+		reg = <0xff720000 0x4000>;
+	};
-- 
1.7.9.5
