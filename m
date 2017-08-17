From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: Add bindings for Dongwoon DW9714 voice coil
Date: Thu, 17 Aug 2017 16:42:54 +0300
Message-ID: <1502977376-22836-2-git-send-email-sakari.ailus@linux.intel.com>
References: <1502977376-22836-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502977376-22836-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dongwoon DW9714 is a voice coil lens driver.

Also add a vendor prefix for Dongwoon for one did not exist previously.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt           | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
new file mode 100644
index 0000000..b88dcdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
@@ -0,0 +1,9 @@
+Dongwoon Anatech DW9714 camera voice coil lens driver
+
+DW9174 is a 10-bit DAC with current sink capability. It is intended
+for driving voice coil lenses in camera modules.
+
+Mandatory properties:
+
+- compatible: "dongwoon,dw9714"
+- reg: I²C slave address
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index daf465be..6b6e683 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -88,6 +88,7 @@ dlg	Dialog Semiconductor
 dlink	D-Link Corporation
 dmo	Data Modul AG
 domintech	Domintech Co., Ltd.
+dongwoon	Dongwoon Anatech
 dptechnics	DPTechnics
 dragino	Dragino Technology Co., Limited
 ea	Embedded Artists AB
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
