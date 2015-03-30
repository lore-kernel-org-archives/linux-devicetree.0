From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 1/3] pinctrl: Document "function" + "pins" pinmux binding
Date: Mon, 30 Mar 2015 16:16:54 -0700
Message-ID: <1427757416-14491-2-git-send-email-abrestic@chromium.org>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently the "function" + "groups" combination is the only documented
format for pinmux nodes, although many drivers use "function" + "pins".
Update the generic pinctrl binding to include the "function" + "pins"
combination as well.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
New for v2.
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 47d84b6..f7688e2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -133,6 +133,9 @@ pin multiplexing nodes:
 
 function		- the mux function to select
 groups			- the list of groups to select with this function
+			  (either this or "pins" must be specified)
+pins			- the list of pins to select with this function (either
+			  this or "groups" must be specified)
 
 Example:
 
@@ -144,6 +147,10 @@ state_1_node_a {
 	function = "spi0";
 	groups = "spi0pins";
 };
+state_2_node_a {
+	function = "i2c0";
+	pins = "mfio29", "mfio30";
+};
 
 == Generic pin configuration node content ==
 
-- 
2.2.0.rc0.207.ga3a616c
