From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] fpga: intel: Add QSPI FPGA Management Entity Feature
Date: Mon, 7 Aug 2017 10:47:50 -0500
Message-ID: <CANk1AXQmRi9UA6xP9YbyeOLynXET_t1CyZMHK76-CaunfZexAA@mail.gmail.com>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com> <1502043844-3626-4-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502043844-3626-4-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wu Hao <hao.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Tim Whisonant <tim.whisonant-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Enno Luebbers <enno.luebbers-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Shiva Rao <shiva.rao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christopher Rauer <christopher.rauer-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kang Luwei <luwei.kang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 6, 2017 at 1:24 PM,  <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:

+ Wu Hao and the people who signed off on the Intel feature-dev stuff.

Hi Matthew,

By the way, this patch is against v1 of their patchset.  They have v2 out.

You could submit your next version with more conventional numbering
and just note that the last patch is dependent on the Intel fpga
patchset.

> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Add FPGA Management Entity Feature to support Atera
> ASMI Parallel 2 IP core. This feature allows
> the flash used to configure the FPGA at power up
> to be updated over PCIe using mtd-utils.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/fpga/intel/feature-dev.h |   6 ++-
>  drivers/fpga/intel/fme-main.c    | 100 +++++++++++++++++++++++++++++++++++++++
>  drivers/fpga/intel/pcie.c        |   7 +++
>  drivers/fpga/intel/pcie_check.c  |   6 +++
>  4 files changed, 117 insertions(+), 2 deletions(-)

The Intel patchset creates a new way to enumerate generic devices on
fpga's and not just FME's and ports.  But it involves touching 4 files
and adding 100 lines to fme-main.c.  Is there a way that adding a new
device could just mean adding a struct in the device driver itself and
registering it with that framework?

Alan

