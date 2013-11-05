From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] Documentation/mfd: Fix typos in s2mps11.txt
Date: Tue,  5 Nov 2013 12:27:20 +0530
Message-ID: <1383634640-26869-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixed trivial typos to improve readability.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index c9332c6..0ff4e65 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,10 +1,10 @@
 
 * Samsung S2MPS11 Voltage and Current Regulator
 
-The Samsung S2MP211 is a multi-function device which includes voltage and
+The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
-interfaced to the host controller using a I2C interface. Each sub-block is
-addressed by the host system using different I2C slave address.
+interfaced to the host controller using an I2C interface. Each sub-block is
+addressed by the host system using different I2C slave addresses.
 
 Required properties:
 - compatible: Should be "samsung,s2mps11-pmic".
@@ -43,7 +43,8 @@ sub-node should be of the format as listed below.
 
  BUCK[2/3/4/6] supports disabling ramp delay on hardware, so explictly
  regulator-ramp-delay = <0> can be used for them to disable ramp delay.
- In absence of regulator-ramp-delay property, default ramp delay will be used.
+ In the absence of regulator-ramp-delay property, default ramp delay will
+ be used.
 
 NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value will be set
 for a particular group of BUCKs. So provide same regulator-ramp-delay<value>.
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
