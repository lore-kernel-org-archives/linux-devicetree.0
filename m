Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47824 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab3HLRgr (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 13:36:47 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V5 5/6] gpio: clean up gpio-ranges documentation
Date: Mon, 12 Aug 2013 11:36:31 -0600
Message-Id: <1376328992-3115-5-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

This change makes documentation of the the gpio-ranges property shorter
and more succinct, more consistent with the style of the rest of the
document, and not mention Linux-specifics such as the API
pinctrl_request_gpio(); DT binding documents should be OS independant
where at all possible. As part of this, the gpio-ranges property's format
is described in BNF form, in order to match the rest of the document.

This change also deprecates the #gpio-range-cells property. Such
properties are useful when one node references a second node, and that
second node dictates the format of the reference. However, that is not
the case here; the definition of gpio-ranges itself always dictates its
format entirely, and hence the value #gpio-range-cells must always be 3,
and hence there is no point requiring any referenced node to include
this property. The only remaining need for this property is to ensure
compatibility of DTs with older SW that was written to support the
previous version of the binding.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v5:
* Re-ordered patches so all of patches first, then gpio patches after.
v4:
* Mention #gpio-range-cells as being deprecated, rather than removing all
  documentation of that property. This allows DTs to be written in a
  backwards-compatible way if desired, and also allows older DTs to be
  interpreted fully using the latest documentation.
v3:
* Mention BNF in commit description.
* Fixed typo.
* Dropped patch that removed the deprecated property from *.dts, since
  it's required to boot older kernels.

Patches 2-4 need to be applied in the same branch, since they all build
upon each-other.
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 55 ++++++++++++++-----------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d933af3..6cec6ff 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -75,23 +75,36 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 		gpio-controller;
 	};
 
-2.1) gpio-controller and pinctrl subsystem
-------------------------------------------
+2.1) gpio- and pin-controller interaction
+-----------------------------------------
 
-gpio-controller on a SOC might be tightly coupled with the pinctrl
-subsystem, in the sense that the pins can be used by other functions
-together with optional gpio feature.
+Some or all of the GPIOs provided by a GPIO controller may be routed to pins
+on the package via a pin controller. This allows muxing those pins between
+GPIO and other functions.
 
-While the pin allocation is totally managed by the pin ctrl subsystem,
-gpio (under gpiolib) is still maintained by gpio drivers. It may happen
-that different pin ranges in a SoC is managed by different gpio drivers.
+It is useful to represent which GPIOs correspond to which pins on which pin
+controllers. The gpio-ranges property described below represents this, and
+contains information structures as follows:
 
-This makes it logical to let gpio drivers announce their pin ranges to
-the pin ctrl subsystem and call 'pinctrl_request_gpio' in order to
-request the corresponding pin before any gpio usage.
+	gpio-range-list ::= <single-gpio-range> [gpio-range-list]
+	single-gpio-range ::=
+			<pinctrl-phandle> <gpio-base> <pinctrl-base> <count>
+	gpio-phandle : phandle to pin controller node.
+	gpio-base : Base GPIO ID in the GPIO controller
+	pinctrl-base : Base pinctrl pin ID in the pin controller
+	count : The number of GPIOs/pins in this range
 
-For this, the gpio controller can use a pinctrl phandle and pins to
-announce the pinrange to the pin ctrl subsystem. For example,
+The "pin controller node" mentioned above must conform to the bindings
+described in ../pinctrl/pinctrl-bindings.txt.
+
+Previous versions of this binding required all pin controller nodes that
+were referenced by any gpio-ranges property to contain a property named
+#gpio-range-cells with value <3>. This requirement is now deprecated.
+However, that property may still exist in older device trees for
+compatibility reasons, and would still be required even in new device
+trees that need to be compatible with older software.
+
+Example:
 
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
@@ -99,16 +112,8 @@ announce the pinrange to the pin ctrl subsystem. For example,
 		reg = <0x1460 0x18>;
 		gpio-controller;
 		gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;
+	};
 
-    }
-
-where,
-   &pinctrl1 and &pinctrl2 is the phandle to the pinctrl DT node.
-
-   Next values specify the base pin and number of pins for the range
-   handled by 'qe_pio_e' gpio. In the given example from base pin 20 to
-   pin 29 under pinctrl1 with gpio offset 0 and pin 50 to pin 69 under
-   pinctrl2 with gpio offset 10 is handled by this gpio controller.
-
-The pinctrl node must have "#gpio-range-cells" property to show number of
-arguments to pass with phandle from gpio controllers node.
+Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
+pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
+pins 50..59.
-- 
1.8.1.5

