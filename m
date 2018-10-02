Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: gadget: udc: renesas_usb3: add support for r8a77990
Date: Tue,  2 Oct 2018 20:58:27 +0900
Message-Id: <1538481507-24821-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Since r8a77990 (R-Car E3) doesn't have VBUS detect pin and
number of ramif is 4, this patch adds a new renesas_usb3_priv
variable for the SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index e1656f3..100e9fa 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2600,6 +2600,13 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 	.ramsize_per_pipe = SZ_4K,
 };
 
+static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
+	.ramsize_per_ramif = SZ_16K,
+	.num_ramif = 4,
+	.ramsize_per_pipe = SZ_4K,
+	.workaround_for_vbus = true,
+};
+
 static const struct of_device_id usb3_of_match[] = {
 	{
 		.compatible = "renesas,r8a7795-usb3-peri",
@@ -2618,6 +2625,10 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 		.soc_id = "r8a7795", .revision = "ES1.*",
 		.data = &renesas_usb3_priv_r8a7795_es1,
 	},
+	{
+		.soc_id = "r8a77990",
+		.data = &renesas_usb3_priv_r8a77990,
+	},
 	{ /* sentinel */ },
 };
 
-- 
1.9.1
