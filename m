From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3 driver.
Date: Thu, 31 Jan 2019 11:52:29 +0000
Message-ID: <1548935553-452-3-git-send-email-pawell@cadence.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548935553-452-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
to driver/usb/common/debug.c file. These moved functions include:
    dwc3_decode_get_status
    dwc3_decode_set_clear_feature
    dwc3_decode_set_address
    dwc3_decode_get_set_descriptor
    dwc3_decode_get_configuration
    dwc3_decode_set_configuration
    dwc3_decode_get_intf
    dwc3_decode_set_intf
    dwc3_decode_synch_frame
    dwc3_decode_set_sel
    dwc3_decode_set_isoch_delay
    dwc3_decode_ctrl

These functions are used also in inroduced cdns3 driver.

All functions prefixes were changed from dwc3 to usb.
Also, function's parameters has been extended according to the name
of fields in standard SETUP packet.
Additionally, patch adds usb_decode_ctrl function to
include/linux/usb/ch9.h file.

mend

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/common/Makefile |   2 +-
 drivers/usb/common/debug.c  | 265 ++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/debug.h    | 243 ---------------------------------
 drivers/usb/dwc3/trace.h    |   2 +-
 include/linux/usb/ch9.h     |  19 +++
 5 files changed, 286 insertions(+), 245 deletions(-)
 create mode 100644 drivers/usb/common/debug.c

diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
index fb4d5ef4165c..3d3d2962ea4b 100644
--- a/drivers/usb/common/Makefile
+++ b/drivers/usb/common/Makefile
@@ -4,7 +4,7 @@
 #
 
 obj-$(CONFIG_USB_COMMON)	  += usb-common.o
-usb-common-y			  += common.o
+usb-common-y			  += common.o debug.o
 usb-common-$(CONFIG_USB_LED_TRIG) += led.o
 
 obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
