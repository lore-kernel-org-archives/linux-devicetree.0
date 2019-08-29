From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 04/14] of: irq: document properties for wakeup interrupt parent
Date: Thu, 29 Aug 2019 12:11:53 -0600
Message-ID: <20190829181203.2660-5-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some interrupt controllers in a SoC, are always powered on and have a
select interrupts routed to them, so that they can wakeup the SoC from
suspend. Add wakeup-parent DT property to refer to these interrupt
controllers.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../bindings/interrupt-controller/interrupts.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index 8a3c40829899..c10e31050dd2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -108,3 +108,16 @@ commonly used:
 			sensitivity = <7>;
 		};
 	};
+
+3) Interrupt wakeup parent
+--------------------------
+
+Some interrupt controllers in a SoC, are always powered on and have a select
+interrupts routed to them, so that they can wakeup the SoC from suspend. These
+interrupt controllers do not fall into the category of a parent interrupt
+controller and can be specified by the "wakeup-parent" property and contain a
+single phandle referring to the wakeup capable interrupt controller.
+
+   Example:
+	wakeup-parent = <&pdc_intc>;
+
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
