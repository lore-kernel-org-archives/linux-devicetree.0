Return-Path: <SRS0=7p7P=U3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:34258 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfF1DZz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Jun 2019 23:25:55 -0400
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 1/2] dt-bindings: clock: cdce925: Add regulator documentation
Date: Fri, 28 Jun 2019 11:19:09 +0800
Message-Id: <1561691950-42154-2-git-send-email-preid@electromag.com.au>
In-Reply-To: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The cdce925 has two separate supply pins. Document the bindings
for them.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/clock/ti,cdce925.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.txt b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
index 0d01f2d..26544c8 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce925.txt
+++ b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
@@ -24,6 +24,8 @@ Required properties:
 Optional properties:
  - xtal-load-pf: Crystal load-capacitor value to fine-tune performance on a
                  board, or to compensate for external influences.
+- vdd-supply: A regulator node for Vdd
+- vddout-supply: A regulator node for Vddout
 
 For all PLL1, PLL2, ... an optional child node can be used to specify spread
 spectrum clocking parameters for a board.
@@ -41,6 +43,8 @@ Example:
 		clocks = <&xtal_27Mhz>;
 		#clock-cells = <1>;
 		xtal-load-pf = <5>;
+		vdd-supply = <&1v8-reg>;
+		vddout-supply = <&3v3-reg>;
 		/* PLL options to get SSC 1% centered */
 		PLL2 {
 			spread-spectrum = <4>;
-- 
1.8.3.1