new file mode 100644
index 000000000000..824b3d793745
--- /dev/null
+++ b/drivers/usb/common/debug.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Common USB debugging functions
+ *
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors: Felipe Balbi <balbi@ti.com>,
+ *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+ */
+
+#ifndef __LINUX_USB_COMMON_DEBUG
+#define __LINUX_USB_COMMON_DEBUG
+
+#include <linux/usb/ch9.h>
+
+static void usb_decode_get_status(__u8 bRequestType, __u16 wIndex,
+				  __u16 wLength, char *str)
+{
+	switch (bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_INTERFACE:
+		sprintf(str, "Get Interface Status(Intf = %d, Length = %d)",
+			wIndex, wLength);
+		break;
+	case USB_RECIP_ENDPOINT:
+		sprintf(str, "Get Endpoint Status(ep%d%s)",
+			wIndex & ~USB_DIR_IN,
+			wIndex & USB_DIR_IN ? "in" : "out");
+		break;
+	}
+}
+
+static void usb_decode_set_clear_feature(__u8 bRequestType,
+					 __u8 bRequest, __u16 wValue,
+					 __u16 wIndex, char *str)
+{
+	switch (bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		sprintf(str, "%s Device Feature(%s%s)",
+			bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			({char *s;
+				switch (wValue) {
+				case USB_DEVICE_SELF_POWERED:
+					s = "Self Powered";
+					break;
+				case USB_DEVICE_REMOTE_WAKEUP:
+					s = "Remote Wakeup";
+					break;
+				case USB_DEVICE_TEST_MODE:
+					s = "Test Mode";
+					break;
+				case USB_DEVICE_U1_ENABLE:
+					s = "U1 Enable";
+					break;
+				case USB_DEVICE_U2_ENABLE:
+					s = "U2 Enable";
+					break;
+				case USB_DEVICE_LTM_ENABLE:
+					s = "LTM Enable";
+					break;
+				default:
+					s = "UNKNOWN";
+				} s; }),
+			wValue == USB_DEVICE_TEST_MODE ?
+			({ char *s;
+				switch (wIndex) {
+				case TEST_J:
+					s = ": TEST_J";
+					break;
+				case TEST_K:
+					s = ": TEST_K";
+					break;
+				case TEST_SE0_NAK:
+					s = ": TEST_SE0_NAK";
+					break;
+				case TEST_PACKET:
+					s = ": TEST_PACKET";
+					break;
+				case TEST_FORCE_EN:
+					s = ": TEST_FORCE_EN";
+					break;
+				default:
+					s = ": UNKNOWN";
+				} s; }) : "");
+		break;
+	case USB_RECIP_INTERFACE:
+		sprintf(str, "%s Interface Feature(%s)",
+			bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			wValue == USB_INTRF_FUNC_SUSPEND ?
+			"Function Suspend" : "UNKNOWN");
+		break;
+	case USB_RECIP_ENDPOINT:
+		sprintf(str, "%s Endpoint Feature(%s ep%d%s)",
+			bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			wValue == USB_ENDPOINT_HALT ? "Halt" : "UNKNOWN",
+			wIndex & ~USB_DIR_IN,
+			wIndex & USB_DIR_IN ? "in" : "out");
+		break;
+	}
+}
+
+static void usb_decode_set_address(__u16 wValue, char *str)
+{
+	sprintf(str, "Set Address(Addr = %02x)", wValue);
+}
+
+static void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 bRequest,
+					  __u16 wValue, __u16 wIndex,
+					  __u16 wLength, char *str)
+{
+	sprintf(str, "%s %s Descriptor(Index = %d, Length = %d)",
+		bRequest == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
+		({ char *s;
+			switch (wValue >> 8) {
+			case USB_DT_DEVICE:
+				s = "Device";
+				break;
+			case USB_DT_CONFIG:
+				s = "Configuration";
+				break;
+			case USB_DT_STRING:
+				s = "String";
+				break;
+			case USB_DT_INTERFACE:
+				s = "Interface";
+				break;
+			case USB_DT_ENDPOINT:
+				s = "Endpoint";
+				break;
+			case USB_DT_DEVICE_QUALIFIER:
+				s = "Device Qualifier";
+				break;
+			case USB_DT_OTHER_SPEED_CONFIG:
+				s = "Other Speed Config";
+				break;
+			case USB_DT_INTERFACE_POWER:
+				s = "Interface Power";
+				break;
+			case USB_DT_OTG:
+				s = "OTG";
+				break;
+			case USB_DT_DEBUG:
+				s = "Debug";
+				break;
+			case USB_DT_INTERFACE_ASSOCIATION:
+				s = "Interface Association";
+				break;
+			case USB_DT_BOS:
+				s = "BOS";
+				break;
+			case USB_DT_DEVICE_CAPABILITY:
+				s = "Device Capability";
+				break;
+			case USB_DT_PIPE_USAGE:
+				s = "Pipe Usage";
+				break;
+			case USB_DT_SS_ENDPOINT_COMP:
+				s = "SS Endpoint Companion";
+				break;
+			case USB_DT_SSP_ISOC_ENDPOINT_COMP:
+				s = "SSP Isochronous Endpoint Companion";
+				break;
+			default:
+				s = "UNKNOWN";
+				break;
+			} s; }), wValue & 0xff, wLength);
+}
+
+static void usb_decode_get_configuration(__u16 wLength, char *str)
+{
+	sprintf(str, "Get Configuration(Length = %d)", wLength);
+}
+
+static inline void usb_decode_set_configuration(__u8 wValue, char *str)
+{
+	sprintf(str, "Set Configuration(Config = %d)", wValue);
+}
+
+static void usb_decode_get_intf(__u16 wIndex, __u16 wLength, char *str)
+{
+	sprintf(str, "Get Interface(Intf = %d, Length = %d)", wIndex, wLength);
+}
+
+static void usb_decode_set_intf(__u8 wValue, __u16 wIndex, char *str)
+{
+	sprintf(str, "Set Interface(Intf = %d, Alt.Setting = %d)",
+		wIndex, wValue);
+}
+
+static void usb_decode_synch_frame(__u16 wIndex, __u16 wLength,
+				   char *str)
+{
+	sprintf(str, "Synch Frame(Endpoint = %d, Length = %d)",
+		wIndex, wLength);
+}
+
+static void usb_decode_set_sel(__u16 wLength, char *str)
+{
+	sprintf(str, "Set SEL(Length = %d)", wLength);
+}
+
+static void usb_decode_set_isoch_delay(__u8 wValue, char *str)
+{
+	sprintf(str, "Set Isochronous Delay(Delay = %d ns)", wValue);
+}
+
+/**
+ * usb_decode_ctrl - returns a string representation of ctrl request
+ */
+const char *usb_decode_ctrl(char *str, __u8 bRequestType, __u8 bRequest,
+			    __u16 wValue,  __u16 wIndex, __u16 wLength)
+{
+	switch (bRequest) {
+	case USB_REQ_GET_STATUS:
+		usb_decode_get_status(bRequestType, wIndex, wLength, str);
+		break;
+	case USB_REQ_CLEAR_FEATURE:
+	case USB_REQ_SET_FEATURE:
+		usb_decode_set_clear_feature(bRequestType, bRequest, wValue,
+					     wIndex, str);
+		break;
+	case USB_REQ_SET_ADDRESS:
+		usb_decode_set_address(wValue, str);
+		break;
+	case USB_REQ_GET_DESCRIPTOR:
+	case USB_REQ_SET_DESCRIPTOR:
+		usb_decode_get_set_descriptor(bRequestType, bRequest, wValue,
+					      wIndex, wLength, str);
+		break;
+	case USB_REQ_GET_CONFIGURATION:
+		usb_decode_get_configuration(wLength, str);
+		break;
+	case USB_REQ_SET_CONFIGURATION:
+		usb_decode_set_configuration(wValue, str);
+		break;
+	case USB_REQ_GET_INTERFACE:
+		usb_decode_get_intf(wIndex, wLength, str);
+		break;
+	case USB_REQ_SET_INTERFACE:
+		usb_decode_set_intf(wValue, wIndex, str);
+		break;
+	case USB_REQ_SYNCH_FRAME:
+		usb_decode_synch_frame(wIndex, wLength, str);
+		break;
+	case USB_REQ_SET_SEL:
+		usb_decode_set_sel(wLength, str);
+		break;
+	case USB_REQ_SET_ISOCH_DELAY:
+		usb_decode_set_isoch_delay(wValue, str);
+		break;
+	default:
+		sprintf(str, "%02x %02x %02x %02x %02x %02x %02x %02x",
+			bRequestType, bRequest,
+			(u8)(cpu_to_le16(wValue) & 0xff),
+			(u8)(cpu_to_le16(wValue) >> 8),
+			(u8)(cpu_to_le16(wIndex) & 0xff),
+			(u8)(cpu_to_le16(wIndex) >> 8),
+			(u8)(cpu_to_le16(wLength) & 0xff),
+			(u8)(cpu_to_le16(wLength) >> 8));
+	}
+
+	return str;
+}
+EXPORT_SYMBOL_GPL(usb_decode_ctrl);
+
+#endif /* __LINUX_USB_COMMON_DEBUG */
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index c66d216dcc30..9db2b0fb8f22 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -214,249 +214,6 @@ dwc3_gadget_event_string(char *str, const struct dwc3_event_devt *event)
 	return str;
 }
 
