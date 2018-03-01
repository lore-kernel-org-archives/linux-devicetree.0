From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH RESEND 2/2] usb: dwc2: fix STM32F7 USB OTG HS compatible
Date: Thu, 1 Mar 2018 11:05:35 +0100
Message-ID: <1519898735-10319-3-git-send-email-amelie.delaunay@st.com>
References: <1519898735-10319-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519898735-10319-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch fixes compatible for STM32F7 USB OTG HS and consistently rename
dw2_set_params function.
The v2 former patch [1] had been acked by Paul Young, but v1 was merged.

[1] https://patchwork.kernel.org/patch/9925573/

Fixes: d8fae8b93682 ("usb: dwc2: add support for STM32F7xx USB OTG HS")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 03fd20f..c4a4749 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -137,7 +137,7 @@ static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->activate_stm_fs_transceiver = true;
 }
 
-static void dwc2_set_stm32f7xx_hsotg_params(struct dwc2_hsotg *hsotg)
+static void dwc2_set_stm32f7_hsotg_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
@@ -164,8 +164,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
 	{ .compatible = "st,stm32f4x9-hsotg" },
-	{ .compatible = "st,stm32f7xx-hsotg",
-	  .data = dwc2_set_stm32f7xx_hsotg_params },
+	{ .compatible = "st,stm32f7-hsotg",
+	  .data = dwc2_set_stm32f7_hsotg_params },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.7.4