>
> diff --git a/drivers/fpga/intel/feature-dev.h b/drivers/fpga/intel/feature-dev.h
> index 9303828..5ae799b 100644
> --- a/drivers/fpga/intel/feature-dev.h
> +++ b/drivers/fpga/intel/feature-dev.h
> @@ -40,6 +40,7 @@
>  #define FME_FEATURE_GLOBAL_PERF     "fme_gperf"
>  #define FME_FEATURE_GLOBAL_ERR      "fme_error"
>  #define FME_FEATURE_PR_MGMT         "fme_pr"
> +#define FME_FEATURE_QSPI_FLASH     "fme_qspi_flash"
>
>  #define PORT_FEATURE_HEADER         "port_hdr"
>  #define PORT_FEATURE_UAFU           "port_uafu"
> @@ -60,6 +61,7 @@
>  #define FME_GLOBAL_PERF_REVISION       0
>  #define FME_GLOBAL_ERR_REVISION        0
>  #define FME_PR_MGMT_REVISION           1
> +#define FME_QSPI_REVISION 0
>
>  #define PORT_HEADER_REVISION           0
>  /* UAFU's header info depends on the downloaded GBS */
> @@ -1225,9 +1227,9 @@ enum fme_feature_id {
>         FME_FEATURE_ID_GLOBAL_PERF = 0x3,
>         FME_FEATURE_ID_GLOBAL_ERR = 0x4,
>         FME_FEATURE_ID_PR_MGMT = 0x5,
> -
> +       FME_FEATURE_ID_QSPI_FLASH = 0x6,
>         /* one for fme header. */
> -       FME_FEATURE_ID_MAX = 0x6,
> +       FME_FEATURE_ID_MAX = 0x7,
>  };
>
>  enum port_feature_id {
> diff --git a/drivers/fpga/intel/fme-main.c b/drivers/fpga/intel/fme-main.c
> index 776fe36..03aacb3 100644
> --- a/drivers/fpga/intel/fme-main.c
> +++ b/drivers/fpga/intel/fme-main.c
> @@ -27,6 +27,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/intel-fpga.h>
>  #include <linux/fpga/fpga-mgr.h>
> +#include <linux/mtd/altera-asmip2.h>
>
>  #include "feature-dev.h"
>  #include "fme.h"
> @@ -659,6 +660,101 @@ struct feature_ops power_mgmt_ops = {
>         .uinit = power_mgmt_uinit,
>  };
>
> +#define FLASH_CAPABILITY_OFT 8
> +
> +static int qspi_flash_init(struct platform_device *pdev,
> +                          struct feature *feature)
> +{
> +       u64 reg;
> +       struct altera_asmip2_plat_data qdata;
> +       struct platform_device *cdev;
> +       int ret = 0;
> +       char name[40];
> +
> +       scnprintf(name, sizeof(name), "%s-%p", feature->name, feature->ioaddr);
> +
> +       reg = readq(feature->ioaddr + FLASH_CAPABILITY_OFT);
> +       dev_info(&pdev->dev, "%s %s %d 0x%llx 0x%x 0x%x\n",
> +                __func__, name, feature->resource_index,
> +                reg, readl(feature->ioaddr + FLASH_CAPABILITY_OFT),
> +                readl(feature->ioaddr + FLASH_CAPABILITY_OFT + 4));
> +
> +
> +       cdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
> +
> +       if (!cdev) {
> +               dev_err(&pdev->dev, "platform_device_alloc failed in %s\n",
> +                       __func__);
> +               return -ENOMEM;
> +       }
> +
> +       cdev->dev.parent = &pdev->dev;
> +
> +       memset(&qdata, 0, sizeof(qdata));
> +       qdata.csr_base = feature->ioaddr + FLASH_CAPABILITY_OFT;
> +       qdata.num_chip_sel = 1;
> +
> +       ret = platform_device_add_data(cdev, &qdata, sizeof(qdata));
> +
> +       if (ret) {
> +               dev_err(&pdev->dev, "platform_device_add_data in %s\n",
> +                       __func__);
> +               goto error;
> +       }
> +
> +       cdev->driver_override = kstrdup(ALTERA_ASMIP2_DRV_NAME, GFP_KERNEL);
> +
> +       ret = platform_device_add(cdev);
> +
> +       if (ret) {
> +               dev_err(&pdev->dev, "platform_device_add failed with %d\n",
> +                       ret);
> +               goto error;
> +       }
> +       return ret;
> +
> +error:
> +       platform_device_put(cdev);
> +       return ret;
> +}
> +
> +static int qspi_match(struct device *dev, void *data)
> +{
> +       return !strcmp(dev_name(dev), data);
> +}
> +
> +static void qspi_flash_uinit(struct platform_device *pdev,
> +                            struct feature *feature)
> +{
> +       struct device *parent = &pdev->dev;
> +       struct device *dev;
> +       struct platform_device *cdev;
> +       char name[40];
> +
> +       scnprintf(name, sizeof(name), "%s-%p", feature->name, feature->ioaddr);
> +
> +       dev = device_find_child(parent, name, qspi_match);
> +
> +       if (!dev) {
> +               dev_err(&pdev->dev, "%s NOT found\n", ALTERA_ASMIP2_DRV_NAME);
> +               return;
> +       }
> +
> +       cdev = to_platform_device(dev);
> +
> +       if (!cdev) {
> +               dev_err(&pdev->dev, "no platform container\n");
> +               return;
> +       }
> +
> +       platform_device_unregister(cdev);
> +}
> +
> +struct feature_ops qspi_flash_ops = {
> +       .init = qspi_flash_init,
> +       .uinit = qspi_flash_uinit,
> +};
> +
>  static struct feature_driver fme_feature_drvs[] = {
>         {
>                 .name = FME_FEATURE_HEADER,
> @@ -685,6 +781,10 @@ static struct feature_driver fme_feature_drvs[] = {
>                 .ops = &global_perf_ops,
>         },
>         {
> +               .name = FME_FEATURE_QSPI_FLASH,
> +               .ops = &qspi_flash_ops,
> +       },
> +       {
>                 .ops = NULL,
>         },
>  };
> diff --git a/drivers/fpga/intel/pcie.c b/drivers/fpga/intel/pcie.c
> index a64151a..8f4f3e0 100644
> --- a/drivers/fpga/intel/pcie.c
> +++ b/drivers/fpga/intel/pcie.c
> @@ -28,6 +28,7 @@
>  #include <linux/uuid.h>
>  #include <linux/kdev_t.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mtd/altera-asmip2.h>
>
>  #include "feature-dev.h"
>
> @@ -617,6 +618,12 @@ static struct feature_info fme_features[] = {
>                 .resource_size = sizeof(struct feature_fme_pr),
>                 .feature_index = FME_FEATURE_ID_PR_MGMT,
>                 .revision_id = FME_PR_MGMT_REVISION
> +       },
> +       {
> +               .name = FME_FEATURE_QSPI_FLASH,
> +               .resource_size = ALTERA_ASMIP2_RESOURCE_SIZE,
> +               .feature_index = FME_FEATURE_ID_QSPI_FLASH,
> +               .revision_id = FME_QSPI_REVISION
>         }
>  };
>
> diff --git a/drivers/fpga/intel/pcie_check.c b/drivers/fpga/intel/pcie_check.c
> index e707d72..f0027e1 100644
> --- a/drivers/fpga/intel/pcie_check.c
> +++ b/drivers/fpga/intel/pcie_check.c
> @@ -51,6 +51,11 @@
>  #define FME_FEATURE_PR_MGMT_ID                 0x5
>  #define FME_FEATURE_PR_MGMT_VERSION            0x0
>
> +#define FME_FEATURE_QSPI_FLASH_TYPE            DFH_TYPE_PRIVATE
> +#define FME_FEATURE_QSPI_FLASH_NEXT_OFFSET     0x2000
> +#define FME_FEATURE_QSPI_FLASH_ID              FME_FEATURE_ID_QSPI_FLASH
> +#define FME_FEATURE_QSPI_FLASH_VERSION         FME_QSPI_REVISION
> +
>  #define PORT_FEATURE_HEADER_TYPE               DFH_TYPE_AFU
>  #define PORT_FEATURE_HEADER_NEXT_OFFSET                0x1000
>  #define PORT_FEATURE_HEADER_ID                 DFH_CCI_VERSION
> @@ -91,6 +96,7 @@ static struct feature_header default_fme_feature_hdr[] = {
>         DEFAULT_REG(FME_FEATURE_GLOBAL_PERF),
>         DEFAULT_REG(FME_FEATURE_GLOBAL_ERR),
>         DEFAULT_REG(FME_FEATURE_PR_MGMT),
> +       DEFAULT_REG(FME_FEATURE_QSPI_FLASH),
>  };
>
>  void check_features_header(struct pci_dev *pdev, struct feature_header *hdr,
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
