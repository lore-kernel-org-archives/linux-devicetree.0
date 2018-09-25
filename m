From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH] soc: qcom: rmtfs_mem: Control remoteproc from
 rmtfs_mem
Date: Tue, 25 Sep 2018 10:29:50 -0700
Message-ID: <20180925172943.GA118699@ban.mtv.corp.google.com>
References: <20180925080607.30565-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925080607.30565-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Tue, Sep 25, 2018 at 01:06:07AM -0700, Bjorn Andersson wrote:
> rmtfs_mem provides access to physical storage and is crucial for the
> operation of the Qualcomm modem subsystem.
> 
> The rmtfs_mem implementation must be available before the modem
> subsystem is booted and a solution where the modem remoteproc will
> verify that the rmtfs_mem is available has been discussed in the past.
> But this would not handle the case where the rmtfs_mem provider is
> restarted, which would cause fatal loss of access to the storage device
> for the modem.
> 
> The suggestion is therefor to link the rmtfs_mem to its associated
> remote processor instance and control it based on the availability of
> the rmtfs_mem implementation.

But what does "availability" mean? If I'm reading your rmtfs daemon
properly, "availability" should mean that the daemon is up and has
registered a RMTFS_QMI_SERVICE. But in this patch, you're keying off of
the open() call, which sounds like you're introducing a race condition
-- we might have open()ed the RMTFS memory but we're not actually
completely ready to service requests.

So rather than looking for open(), I think somebody needs to be looking
for the appearance and disappearance of the RMTFS_QMI_SERVICE. (Looking
for disappearance would resolve the daemon restart issue, no?) That
"somebody" could be the remoteproc driver I suppose (qmi_add_lookup()?),
or...couldn't it just be the modem itself? Do you actually need to
restart the entire modem when the RMTFS service goes away, or do you
just need to pause storage activity?

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> The currently implemented workaround in the Linaro QCOMLT releases is to
> blacklist the qcom_q6v5_pil kernel module and load this explicitly after rmtfs
> has been started.
> 
> With this patch the modem module can be loaded automatically by the
> platform_bus and will only be booted as the rmtfs becomes available. Performing
> actions such as upgrading (and restarting) the rmtfs service will cause the
> modem to automatically restart and hence continue to function after the
> upgrade.
> 
>  .../reserved-memory/qcom,rmtfs-mem.txt        |  7 ++++++
>  drivers/remoteproc/qcom_q6v5_pil.c            |  1 +
>  drivers/soc/qcom/Kconfig                      |  1 +
>  drivers/soc/qcom/rmtfs_mem.c                  | 23 ++++++++++++++++++-
>  4 files changed, 31 insertions(+), 1 deletion(-)
> 
...
> diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
> index 8a3678c2e83c..8b08be310397 100644
> --- a/drivers/soc/qcom/rmtfs_mem.c
> +++ b/drivers/soc/qcom/rmtfs_mem.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/remoteproc.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> @@ -39,6 +40,8 @@ struct qcom_rmtfs_mem {
>  	unsigned int client_id;
>  
>  	unsigned int perms;
> +
> +	struct rproc *rproc;
>  };
>  
>  static ssize_t qcom_rmtfs_mem_show(struct device *dev,
> @@ -80,11 +83,18 @@ static int qcom_rmtfs_mem_open(struct inode *inode, struct file *filp)
>  	struct qcom_rmtfs_mem *rmtfs_mem = container_of(inode->i_cdev,
>  							struct qcom_rmtfs_mem,
>  							cdev);
> +	int ret = 0;
>  
>  	get_device(&rmtfs_mem->dev);
>  	filp->private_data = rmtfs_mem;
>  
> -	return 0;
> +	if (rmtfs_mem->rproc) {
> +		ret = rproc_boot(rmtfs_mem->rproc);
> +		if (ret)
> +			put_device(&rmtfs_mem->dev);
> +	}
> +
> +	return ret;
>  }
>  static ssize_t qcom_rmtfs_mem_read(struct file *filp,
>  			      char __user *buf, size_t count, loff_t *f_pos)
> @@ -127,6 +137,9 @@ static int qcom_rmtfs_mem_release(struct inode *inode, struct file *filp)
>  {
>  	struct qcom_rmtfs_mem *rmtfs_mem = filp->private_data;
>  
> +	if (rmtfs_mem->rproc)
> +		rproc_shutdown(rmtfs_mem->rproc);
> +
>  	put_device(&rmtfs_mem->dev);
>  
>  	return 0;
> @@ -156,6 +169,7 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  	struct qcom_scm_vmperm perms[2];
>  	struct reserved_mem *rmem;
>  	struct qcom_rmtfs_mem *rmtfs_mem;
> +	phandle rproc_phandle;
>  	u32 client_id;
>  	u32 vmid;
>  	int ret;
> @@ -181,6 +195,13 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  	rmtfs_mem->client_id = client_id;
>  	rmtfs_mem->size = rmem->size;
>  
> +	ret = of_property_read_u32(node, "rproc", &rproc_phandle);
> +	if (!ret) {
> +		rmtfs_mem->rproc = rproc_get_by_phandle(rproc_phandle);

You're doing an rproc_get(), so you need to do a rproc_put() in
remove().

Brian

> +		if (!rmtfs_mem->rproc)
> +			return -EPROBE_DEFER;
> +	}
> +
>  	device_initialize(&rmtfs_mem->dev);
>  	rmtfs_mem->dev.parent = &pdev->dev;
>  	rmtfs_mem->dev.groups = qcom_rmtfs_mem_groups;
