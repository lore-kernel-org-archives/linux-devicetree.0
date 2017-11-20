From: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] DT: i2c: W83773G is a trivial device
Date: Mon, 20 Nov 2017 13:53:43 +0800
Message-ID: <1511157223-7162-1-git-send-email-mine260309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index af284fb..3c393e3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -151,6 +151,7 @@ national,lm85		Temperature sensor with integrated fan control
 national,lm92		±0.33°C Accurate, 12-Bit + Sign Temperature Sensor and Thermal Window Comparator with Two-Wire Interface
 nuvoton,npct501		i2c trusted platform module (TPM)
 nuvoton,npct601		i2c trusted platform module (TPM2)
+nuvoton,w83773g		Nuvoton Temperature Sensor
 nxp,pca9556		Octal SMBus and I2C registered interface
 nxp,pca9557		8-bit I2C-bus and SMBus I/O port with reset
 nxp,pcf2127		Real-time clock
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
