Return-Path: <SRS0=7VNh=VW=electromag.com.au=rtresidd@kernel.org>
From: Richard Tresidder <rtresidd@electromag.com.au>
Subject: [PATCH 1/1] dt-bindings: power/supply/sbs_sbs-battery: Addition of force_load binding Add device tree binding documentation for addition of force_load boolean value to allow loading a battery during boot even if not present at that time.
Date: Thu, 25 Jul 2019 14:50:45 +0800
Message-Id: <1564037445-22936-1-git-send-email-rtresidd@electromag.com.au>
To: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, rtresidd@electromag.com.au, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Richard Tresidder <rtresidd@electromag.com.au>
---

Notes:
    Add device tree binding documentation for addition of force_load
    boolean value to allow loading a battery during boot even if not
    present at that time.
    Accompanying patch to drivers/power/supply/sbs-battery.c submitted to linux-pm@vger.kernel.org

 Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
index 4e78e51..187d7bb 100644
--- a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
+++ b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
@@ -15,7 +15,8 @@ Optional properties :
    after an external change notification.
  - sbs,battery-detect-gpios : The gpio which signals battery detection and
    a flag specifying its polarity.
-
+ - sbs,force-load : Allow loading of a hot-pluggable battery when there is no
+   GPIO detect available and the module is statically built.
 Example:
 
 	battery@b {
@@ -24,4 +25,5 @@ Example:
 		sbs,i2c-retry-count = <2>;
 		sbs,poll-retry-count = <10>;
 		sbs,battery-detect-gpios = <&gpio-controller 122 1>;
+		sbs,force-load;
 	}
-- 
1.8.3.1
