From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v11 4/6] usb:common Simplify usb_decode_get_set_descriptor function.
Date: Mon, 26 Aug 2019 12:19:29 +0100
Message-ID: <1566818371-27721-5-git-send-email-pawell@cadence.com>
References: <1566818371-27721-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566818371-27721-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: felipe.balbi@linux.intel.com
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com, sparmar@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch moves switch responsible for decoding descriptor type
outside snprintf. It improves code readability a little.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/common/debug.c | 113 +++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index 60a9f70a0904..92a986aeaa5d 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -105,62 +105,65 @@ static void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 bRequest,
 					  __u16 wValue, __u16 wIndex,
 					  __u16 wLength, char *str, size_t size)
 {
+	char *s;
+
+	switch (wValue >> 8) {
+	case USB_DT_DEVICE:
+		s = "Device";
+		break;
+	case USB_DT_CONFIG:
+		s = "Configuration";
+		break;
+	case USB_DT_STRING:
+		s = "String";
+		break;
+	case USB_DT_INTERFACE:
+		s = "Interface";
+		break;
+	case USB_DT_ENDPOINT:
+		s = "Endpoint";
+		break;
+	case USB_DT_DEVICE_QUALIFIER:
+		s = "Device Qualifier";
+		break;
+	case USB_DT_OTHER_SPEED_CONFIG:
+		s = "Other Speed Config";
+		break;
+	case USB_DT_INTERFACE_POWER:
+		s = "Interface Power";
+		break;
+	case USB_DT_OTG:
+		s = "OTG";
+		break;
+	case USB_DT_DEBUG:
+		s = "Debug";
+		break;
+	case USB_DT_INTERFACE_ASSOCIATION:
+		s = "Interface Association";
+		break;
+	case USB_DT_BOS:
+		s = "BOS";
+		break;
+	case USB_DT_DEVICE_CAPABILITY:
+		s = "Device Capability";
+		break;
+	case USB_DT_PIPE_USAGE:
+		s = "Pipe Usage";
+		break;
+	case USB_DT_SS_ENDPOINT_COMP:
+		s = "SS Endpoint Companion";
+		break;
+	case USB_DT_SSP_ISOC_ENDPOINT_COMP:
+		s = "SSP Isochronous Endpoint Companion";
+		break;
+	default:
+		s = "UNKNOWN";
+		break;
+	}
+
 	snprintf(str, size, "%s %s Descriptor(Index = %d, Length = %d)",
-		 bRequest == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
-		 ({ char *s;
-			switch (wValue >> 8) {
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
-			} s; }), wValue & 0xff, wLength);
+		bRequest == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
+		s, wValue & 0xff, wLength);
 }
 
 static void usb_decode_get_configuration(__u16 wLength, char *str, size_t size)
-- 
2.17.1
