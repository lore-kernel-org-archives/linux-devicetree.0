From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] pinctrl: pinctrl-mxs: document the missing pull-ups
Date: Sat, 30 Mar 2013 00:51:12 +0100
Message-ID: <1364601072-30226-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some pins on the i.mx23 and i.mx28 are missing pull-ups, document that
oddity because it was difficult to know the expected behaviour.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---

I don't think it is necessary to list the pins with the missing pull ups in
that file but we may want to explicitly direct to the datasheet as even with
the same chip, it can depend on the package (BGA or QFP for example).

 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
index f7e8e8f..3077370 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
@@ -70,6 +70,10 @@ Optional subnode-properties:
     0: Disable the internal pull-up
     1: Enable the internal pull-up
 
+Note that when enabling the pull-up, the internal pad keeper gets disabled.
+Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
+will only disable the internal pad keeper.
+
 Examples:
 
 pinctrl@80018000 {
-- 
1.7.10.4

