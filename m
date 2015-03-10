From: =?ISO-8859-1?Q?S=F8ren?= Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>
Subject: [patch v2 2/4] pcf85063 is not a trivial device
Date: Tue, 10 Mar 2015 21:31:09 +0100
Message-ID: <1426019469.5476.18.camel@sanws1.rosetechnology.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: rtc-linux-/JYPxA39Uh6Zox4op4iWzw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Soeren Andersen <san at rosetechnology.dk>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index aaa8325..3b1a3c5 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -76,7 +76,6 @@ nuvoton,npct501		i2c trusted platform module (TPM)
 nxp,pca9556		Octal SMBus and I2C registered interface
 nxp,pca9557		8-bit I2C-bus and SMBus I/O port with reset
 nxp,pcf8563		Real-time clock/calendar
-nxp,pcf85063		Tiny Real-Time Clock
 ovti,ov5642		OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI and Embedded TrueFocus
 pericom,pt7c4338	Real-time Clock Module
 plx,pex8648		48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
    

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
