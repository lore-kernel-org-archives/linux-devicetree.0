From: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
Subject: [PATCH v1] Documentation: add Device tree bindings for hwmon/nct7802
Date: Mon, 31 Aug 2015 01:15:49 +0300
Message-ID: <1440973572-19571-1-git-send-email-const@MakeLinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

reg-init implementation is borowerd from
broadcom,c45-reg-init and marvell,reg-init.

Signed-off-by: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
---
---
 .../devicetree/bindings/hwmon/nct7802.txt          | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..fa83628
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,27 @@
+Nuvoton NCT7802Y Hardware Monitoring IC
+
+Required node properties:
+
+ - "compatible": must be "nuvoton,nct7802"
+ - "reg": I2C bus address of the device
+
+Optional properties:
+
+Numeric registors initialiaztion:
+
+- nct7802,reg-init : one of more sets of 4 cells.  The first cell
+  is the page address, the second a register address within the page,
+  the third cell contains a mask to be ANDed with the existing register
+  value, and the fourth cell is ORed with the result to yield the
+  new register value. If the third cell has a value of zero,
+  no read of the existing value is performed.
+
+Example nct7802 node:
+
+nct7802 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x2a>;
+	nct7802,reg-init =
+		<0 0x21 0 0x01 > // START = 1
+		<0 0x22 0x03 0x02>; // RTD1_MD = 2
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
