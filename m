Return-Path: <SRS0=48Gu=FV=armlinux.org.uk=rmk+robh+dt=kernel.org@kernel.org>
In-Reply-To: <20180227155218.GT9418@n2100.armlinux.org.uk>
References: <20180227155218.GT9418@n2100.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next 3/4] dt-bindings: add maximum power level to SFP
 binding
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1eqhYx-0003th-OT@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 27 Feb 2018 15:53:07 +0000
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add the new maximum power level property to the SFP binding.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 Documentation/devicetree/bindings/net/sff,sfp.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sff,sfp.txt b/Documentation/devicetree/bindings/net/sff,sfp.txt
index f1c441bedf68..929591d52ed6 100644
--- a/Documentation/devicetree/bindings/net/sff,sfp.txt
+++ b/Documentation/devicetree/bindings/net/sff,sfp.txt
@@ -33,6 +33,10 @@ Transceiver
   Select (AKA RS1) output gpio signal (SFP+ only), low: low Tx rate, high:
   high Tx rate. Must not be present for SFF modules
 
+- maximum-power-milliwatt : Maximum module power consumption
+  Specifies the maximum power consumption allowable by a module in the
+  slot, in milli-Watts.  Presently, modules can be up to 1W, 1.5W or 2W.
+
 Example #1: Direct serdes to SFP connection
 
 sfp_eth3: sfp-eth3 {
@@ -40,6 +44,7 @@ sfp_eth3: sfp-eth3 {
 	i2c-bus = <&sfp_1g_i2c>;
 	los-gpios = <&cpm_gpio2 22 GPIO_ACTIVE_HIGH>;
 	mod-def0-gpios = <&cpm_gpio2 21 GPIO_ACTIVE_LOW>;
+	maximum-power-milliwatt = <1000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&cpm_sfp_1g_pins &cps_sfp_1g_pins>;
 	tx-disable-gpios = <&cps_gpio1 24 GPIO_ACTIVE_HIGH>;
-- 
2.7.4
