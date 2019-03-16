From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v4 05/12] usb: dwc3: Execute GCTL Core Soft Reset while switch mdoe for Hisilicon Kirin Soc
Date: Sat, 16 Mar 2019 11:53:35 +0800
Message-ID: <20190316035342.77998-6-chenyu56@huawei.com>
References: <20190316035342.77998-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190316035342.77998-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

A GCTL soft reset should be executed when switch mode for dwc3 core
of Hisilicon Kirin Soc.

Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
v4:
* Add description for 'gctl_reset_quirk'.
---
---
 drivers/usb/dwc3/core.c | 19 +++++++++++++++++++
 drivers/usb/dwc3/core.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c3ef6bd2b0d4..fd581d72794a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -112,6 +112,19 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 	dwc->current_dr_role = mode;
 }
 
+static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
+{
+	u32 reg;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg |= DWC3_GCTL_CORESOFTRESET;
+	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg &= ~DWC3_GCTL_CORESOFTRESET;
+	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+}
+
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
@@ -157,6 +170,10 @@ static void __dwc3_set_mode(struct work_struct *work)
 
 	dwc3_set_prtcap(dwc, dwc->desired_dr_role);
 
+	/* Execute a GCTL Core Soft Reset when switch mode */
+	if (dwc->gctl_reset_quirk)
+		dwc3_gctl_core_soft_reset(dwc);
+
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	switch (dwc->desired_dr_role) {
@@ -1314,6 +1331,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
+	dwc->gctl_reset_quirk = device_property_read_bool(dev,
+				"snps,gctl-reset-quirk");
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 28475e301ad9..6a050d663ec7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1035,6 +1035,7 @@ struct dwc3_scratchpad_array {
  * 	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @gctl_reset_quirk: set to do a gctl soft-reset while switch operation mode.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1222,6 +1223,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		gctl_reset_quirk:1;
 
 	u16			imod_interval;
 };
-- 
2.15.0-rc2
