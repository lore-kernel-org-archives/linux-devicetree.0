From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 06/10 v3] usb: usb251xb: Add battery enable setting flag
Date: Sun, 22 Oct 2017 23:38:08 +0300
Message-ID: <20171022203812.9379-7-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Battery charging settings are supported by USB251xb hubs only.
USB2517i isn't one of them. So we need to reflect it within the
device-specific data structure. The driver doesn't support dts
property changing this setting, but instead defaults it with zero.
So the flag isn't used anywhere in the driver, but still can be helpful
in future, when necessity of the corresponding dts setting arises.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/usb251xb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 0f309943f..e6ccea57a 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -164,54 +164,63 @@ struct usb251xb {
 struct usb251xb_data {
 	u16 product_id;
 	u8 port_cnt;
+	bool bat_support;
 	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
 };
 
 static const struct usb251xb_data usb2512b_data = {
 	.product_id = 0x2512,
 	.port_cnt = 2,
+	.bat_support = true,
 	.product_str = "USB2512B",
 };
 
 static const struct usb251xb_data usb2512bi_data = {
 	.product_id = 0x2512,
 	.port_cnt = 2,
+	.bat_support = true,
 	.product_str = "USB2512Bi",
 };
 
 static const struct usb251xb_data usb2513b_data = {
 	.product_id = 0x2513,
 	.port_cnt = 3,
+	.bat_support = true,
 	.product_str = "USB2513B",
 };
 
 static const struct usb251xb_data usb2513bi_data = {
 	.product_id = 0x2513,
 	.port_cnt = 3,
+	.bat_support = true,
 	.product_str = "USB2513Bi",
 };
 
 static const struct usb251xb_data usb2514b_data = {
 	.product_id = 0x2514,
 	.port_cnt = 4,
+	.bat_support = true,
 	.product_str = "USB2514B",
 };
 
 static const struct usb251xb_data usb2514bi_data = {
 	.product_id = 0x2514,
 	.port_cnt = 4,
+	.bat_support = true,
 	.product_str = "USB2514Bi",
 };
 
 static const struct usb251xb_data usb2517_data = {
 	.product_id = 0x2517,
 	.port_cnt = 7,
+	.bat_support = false,
 	.product_str = "USB2517",
 };
 
 static const struct usb251xb_data usb2517i_data = {
 	.product_id = 0x2517,
 	.port_cnt = 7,
+	.bat_support = false,
 	.product_str = "USB2517i",
 };
 
-- 
2.12.0
