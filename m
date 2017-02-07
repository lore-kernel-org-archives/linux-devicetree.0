From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] bindings: rtc: correct wrong reference in
 required properties
Date: Wed,  8 Feb 2017 04:36:53 +0900
Message-ID: <1486496213-11790-1-git-send-email-akinobu.mita@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCPM5SUWUYIRB3GD5DCAKGQEPRHHISQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are currently two broken bindings descriptions for RTC:

maxim,ds3231.txt
pcf8563.txt

They broke because of a improper RST documentation conversion with
commit 8c27ceff3604b2 ("docs: fix locations of several documents that got
moved") and now reference to a non-existing file:

Documentation/devicetree/bindings/i2c/trivial-admin-guide/devices.rst

However, the original reference to i2c/trivial-devices should have never
been made in the first place.

This change fixes this issue by replacing with correct descriptions.

Reported-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/maxim,ds3231.txt | 3 ++-
 Documentation/devicetree/bindings/rtc/pcf8563.txt      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt b/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
index 1ad4c1c..85be53a 100644
--- a/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
+++ b/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
@@ -1,7 +1,8 @@
 * Maxim DS3231 Real Time Clock
 
 Required properties:
-see: Documentation/devicetree/bindings/i2c/trivial-admin-guide/devices.rst
+- compatible: Should contain "maxim,ds3231".
+- reg: I2C address for chip.
 
 Optional property:
 - #clock-cells: Should be 1.
diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
index 086c998..36984ac 100644
--- a/Documentation/devicetree/bindings/rtc/pcf8563.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf8563.txt
@@ -3,7 +3,8 @@
 Philips PCF8563/Epson RTC8564 Real Time Clock
 
 Required properties:
-see: Documentation/devicetree/bindings/i2c/trivial-admin-guide/devices.rst
+- compatible: Should contain "nxp,pcf8563".
+- reg: I2C address for chip.
 
 Optional property:
 - #clock-cells: Should be 0.
-- 
2.7.4

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
