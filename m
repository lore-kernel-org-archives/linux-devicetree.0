From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 2/4] dt-binding: power: Add Qualcomm SMBB binding
Date: Thu, 18 Jun 2015 14:13:43 -0700
Message-ID: <1434662025-9485-3-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434662025-9485-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1434662025-9485-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Courtney Cavin <courtney.cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org

Add the Qualcomm Switch-Mode Battery Charger and Boost device tree
binding.

Signed-off-by: Courtney Cavin <courtney.cavin@sonymobile.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 .../devicetree/bindings/power_supply/qcom_smbb.txt | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/qcom_smbb.txt

diff --git a/Documentation/devicetree/bindings/power_supply/qcom_smbb.txt b/Documentation/devicetree/bindings/power_supply/qcom_smbb.txt
new file mode 100644
index 000000000000..8a1d75978664
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/qcom_smbb.txt
@@ -0,0 +1,137 @@
+Qualcomm Switch-Mode Battery Charger and Boost
+
+PROPERTIES
+- compatible:
+  Usage: required
+  Value type: <stringlist>
+  Description: Must be one of:
+               - "qcom,pm8941-charger"
+
+- reg:
+  Usage: required
+  Value type: <prop-encoded-array>
+  Description: Base address of registers for SMBB block
+
+- interrupts:
+  Usage: required
+  Value type: <prop-encoded-array>
+  Description: The format of the specifier is defined by the binding document
+               describing the node's interrupt parent.  Must contain one
+               specifier for each of the following interrupts, in order:
+               - charge done
+               - charge fast mode
+               - charge trickle mode
+               - battery temperature ok
+               - battery present
+               - charger disconnected
+               - USB-in valid
+               - DC-in valid
+
+- interrupt-names:
+  Usage: required
+  Value type: <stringlist>
+  Description: Must contain the following list, strictly ordered:
+               "chg-done",
+               "chg-fast",
+               "chg-trkl",
+               "bat-temp-ok",
+               "bat-present",
+               "chg-gone",
+               "usb-valid",
+               "dc-valid"
+
+- battery-charge-control-limit:
+  Usage: optional (default: 1A, or pre-configured value)
+  Value type: <u32>; uA; range [100mA : 3A]
+  Description: Maximum charge current; May be clamped to safety limits.
+
+- fast-charge-low-watermark:
+  Usage: optional (default: 3.2V, or pre-configured value)
+  Value type: <u32>; uV; range [2.1V : 3.6V]
+  Description: Battery voltage limit above which fast charging may operate;
+               Below this value linear or switch-mode auto-trickle-charging
+               will operate.
+
+- fast-charge-high-watermark:
+  Usage: optional (default: 4.2V, or pre-configured value)
+  Value type: <u32>; uV; range [3.24V : 5V]
+  Description: Battery voltage limit below which fast charging may operate;
+               The fast charger will attempt to charge the battery to this
+               voltage.  May be clamped to safety limits.
+
+- fast-charge-safe-voltage:
+  Usage: optional (default: 4.2V, or pre-configured value)
+  Value type: <u32>; uV; range [3.24V : 5V]
+  Description: Maximum safe battery voltage; May be pre-set by bootloader, in
+               which case, setting this will harmlessly fail. The property
+               'fast-charge-high-watermark' will be clamped by this value.
+
+- fast-charge-safe-current:
+  Usage: optional (default: 1A, or pre-configured value)
+  Value type: <u32>; uA; range [100mA : 3A]
+  Description: Maximum safe battery charge current; May pre-set by bootloader,
+               in which case, setting this will harmlessly fail. The property
+               'battery-charge-control-limit' will be clamped by this value.
+
+- auto-recharge-low-watermark:
+  Usage: optional (default: 4.1V, or pre-configured value)
+  Value type: <u32>; uV; range [3.24V : 5V]
+  Description: Battery voltage limit below which auto-recharge functionality
+               will restart charging after end-of-charge;  The high cutoff
+               limit for auto-recharge is 5% above this value.
+
+- minimum-input-voltage:
+  Usage: optional (default: 4.3V, or pre-configured value)
+  Value type: <u32>; uV; range [4.2V : 9.6V]
+  Description: Input voltage level above which charging may operate
+
+- usb-charge-control-limit:
+  Usage: optional (default: 100mA, or pre-configured value)
+  Value type: <u32>; uA; range [100mA : 2.5A]
+  Description: Default USB charge current
+
+- dc-charge-control-limit:
+  Usage: optional (default: 100mA, or pre-configured value)
+  Value type: <u32>; uA; range [100mA : 2.5A]
+  Description: Default DC charge current
+
+- disable-dc:
+  Usage: optional (default: false)
+  Value type: boolean: <u32> or <empty>
+  Description: Disable DC charger
+
+- jeita-extended-temp-range:
+  Usage: optional (default: false)
+  Value type: boolean: <u32> or <empty>
+  Description: Enable JEITA extended temperature range;  This does *not*
+               adjust the maximum charge voltage or current in the extended
+               temperature range.  It only allows charging when the battery
+               is in the extended temperature range.  Voltage/current
+               regulation must be done externally to fully comply with
+               the JEITA safety guidelines if this flag is set.
+
+EXAMPLE
+charger@1000 {
+       compatible = "qcom,pm8941-charger";
+       reg = <0x1000 0x700>;
+       interrupts = <0x0 0x10 7 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x10 5 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x10 4 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x12 1 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x12 0 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x13 2 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x13 1 IRQ_TYPE_EDGE_BOTH>,
+                       <0x0 0x14 1 IRQ_TYPE_EDGE_BOTH>;
+       interrupt-names = "chg-done",
+                       "chg-fast",
+                       "chg-trkl",
+                       "bat-temp-ok",
+                       "bat-present",
+                       "chg-gone",
+                       "usb-valid",
+                       "dc-valid";
+
+       battery-charge-control-limit = <1000000>;
+       usb-charge-control-limit = <500000>;
+       dc-charge-control-limit = <1000000>;
+};
-- 
1.8.2.2
