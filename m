From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 3/4] mfd: arizona: Remove bindings covered in new subsystem specific docs
Date: Tue, 27 Oct 2015 16:01:58 +0000
Message-ID: <1445961719-1020-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Binding documentation has been added in new subsystem specific binding
documents. This patch removes the now duplicate documentation from the
MFD documentation.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v2:
 - No longer moving the core regulators into the regulator binding document,
   as they are properties of the device as a whole not just the regulators
 - Moved the maintainer updates into a seperate patch

Lee, I have removed your ack because the patch has changed a fair amount.
Apologies if this would not have been your preference.

Thanks,
Charles

 Documentation/devicetree/bindings/mfd/arizona.txt |   15 +++------------
 1 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a8fee60..18be0cb 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -44,7 +44,6 @@ Required properties:
 Optional properties:
 
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
-  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
 
   - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
     for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
@@ -67,21 +66,13 @@ Optional properties:
     present, the number of values should be less than or equal to the
     number of inputs, unspecified inputs will use the chip default.
 
-  - wlf,hpdet-channel : Headphone detection channel.
-    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to HPDETL
-    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
-    If this node is not mentioned or if the value is unknown, then
-    headphone detection mode is set to HPDETL.
-
   - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
     they are being externally supplied. As covered in
     Documentation/devicetree/bindings/regulator/regulator.txt
 
-Optional subnodes:
-  - ldo1 : Initial data for the LDO1 regulator, as covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt
-  - micvdd : Initial data for the MICVDD regulator, as covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt
+Also see child specific device properties:
+  Regulator - ../regulator/arizona-regulator.txt
+  Extcon    - ../extcon/extcon-arizona.txt
 
 Example:
 
-- 
1.7.2.5
