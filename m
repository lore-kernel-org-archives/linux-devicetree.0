From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 01/11] remoteproc: st_slim_rproc: add a slimcore
 rproc driver
Date: Thu, 3 Nov 2016 14:37:03 -0700
Message-ID: <20161103213703.GA15449@tuxbot>
References: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
 <1476783556-2501-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476783556-2501-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 18 Oct 02:39 PDT 2016, Peter Griffin wrote:

> slim core is used as a basis for many IPs in the STi
> chipsets such as fdma and demux. To avoid duplicating
> the elf loading code in each device driver a slim
> rproc driver has been created.
> 
> This driver is designed to be used by other device drivers
> such as fdma, or demux whose IP is based around a slim core.
> The device driver can call slim_rproc_alloc() to allocate
> a slim rproc and slim_rproc_put() when finished.
> 
> This driver takes care of ioremapping the slim
> registers (dmem, imem, slimcore, peripherals), whose offsets
> and sizes can change between IP's. It also obtains and enables
> any clocks used by the device. This approach avoids having
> a double mapping of the registers as slim_rproc does not register
> its own platform device. It also maps well to device tree
> abstraction as it allows us to have one dt node for the whole
> device.
> 
> All of the generic rproc elf loading code can be reused, and
> we provide start() stop() hooks to start and stop the slim
> core once the firmware has been loaded. This has been tested
> successfully with fdma driver.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/remoteproc/Kconfig               |   7 +-
>  drivers/remoteproc/Makefile              |   1 +
>  drivers/remoteproc/st_slim_rproc.c       | 364 +++++++++++++++++++++++++++++++
>  include/linux/remoteproc/st_slim_rproc.h |  58 +++++
>  4 files changed, 428 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/remoteproc/st_slim_rproc.c
>  create mode 100644 include/linux/remoteproc/st_slim_rproc.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index f396bfe..9270c8e 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -58,7 +58,6 @@ config DA8XX_REMOTEPROC
>  	tristate "DA8xx/OMAP-L13x remoteproc support"
>  	depends on ARCH_DAVINCI_DA8XX
>  	select CMA if MMU
> -	select REMOTEPROC

No, this is an unrelated change to this patch.

>  	select RPMSG_VIRTIO
>  	help
>  	  Say y here to support DA8xx/OMAP-L13x remote processors via the
> @@ -99,10 +98,10 @@ config QCOM_WCNSS_PIL
>  	tristate "Qualcomm WCNSS Peripheral Image Loader"
>  	depends on OF && ARCH_QCOM
>  	depends on QCOM_SMEM
> +	depends on REMOTEPROC
>  	select QCOM_MDT_LOADER
>  	select QCOM_SCM
>  	select QCOM_WCNSS_IRIS
> -	select REMOTEPROC

Dito.


As you now make changes to the entire remoteproc Kconfig file, rather
than simply add a Kconfig symbol we can't bring this in via Vinod's tree
without providing Linus with a messy merge conflict.

So the remoteproc parts now has to go through my tree.

>  	help
>  	  Say y here to support the Peripheral Image Loader for the Qualcomm
>  	  Wireless Connectivity Subsystem.
> @@ -116,4 +115,8 @@ config ST_REMOTEPROC
>  	  processor framework.
>  	  This can be either built-in or a loadable module.
>  
> +config ST_SLIM_REMOTEPROC
> +	tristate
> +	select REMOTEPROC
> +
>  endmenu
[..]
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
[..]
> +struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
> +				char *fw_name)
> +{
[..]
> +	rproc = rproc_alloc(dev, np->name, &slim_rproc_ops,
> +			fw_name, sizeof(*slim_rproc));
[..]
> +	rproc_put(rproc);

As of v4.9 you need to rproc_free() rather than rproc_put() to undo
rproc_alloc().

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
