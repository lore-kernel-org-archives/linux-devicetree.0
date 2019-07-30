From: Richard Tresidder <rtresidd@electromag.com.au>
Subject: [RESEND v2 1/2] dt-binding docs: sbs_sbs-battery: Addition of force_load binding
Date: Tue, 30 Jul 2019 18:10:03 +0800
Message-ID: <1564481404-39505-2-git-send-email-rtresidd@electromag.com.au>
References: <1564481404-39505-1-git-send-email-rtresidd@electromag.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564481404-39505-1-git-send-email-rtresidd@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, rtresidd@electromag.com.au, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, tglx@linutronix.de, rfontana@redhat.com, allison@lohutok.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for addition of force_load boolean value
to allow loading a battery during boot even if notpresent at that time.

Signed-off-by: Richard Tresidder <rtresidd@electromag.com.au>
---
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
