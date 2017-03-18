From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v5 2/4] fpga pr ip: Core driver support for Altera
 Partial Reconfiguration IP.
Date: Sat, 18 Mar 2017 19:53:56 +0100
Message-ID: <20170318195356.19269415@crub>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>
        <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: atull@kernel.org, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi Matthew,

thanks for the patches. Please see some comments below.

On Fri, 10 Mar 2017 11:40:25 -0800
matthew.gerlach@linux.intel.com matthew.gerlach@linux.intel.com wrote:

...
>+	if (!(info->flags & FPGA_MGR_PARTIAL_RECONFIG)) {
>+		pr_err("%s Partial Reconfiguration flag not set\n", __func__);

please use dev_err() here.

...
>+	if (val & ALT_PR_CSR_PR_START) {
>+		pr_err("%s Partial Reconfiguration already started\n",

dev_err(), too.

...
>+static int alt_pr_fpga_write_complete(struct fpga_manager *mgr,
>+				      struct fpga_image_info *info)
>+{
>+	u32 i;
>+
>+	for (i = 0; i < info->config_complete_timeout_us; i++) {
>+		switch (alt_pr_fpga_state(mgr)) {
>+		case FPGA_MGR_STATE_WRITE_ERR:
>+			return -EIO;
>+
>+		case FPGA_MGR_STATE_OPERATING:
>+			dev_info(&mgr->dev,
>+				 "successful partial reconfiguration\n");
>+			return 0;
>+
>+		default:
>+			break;
>+		}
>+		udelay(1);
>+	}
>+	dev_err(&mgr->dev, "timed out waiting for write to complete\n");
>+	return -ETIMEDOUT;
>+}

we will always get timed out error if info->config_complete_timeout_us
is zero. Can we change to
	u32 i = 0;
	...
	do {
		...
	} while (info->config_complete_timeout_us > i++);
?

...
>diff --git a/drivers/fpga/altera-pr-ip-core.h b/drivers/fpga/altera-pr-ip-core.h
>new file mode 100644
>index 0000000..3810a90
>--- /dev/null
>+++ b/drivers/fpga/altera-pr-ip-core.h

Should we move this header to include/linux/? We can use register/
unregister functions in other drivers (PCIe) outside drivers/fpga
then.

Thanks,

Anatolij
