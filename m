From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] dt/bindings: Add bindings for Micro
 Crystal rv8803
Date: Wed, 22 Jun 2016 08:42:20 +0200
Message-ID: <1466577742-18824-3-git-send-email-dirk.behme@de.bosch.com>
References: <1466577742-18824-1-git-send-email-dirk.behme@de.bosch.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDCMXBNSKAINHZVIXMCRUBABWICEC-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1466577742-18824-1-git-send-email-dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>

... and Epson RX8900 real time clock

Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/rtc/epson,rx8900.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
new file mode 100644
index 0000000..3f61e51
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
@@ -0,0 +1,22 @@
+Real Time Clock driver for:
+  - Epson RX8900
+  - Micro Crystal rv8803
+
+Required properties:
+- compatible: should be: "microcrystal,rv8803" or "epson,rx8900"
+- reg : the I2C address of the device for I2C
+
+Optional properties:
+- epson,vdet-disable : boolean, if present will disable voltage detector.
+  Should be set if no backup battery is used.
+- trickle-diode-disable : boolean, if present will disable internal trickle
+  charger diode
+
+Example:
+
+	rtc: rtc@32 {
+		compatible = "epson,rx8900"
+		reg = <0x32>;
+		epson,vdet-disable;
+		trickle-diode-disable;
+	};
-- 
1.9.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