-static inline void dwc3_decode_get_status(__u8 t, __u16 i, __u16 l, char *str)
-{
-	switch (t & USB_RECIP_MASK) {
-	case USB_RECIP_INTERFACE:
-		sprintf(str, "Get Interface Status(Intf = %d, Length = %d)",
-			i, l);
-		break;
-	case USB_RECIP_ENDPOINT:
-		sprintf(str, "Get Endpoint Status(ep%d%s)",
-			i & ~USB_DIR_IN,
-			i & USB_DIR_IN ? "in" : "out");
-		break;
-	}
-}
-
-static inline void dwc3_decode_set_clear_feature(__u8 t, __u8 b, __u16 v,
-						 __u16 i, char *str)
-{
-	switch (t & USB_RECIP_MASK) {
-	case USB_RECIP_DEVICE:
-		sprintf(str, "%s Device Feature(%s%s)",
-			b == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			({char *s;
-				switch (v) {
-				case USB_DEVICE_SELF_POWERED:
-					s = "Self Powered";
-					break;
-				case USB_DEVICE_REMOTE_WAKEUP:
-					s = "Remote Wakeup";
-					break;
-				case USB_DEVICE_TEST_MODE:
-					s = "Test Mode";
-					break;
-				case USB_DEVICE_U1_ENABLE:
-					s = "U1 Enable";
-					break;
-				case USB_DEVICE_U2_ENABLE:
-					s = "U2 Enable";
-					break;
-				case USB_DEVICE_LTM_ENABLE:
-					s = "LTM Enable";
-					break;
-				default:
-					s = "UNKNOWN";
-				} s; }),
-			v == USB_DEVICE_TEST_MODE ?
-			({ char *s;
-				switch (i) {
-				case TEST_J:
-					s = ": TEST_J";
-					break;
-				case TEST_K:
-					s = ": TEST_K";
-					break;
-				case TEST_SE0_NAK:
-					s = ": TEST_SE0_NAK";
-					break;
-				case TEST_PACKET:
-					s = ": TEST_PACKET";
-					break;
-				case TEST_FORCE_EN:
-					s = ": TEST_FORCE_EN";
-					break;
-				default:
-					s = ": UNKNOWN";
-				} s; }) : "");
-		break;
-	case USB_RECIP_INTERFACE:
-		sprintf(str, "%s Interface Feature(%s)",
-			b == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			v == USB_INTRF_FUNC_SUSPEND ?
-			"Function Suspend" : "UNKNOWN");
-		break;
-	case USB_RECIP_ENDPOINT:
-		sprintf(str, "%s Endpoint Feature(%s ep%d%s)",
-			b == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			v == USB_ENDPOINT_HALT ? "Halt" : "UNKNOWN",
-			i & ~USB_DIR_IN,
-			i & USB_DIR_IN ? "in" : "out");
-		break;
-	}
-}
-
-static inline void dwc3_decode_set_address(__u16 v, char *str)
-{
-	sprintf(str, "Set Address(Addr = %02x)", v);
-}
-
-static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v,
-						  __u16 i, __u16 l, char *str)
-{
-	sprintf(str, "%s %s Descriptor(Index = %d, Length = %d)",
-		b == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
-		({ char *s;
-			switch (v >> 8) {
-			case USB_DT_DEVICE:
-				s = "Device";
-				break;
-			case USB_DT_CONFIG:
-				s = "Configuration";
-				break;
-			case USB_DT_STRING:
-				s = "String";
-				break;
-			case USB_DT_INTERFACE:
-				s = "Interface";
-				break;
-			case USB_DT_ENDPOINT:
-				s = "Endpoint";
-				break;
-			case USB_DT_DEVICE_QUALIFIER:
-				s = "Device Qualifier";
-				break;
-			case USB_DT_OTHER_SPEED_CONFIG:
-				s = "Other Speed Config";
-				break;
-			case USB_DT_INTERFACE_POWER:
-				s = "Interface Power";
-				break;
-			case USB_DT_OTG:
-				s = "OTG";
-				break;
-			case USB_DT_DEBUG:
-				s = "Debug";
-				break;
-			case USB_DT_INTERFACE_ASSOCIATION:
-				s = "Interface Association";
-				break;
-			case USB_DT_BOS:
-				s = "BOS";
-				break;
-			case USB_DT_DEVICE_CAPABILITY:
-				s = "Device Capability";
-				break;
-			case USB_DT_PIPE_USAGE:
-				s = "Pipe Usage";
-				break;
-			case USB_DT_SS_ENDPOINT_COMP:
-				s = "SS Endpoint Companion";
-				break;
-			case USB_DT_SSP_ISOC_ENDPOINT_COMP:
-				s = "SSP Isochronous Endpoint Companion";
-				break;
-			default:
-				s = "UNKNOWN";
-				break;
-			} s; }), v & 0xff, l);
-}
-
-
-static inline void dwc3_decode_get_configuration(__u16 l, char *str)
-{
-	sprintf(str, "Get Configuration(Length = %d)", l);
-}
-
-static inline void dwc3_decode_set_configuration(__u8 v, char *str)
-{
-	sprintf(str, "Set Configuration(Config = %d)", v);
-}
-
-static inline void dwc3_decode_get_intf(__u16 i, __u16 l, char *str)
-{
-	sprintf(str, "Get Interface(Intf = %d, Length = %d)", i, l);
-}
-
-static inline void dwc3_decode_set_intf(__u8 v, __u16 i, char *str)
-{
-	sprintf(str, "Set Interface(Intf = %d, Alt.Setting = %d)", i, v);
-}
-
-static inline void dwc3_decode_synch_frame(__u16 i, __u16 l, char *str)
-{
-	sprintf(str, "Synch Frame(Endpoint = %d, Length = %d)", i, l);
-}
-
-static inline void dwc3_decode_set_sel(__u16 l, char *str)
-{
-	sprintf(str, "Set SEL(Length = %d)", l);
-}
-
-static inline void dwc3_decode_set_isoch_delay(__u8 v, char *str)
-{
-	sprintf(str, "Set Isochronous Delay(Delay = %d ns)", v);
-}
-
-/**
- * dwc3_decode_ctrl - returns a string represetion of ctrl request
- */
-static inline const char *dwc3_decode_ctrl(char *str, __u8 bRequestType,
-		__u8 bRequest, __u16 wValue, __u16 wIndex, __u16 wLength)
-{
-	switch (bRequest) {
-	case USB_REQ_GET_STATUS:
-		dwc3_decode_get_status(bRequestType, wIndex, wLength, str);
-		break;
-	case USB_REQ_CLEAR_FEATURE:
-	case USB_REQ_SET_FEATURE:
-		dwc3_decode_set_clear_feature(bRequestType, bRequest, wValue,
-					      wIndex, str);
-		break;
-	case USB_REQ_SET_ADDRESS:
-		dwc3_decode_set_address(wValue, str);
-		break;
-	case USB_REQ_GET_DESCRIPTOR:
-	case USB_REQ_SET_DESCRIPTOR:
-		dwc3_decode_get_set_descriptor(bRequestType, bRequest, wValue,
-					       wIndex, wLength, str);
-		break;
-	case USB_REQ_GET_CONFIGURATION:
-		dwc3_decode_get_configuration(wLength, str);
-		break;
-	case USB_REQ_SET_CONFIGURATION:
-		dwc3_decode_set_configuration(wValue, str);
-		break;
-	case USB_REQ_GET_INTERFACE:
-		dwc3_decode_get_intf(wIndex, wLength, str);
-		break;
-	case USB_REQ_SET_INTERFACE:
-		dwc3_decode_set_intf(wValue, wIndex, str);
-		break;
-	case USB_REQ_SYNCH_FRAME:
-		dwc3_decode_synch_frame(wIndex, wLength, str);
-		break;
-	case USB_REQ_SET_SEL:
-		dwc3_decode_set_sel(wLength, str);
-		break;
-	case USB_REQ_SET_ISOCH_DELAY:
-		dwc3_decode_set_isoch_delay(wValue, str);
-		break;
-	default:
-		sprintf(str, "%02x %02x %02x %02x %02x %02x %02x %02x",
-			bRequestType, bRequest,
-			cpu_to_le16(wValue) & 0xff,
-			cpu_to_le16(wValue) >> 8,
-			cpu_to_le16(wIndex) & 0xff,
-			cpu_to_le16(wIndex) >> 8,
-			cpu_to_le16(wLength) & 0xff,
-			cpu_to_le16(wLength) >> 8);
-	}
-
-	return str;
-}
-
 /**
  * dwc3_ep_event_string - returns event name
  * @event: then event code
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index f22714cce070..6236f0657583 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -86,7 +86,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", dwc3_decode_ctrl(__get_str(str), __entry->bRequestType,
+	TP_printk("%s", usb_decode_ctrl(__get_str(str), __entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
 	)
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 523aa088f6ab..a33cd2b9fbba 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -62,4 +62,23 @@ extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
  */
 extern const char *usb_state_string(enum usb_device_state state);
 
+/**
+ * usb_decode_ctrl - Returns human readable representation of control request.
+ * @str: buffer to return a human-readable representation of control request.
+ *       This buffer should have about 200 bytes.
+ * @bRequestType: matches the USB bmRequestType field
+ * @bRequest: matches the USB bRequest field
+ * @wValue: matches the USB wValue field (CPU byte order)
+ * @wIndex: matches the USB wIndex field (CPU byte order)
+ * @wLength: matches the USB wLength field (CPU byte order)
+ *
+ * Function returns decoded, formatted and human-readable description of
+ * control request packet.
+ *
+ * Important: wValue, wIndex, wLength parameters before invoking this function
+ * should be processed by le16_to_cpu macro.
+ */
+const char *usb_decode_ctrl(char *str, __u8 bRequestType, __u8 bRequest,
+			    __u16 wValue,  __u16 wIndex, __u16 wLength);
+
 #endif /* __LINUX_USB_CH9_H */
-- 
2.17.1
