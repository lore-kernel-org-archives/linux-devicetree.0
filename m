From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v8 2/6] usb:gadget Separated decoding functions from dwc3 driver.
Date: Tue, 2 Jul 2019 14:37:58 +0100
Message-ID: <1562074682-31579-3-git-send-email-pawell@cadence.com>
References: <1562074682-31579-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562074682-31579-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com, aniljoy@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
to driver/usb/gadget/debug.c file. These moved functions include:
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
include/linux/usb/gadget.h file.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/dwc3/debug.h    | 252 ---------------------------------
 drivers/usb/dwc3/trace.h    |   2 +-
 drivers/usb/gadget/Makefile |   1 +
 drivers/usb/gadget/debug.c  | 268 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/gadget.h  |  26 ++++
 5 files changed, 296 insertions(+), 253 deletions(-)
 create mode 100644 drivers/usb/gadget/debug.c

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 068259fdfb0c..9baabed87d61 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -246,258 +246,6 @@ static inline const char *dwc3_gadget_event_string(char *str, size_t size,
 	return str;
 }
 
-static inline void dwc3_decode_get_status(__u8 t, __u16 i, __u16 l, char *str,
-		size_t size)
-{
-	switch (t & USB_RECIP_MASK) {
-	case USB_RECIP_DEVICE:
-		snprintf(str, size, "Get Device Status(Length = %d)", l);
-		break;
-	case USB_RECIP_INTERFACE:
-		snprintf(str, size, "Get Interface Status(Intf = %d, Length = %d)",
-				i, l);
-		break;
-	case USB_RECIP_ENDPOINT:
-		snprintf(str, size, "Get Endpoint Status(ep%d%s)",
-			i & ~USB_DIR_IN,
-			i & USB_DIR_IN ? "in" : "out");
-		break;
-	}
-}
-
-static inline void dwc3_decode_set_clear_feature(__u8 t, __u8 b, __u16 v,
-		__u16 i, char *str, size_t size)
-{
-	switch (t & USB_RECIP_MASK) {
-	case USB_RECIP_DEVICE:
-		snprintf(str, size, "%s Device Feature(%s%s)",
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
-		snprintf(str, size, "%s Interface Feature(%s)",
-			b == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			v == USB_INTRF_FUNC_SUSPEND ?
-			"Function Suspend" : "UNKNOWN");
-		break;
-	case USB_RECIP_ENDPOINT:
-		snprintf(str, size, "%s Endpoint Feature(%s ep%d%s)",
-			b == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			v == USB_ENDPOINT_HALT ? "Halt" : "UNKNOWN",
-			i & ~USB_DIR_IN,
-			i & USB_DIR_IN ? "in" : "out");
-		break;
-	}
-}
-
-static inline void dwc3_decode_set_address(__u16 v, char *str, size_t size)
-{
-	snprintf(str, size, "Set Address(Addr = %02x)", v);
-}
-
-static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v,
-		__u16 i, __u16 l, char *str, size_t size)
-{
-	snprintf(str, size, "%s %s Descriptor(Index = %d, Length = %d)",
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
-static inline void dwc3_decode_get_configuration(__u16 l, char *str,
-		size_t size)
-{
-	snprintf(str, size, "Get Configuration(Length = %d)", l);
-}
-
-static inline void dwc3_decode_set_configuration(__u8 v, char *str, size_t size)
-{
-	snprintf(str, size, "Set Configuration(Config = %d)", v);
-}
-
-static inline void dwc3_decode_get_intf(__u16 i, __u16 l, char *str,
-		size_t size)
-{
-	snprintf(str, size, "Get Interface(Intf = %d, Length = %d)", i, l);
-}
-
-static inline void dwc3_decode_set_intf(__u8 v, __u16 i, char *str, size_t size)
-{
-	snprintf(str, size, "Set Interface(Intf = %d, Alt.Setting = %d)", i, v);
-}
-
-static inline void dwc3_decode_synch_frame(__u16 i, __u16 l, char *str,
-		size_t size)
-{
-	snprintf(str, size, "Synch Frame(Endpoint = %d, Length = %d)", i, l);
-}
-
-static inline void dwc3_decode_set_sel(__u16 l, char *str, size_t size)
-{
-	snprintf(str, size, "Set SEL(Length = %d)", l);
-}
-
-static inline void dwc3_decode_set_isoch_delay(__u8 v, char *str, size_t size)
-{
-	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", v);
-}
-
-/**
- * dwc3_decode_ctrl - returns a string represetion of ctrl request
- */
-static inline const char *dwc3_decode_ctrl(char *str, size_t size,
-		__u8 bRequestType, __u8 bRequest, __u16 wValue, __u16 wIndex,
-		__u16 wLength)
-{
-	switch (bRequest) {
-	case USB_REQ_GET_STATUS:
-		dwc3_decode_get_status(bRequestType, wIndex, wLength, str,
-				size);
-		break;
-	case USB_REQ_CLEAR_FEATURE:
-	case USB_REQ_SET_FEATURE:
-		dwc3_decode_set_clear_feature(bRequestType, bRequest, wValue,
-				wIndex, str, size);
-		break;
-	case USB_REQ_SET_ADDRESS:
-		dwc3_decode_set_address(wValue, str, size);
-		break;
-	case USB_REQ_GET_DESCRIPTOR:
-	case USB_REQ_SET_DESCRIPTOR:
-		dwc3_decode_get_set_descriptor(bRequestType, bRequest, wValue,
-				wIndex, wLength, str, size);
-		break;
-	case USB_REQ_GET_CONFIGURATION:
-		dwc3_decode_get_configuration(wLength, str, size);
-		break;
-	case USB_REQ_SET_CONFIGURATION:
-		dwc3_decode_set_configuration(wValue, str, size);
-		break;
-	case USB_REQ_GET_INTERFACE:
-		dwc3_decode_get_intf(wIndex, wLength, str, size);
-		break;
-	case USB_REQ_SET_INTERFACE:
-		dwc3_decode_set_intf(wValue, wIndex, str, size);
-		break;
-	case USB_REQ_SYNCH_FRAME:
-		dwc3_decode_synch_frame(wIndex, wLength, str, size);
-		break;
-	case USB_REQ_SET_SEL:
-		dwc3_decode_set_sel(wLength, str, size);
-		break;
-	case USB_REQ_SET_ISOCH_DELAY:
-		dwc3_decode_set_isoch_delay(wValue, str, size);
-		break;
-	default:
-		snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
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
index 818a63da1a44..9edff17111f7 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -86,7 +86,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", dwc3_decode_ctrl(__get_str(str), DWC3_MSG_MAX,
+	TP_printk("%s", usb_decode_ctrl(__get_str(str), DWC3_MSG_MAX,
 					__entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 130dad7130b6..500a5a592abe 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -9,5 +9,6 @@ ccflags-y				+= -I$(srctree)/drivers/usb/gadget/udc
 obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
 libcomposite-y			:= usbstring.o config.o epautoconf.o
 libcomposite-y			+= composite.o functions.o configfs.o u_f.o
+libcomposite-y			+= debug.o
 
 obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
diff --git a/drivers/usb/gadget/debug.c b/drivers/usb/gadget/debug.c
new file mode 100644
index 000000000000..d5a469bc67a3
--- /dev/null
+++ b/drivers/usb/gadget/debug.c
@@ -0,0 +1,268 @@
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
+#include <linux/usb/ch9.h>
+
+static void usb_decode_get_status(__u8 bRequestType, __u16 wIndex,
+				  __u16 wLength, char *str, size_t size)
+{
+	switch (bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		snprintf(str, size, "Get Device Status(Length = %d)", wLength);
+		break;
+	case USB_RECIP_INTERFACE:
+		snprintf(str, size,
+			 "Get Interface Status(Intf = %d, Length = %d)",
+			 wIndex, wLength);
+		break;
+	case USB_RECIP_ENDPOINT:
+		snprintf(str, size, "Get Endpoint Status(ep%d%s)",
+			 wIndex & ~USB_DIR_IN,
+			 wIndex & USB_DIR_IN ? "in" : "out");
+		break;
+	}
+}
+
+static void usb_decode_set_clear_feature(__u8 bRequestType, __u8 bRequest,
+					 __u16 wValue, __u16 wIndex,
+					 char *str, size_t size)
+{
+	switch (bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		snprintf(str, size, "%s Device Feature(%s%s)",
+			 bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			 ({char *s;
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
+			 wValue == USB_DEVICE_TEST_MODE ?
+			 ({ char *s;
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
+		snprintf(str, size, "%s Interface Feature(%s)",
+			 bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			 wValue == USB_INTRF_FUNC_SUSPEND ?
+			 "Function Suspend" : "UNKNOWN");
+		break;
+	case USB_RECIP_ENDPOINT:
+		snprintf(str, size, "%s Endpoint Feature(%s ep%d%s)",
+			 bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
+			 wValue == USB_ENDPOINT_HALT ? "Halt" : "UNKNOWN",
+			 wIndex & ~USB_DIR_IN,
+			 wIndex & USB_DIR_IN ? "in" : "out");
+		break;
+	}
+}
+
+static void usb_decode_set_address(__u16 wValue, char *str, size_t size)
+{
+	snprintf(str, size, "Set Address(Addr = %02x)", wValue);
+}
+
+static void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 bRequest,
+					  __u16 wValue, __u16 wIndex,
+					  __u16 wLength, char *str, size_t size)
+{
+	snprintf(str, size, "%s %s Descriptor(Index = %d, Length = %d)",
+		 bRequest == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
+		 ({ char *s;
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
+static void usb_decode_get_configuration(__u16 wLength, char *str, size_t size)
+{
+	snprintf(str, size, "Get Configuration(Length = %d)", wLength);
+}
+
+static void usb_decode_set_configuration(__u8 wValue, char *str, size_t size)
+{
+	snprintf(str, size, "Set Configuration(Config = %d)", wValue);
+}
+
+static void usb_decode_get_intf(__u16 wIndex, __u16 wLength, char *str,
+				size_t size)
+{
+	snprintf(str, size, "Get Interface(Intf = %d, Length = %d)",
+		 wIndex, wLength);
+}
+
+static void usb_decode_set_intf(__u8 wValue, __u16 wIndex, char *str,
+				size_t size)
+{
+	snprintf(str, size, "Set Interface(Intf = %d, Alt.Setting = %d)",
+		 wIndex, wValue);
+}
+
+static void usb_decode_synch_frame(__u16 wIndex, __u16 wLength,
+				   char *str, size_t size)
+{
+	snprintf(str, size, "Synch Frame(Endpoint = %d, Length = %d)",
+		 wIndex, wLength);
+}
+
+static void usb_decode_set_sel(__u16 wLength, char *str, size_t size)
+{
+	snprintf(str, size, "Set SEL(Length = %d)", wLength);
+}
+
+static void usb_decode_set_isoch_delay(__u8 wValue, char *str, size_t size)
+{
+	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", wValue);
+}
+
+/**
+ * usb_decode_ctrl - returns a string representation of ctrl request
+ */
+const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
+			    __u8 bRequest, __u16 wValue, __u16 wIndex,
+			    __u16 wLength)
+{
+	switch (bRequest) {
+	case USB_REQ_GET_STATUS:
+		usb_decode_get_status(bRequestType, wIndex, wLength, str, size);
+		break;
+	case USB_REQ_CLEAR_FEATURE:
+	case USB_REQ_SET_FEATURE:
+		usb_decode_set_clear_feature(bRequestType, bRequest, wValue,
+					     wIndex, str, size);
+		break;
+	case USB_REQ_SET_ADDRESS:
+		usb_decode_set_address(wValue, str, size);
+		break;
+	case USB_REQ_GET_DESCRIPTOR:
+	case USB_REQ_SET_DESCRIPTOR:
+		usb_decode_get_set_descriptor(bRequestType, bRequest, wValue,
+					      wIndex, wLength, str, size);
+		break;
+	case USB_REQ_GET_CONFIGURATION:
+		usb_decode_get_configuration(wLength, str, size);
+		break;
+	case USB_REQ_SET_CONFIGURATION:
+		usb_decode_set_configuration(wValue, str, size);
+		break;
+	case USB_REQ_GET_INTERFACE:
+		usb_decode_get_intf(wIndex, wLength, str, size);
+		break;
+	case USB_REQ_SET_INTERFACE:
+		usb_decode_set_intf(wValue, wIndex, str, size);
+		break;
+	case USB_REQ_SYNCH_FRAME:
+		usb_decode_synch_frame(wIndex, wLength, str, size);
+		break;
+	case USB_REQ_SET_SEL:
+		usb_decode_set_sel(wLength, str, size);
+		break;
+	case USB_REQ_SET_ISOCH_DELAY:
+		usb_decode_set_isoch_delay(wValue, str, size);
+		break;
+	default:
+		snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
+			 bRequestType, bRequest,
+			 (u8)(cpu_to_le16(wValue) & 0xff),
+			 (u8)(cpu_to_le16(wValue) >> 8),
+			 (u8)(cpu_to_le16(wIndex) & 0xff),
+			 (u8)(cpu_to_le16(wIndex) >> 8),
+			 (u8)(cpu_to_le16(wLength) & 0xff),
+			 (u8)(cpu_to_le16(wLength) >> 8));
+	}
+
+	return str;
+}
+EXPORT_SYMBOL_GPL(usb_decode_ctrl);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index fb19141151d8..42902fcc8696 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -889,4 +889,30 @@ extern void usb_ep_autoconfig_release(struct usb_ep *);
 
 extern void usb_ep_autoconfig_reset(struct usb_gadget *);
 
+/*-------------------------------------------------------------------------*/
+/**
+ * usb_decode_ctrl - Returns human readable representation of control request.
+ * @str: buffer to return a human-readable representation of control request.
+ *       This buffer should have about 200 bytes.
+ * @size: size of str buffer.
+ * @bRequestType: matches the USB bmRequestType field
+ * @bRequest: matches the USB bRequest field
+ * @wValue: matches the USB wValue field (CPU byte order)
+ * @wIndex: matches the USB wIndex field (CPU byte order)
+ * @wLength: matches the USB wLength field (CPU byte order)
+ *
+ * Function returns decoded, formatted and human-readable description of
+ * control request packet.
+ *
+ * The usage scenario for this is for tracepoints, so function as a return
+ * use the same value as in parameters. This approach allows to use this
+ * function in TP_printk
+ *
+ * Important: wValue, wIndex, wLength parameters before invoking this function
+ * should be processed by le16_to_cpu macro.
+ */
+extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
+			__u8 bRequest, __u16 wValue, __u16 wIndex,
+			__u16 wLength);
+
 #endif /* __LINUX_USB_GADGET_H */
-- 
2.17.1
