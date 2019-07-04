Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17957 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfGDOF6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 10:05:58 -0400
Subject: Re: [PATCH 8/8] xhci: tegra: enable ELPG for runtime/system PM
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-4-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <746e8102-187e-a5d0-8a3c-81d6e4f528a5@nvidia.com>
Date: Thu, 4 Jul 2019 15:05:51 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074824.22023-4-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>



On 14/06/2019 08:48, JC Kuo wrote:
> This commit enables XUSB host controller ELPG for runtime and system
> power management.
> 
> NEED CLEANUP.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 802 ++++++++++++++++++++++++++++------
>  1 file changed, 671 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 294158113d62..ade56e63212b 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -17,6 +17,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/phy/tegra/xusb.h>
>  #include <linux/platform_device.h>
> +#include <linux/usb/ch9.h>
>  #include <linux/pm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -38,7 +39,17 @@
>  #define XUSB_CFG_4				0x010
>  #define  XUSB_BASE_ADDR_SHIFT			15
>  #define  XUSB_BASE_ADDR_MASK			0x1ffff
> +#define XUSB_CFG_16				0x040
> +#define XUSB_CFG_24				0x060
> +#define XUSB_CFG_AXI_CFG			0x0f8
> +#define XUSB_CFG_ARU_C11PAGESEL			0x404
> +#define  XUSB_HSP0				BIT(12)
>  #define XUSB_CFG_ARU_C11_CSBRANGE		0x41c
> +#define XUSB_CFG_ARU_CONTEXT			0x43c
> +#define XUSB_CFG_ARU_CONTEXT_HS_PLS		0x478
> +#define XUSB_CFG_ARU_CONTEXT_FS_PLS		0x47c
> +#define XUSB_CFG_ARU_CONTEXT_HSFS_SPEED		0x480
> +#define XUSB_CFG_ARU_CONTEXT_HSFS_PP		0x484
>  #define XUSB_CFG_CSB_BASE_ADDR			0x800
>  
>  /* FPCI mailbox registers */
> @@ -63,11 +74,20 @@
>  #define  MBOX_SMI_INTR_EN			BIT(3)
>  
>  /* IPFS registers */
> +#define XUSB_HOST_MSI_BAR_SZ_0			0x0c0
> +#define XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
> +#define XUSB_HOST_MSI_FPCI_BAR_ST_0		0x0c8
> +#define XUSB_HOST_MSI_VEC0_0			0x100
> +#define XUSB_HOST_MSI_EN_VEC0_0			0x140
>  #define IPFS_XUSB_HOST_CONFIGURATION_0		0x180
>  #define  IPFS_EN_FPCI				BIT(0)
> +#define XUSB_HOST_FPCI_ERROR_MASKS_0		0x184
>  #define IPFS_XUSB_HOST_INTR_MASK_0		0x188
>  #define  IPFS_IP_INT_MASK			BIT(16)
> +#define XUSB_HOST_IPFS_INTR_ENABLE_0		0x198
> +#define XUSB_HOST_UFPCI_CONFIG_0		0x19c
>  #define IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0	0x1bc
> +#define XUSB_HOST_MCCIF_FIFOCTRL_0		0x1dc
>  
>  #define CSB_PAGE_SELECT_MASK			0x7fffff
>  #define CSB_PAGE_SELECT_SHIFT			9
> @@ -164,6 +184,31 @@ struct tegra_xusb_soc {
>  	bool has_ipfs;
>  };
>  
> +struct tegra_xhci_ipfs_context {
> +	u32 msi_bar_sz;
> +	u32 msi_axi_barst;
> +	u32 msi_fpci_barst;
> +	u32 msi_vec0;
> +	u32 msi_en_vec0;
> +	u32 fpci_error_masks;
> +	u32 intr_mask;
> +	u32 ipfs_intr_enable;
> +	u32 ufpci_config;
> +	u32 clkgate_hysteresis;
> +	u32 xusb_host_mccif_fifo_cntrl;
> +};
> +
> +struct tegra_xhci_fpci_context {
> +	u32 hs_pls;
> +	u32 fs_pls;
> +	u32 hsfs_speed;
> +	u32 hsfs_pp;
> +	u32 cfg_aru;
> +	u32 cfg_order;
> +	u32 cfg_fladj;
> +	u32 cfg_sid;
> +};
> +
>  struct tegra_xusb {
>  	struct device *dev;
>  	void __iomem *regs;
> @@ -173,6 +218,7 @@ struct tegra_xusb {
>  
>  	int xhci_irq;
>  	int mbox_irq;
> +	int padctl_irq;
>  
>  	void __iomem *ipfs_base;
>  	void __iomem *fpci_base;
> @@ -198,8 +244,6 @@ struct tegra_xusb {
>  
>  	struct device *genpd_dev_host;
>  	struct device *genpd_dev_ss;
> -	struct device_link *genpd_dl_host;
> -	struct device_link *genpd_dl_ss;
>  
>  	struct phy **phys;
>  	unsigned int num_phys;
> @@ -210,9 +254,15 @@ struct tegra_xusb {
>  		void *virt;
>  		dma_addr_t phys;
>  	} fw;
> +
> +	bool suspended;
> +	struct tegra_xhci_fpci_context fpci_ctx;
> +	struct tegra_xhci_ipfs_context ipfs_ctx;
>  };
>  
>  static struct hc_driver __read_mostly tegra_xhci_hc_driver;
> +static int tegra_xhci_exit_elpg(struct tegra_xusb *tegra, bool runtime);
> +static int tegra_xhci_enter_elpg(struct tegra_xusb *tegra, bool runtime);
>  
>  static inline u32 fpci_readl(struct tegra_xusb *tegra, unsigned int offset)
>  {
> @@ -585,6 +635,14 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
>  								     enable);
>  			if (err < 0)
>  				break;
> +
> +			if (!enable) {
> +				/*
> +				 * Add this delay to increase stability of
> +				 * directing U3.
> +				 */
> +				usleep_range(500, 1000);

Please elaborate.

> +			}
>  		}
>  
>  		if (err < 0) {
> @@ -621,6 +679,9 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>  
>  	mutex_lock(&tegra->lock);
>  
> +	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
> +		goto out;
> +
>  	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_DATA_OUT);
>  	tegra_xusb_mbox_unpack(&msg, value);
>  
> @@ -634,13 +695,14 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>  
>  	tegra_xusb_mbox_handle(tegra, &msg);
>  
> +out:
>  	mutex_unlock(&tegra->lock);
>  	return IRQ_HANDLED;
>  }
>  
> -static void tegra_xusb_config(struct tegra_xusb *tegra,
> -			      struct resource *regs)
> +static void tegra_xusb_config(struct tegra_xusb *tegra)
>  {
> +	resource_size_t base_addr = tegra->hcd->rsrc_start;
>  	u32 value;
>  
>  	if (tegra->soc->has_ipfs) {
> @@ -654,7 +716,7 @@ static void tegra_xusb_config(struct tegra_xusb *tegra,
>  	/* Program BAR0 space */
>  	value = fpci_readl(tegra, XUSB_CFG_4);
>  	value &= ~(XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
> -	value |= regs->start & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
> +	value |= base_addr & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
>  	fpci_writel(tegra, value, XUSB_CFG_4);
>  
>  	usleep_range(100, 200);
> @@ -777,44 +839,57 @@ static void tegra_xusb_phy_disable(struct tegra_xusb *tegra)
>  static int tegra_xusb_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> +	int ret;
>  
> -	tegra_xusb_phy_disable(tegra);
> -	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
> -	tegra_xusb_clk_disable(tegra);
> +	synchronize_irq(tegra->mbox_irq);
>  
> -	return 0;
> +	mutex_lock(&tegra->lock);
> +	ret = tegra_xhci_enter_elpg(tegra, true);
> +	mutex_unlock(&tegra->lock);
> +
> +	return ret;
>  }
>  
>  static int tegra_xusb_runtime_resume(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> -	int err;
> +	int ret;
>  
> -	err = tegra_xusb_clk_enable(tegra);
> -	if (err) {
> -		dev_err(dev, "failed to enable clocks: %d\n", err);
> -		return err;
> -	}
> +	mutex_lock(&tegra->lock);
> +	ret = tegra_xhci_exit_elpg(tegra, true);
> +	mutex_unlock(&tegra->lock);
>  
> -	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
> -	if (err) {
> -		dev_err(dev, "failed to enable regulators: %d\n", err);
> -		goto disable_clk;
> -	}
> +	return ret;
> +}
>  
> -	err = tegra_xusb_phy_enable(tegra);
> -	if (err < 0) {
> -		dev_err(dev, "failed to enable PHYs: %d\n", err);
> -		goto disable_regulator;
> +static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
> +{
> +	struct tegra_xusb_fw_header *header;
> +	struct device *dev = tegra->dev;
> +	const struct firmware *fw;
> +	int rc;
> +
> +	if (!tegra->fw.virt) {

Either return here or check this before calling this function.

> +		rc = request_firmware(&fw, tegra->soc->firmware, tegra->dev);
> +		if (rc < 0) {
> +			dev_err(dev, "failed to request firmware: %d\n", rc);
> +			return rc;
> +		}
> +
> +		header = (struct tegra_xusb_fw_header *)fw->data;
> +		tegra->fw.size = le32_to_cpu(header->fwimg_len);
> +		tegra->fw.virt = dma_alloc_coherent(dev, tegra->fw.size,
> +						   &tegra->fw.phys, GFP_KERNEL);
> +		if (!tegra->fw.virt) {
> +			release_firmware(fw);
> +			return -ENOMEM;
> +		}
> +
> +		memcpy(tegra->fw.virt, fw->data, tegra->fw.size);
> +		release_firmware(fw);
>  	}
>  
>  	return 0;
> -
> -disable_regulator:
> -	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
> -disable_clk:
> -	tegra_xusb_clk_disable(tegra);
> -	return err;
>  }
>  
>  static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
> @@ -822,7 +897,6 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>  	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
>  	struct tegra_xusb_fw_header *header;
>  	struct device *dev = tegra->dev;
> -	const struct firmware *fw;
>  	unsigned long timeout;
>  	time64_t timestamp;
>  	struct tm time;
> @@ -830,27 +904,9 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>  	u32 value;
>  	int err;
>  
> -	err = request_firmware(&fw, tegra->soc->firmware, tegra->dev);
> -	if (err < 0) {
> -		dev_err(tegra->dev, "failed to request firmware: %d\n", err);
> +	err = tegra_xusb_request_firmware(tegra);
> +	if (err)
>  		return err;
> -	}
> -
> -	/* Load Falcon controller with its firmware. */
> -	header = (struct tegra_xusb_fw_header *)fw->data;
> -	tegra->fw.size = le32_to_cpu(header->fwimg_len);
> -
> -	tegra->fw.virt = dma_alloc_coherent(tegra->dev, tegra->fw.size,
> -					    &tegra->fw.phys, GFP_KERNEL);
> -	if (!tegra->fw.virt) {
> -		dev_err(tegra->dev, "failed to allocate memory for firmware\n");
> -		release_firmware(fw);
> -		return -ENOMEM;
> -	}
> -
> -	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
> -	memcpy(tegra->fw.virt, fw->data, tegra->fw.size);
> -	release_firmware(fw);
>  
>  	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
>  		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
> @@ -865,6 +921,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>  	 * Boot code of the firmware reads the ILOAD_BASE registers
>  	 * to get to the start of the DFI in system memory.
>  	 */
> +	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
>  	address = tegra->fw.phys + sizeof(*header);
>  	csb_writel(tegra, address >> 32, XUSB_CSB_MP_ILOAD_BASE_HI);
>  	csb_writel(tegra, address, XUSB_CSB_MP_ILOAD_BASE_LO);
> @@ -942,10 +999,6 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>  static void tegra_xusb_powerdomain_remove(struct device *dev,
>  					  struct tegra_xusb *tegra)
>  {
> -	if (tegra->genpd_dl_ss)
> -		device_link_del(tegra->genpd_dl_ss);
> -	if (tegra->genpd_dl_host)
> -		device_link_del(tegra->genpd_dl_host);
>  	if (!IS_ERR_OR_NULL(tegra->genpd_dev_ss))
>  		dev_pm_domain_detach(tegra->genpd_dev_ss, true);
>  	if (!IS_ERR_OR_NULL(tegra->genpd_dev_host))
> @@ -971,25 +1024,102 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
>  		return err;
>  	}
>  
> -	tegra->genpd_dl_host = device_link_add(dev, tegra->genpd_dev_host,
> -					       DL_FLAG_PM_RUNTIME |
> -					       DL_FLAG_STATELESS);
> -	if (!tegra->genpd_dl_host) {
> -		dev_err(dev, "adding host device link failed!\n");
> -		return -ENODEV;
> +	return 0;
> +}
> +
> +static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
> +{
> +	struct device *dev = tegra->dev;
> +	bool use_genpd;
> +	int rc;
> +
> +	use_genpd = of_property_read_bool(dev->of_node, "power-domains");
> +
> +	if (use_genpd)
> +		rc = pm_runtime_get_sync(tegra->genpd_dev_ss);
> +	else {
> +		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
> +							tegra->ss_clk,
> +							tegra->ss_rst);
> +	}
> +	if (rc < 0) {
> +		dev_err(dev, "failed to enable XUSB SS partition: %d\n", rc);
> +		return rc;
> +	}
> +
> +	if (use_genpd)
> +		rc = pm_runtime_get_sync(tegra->genpd_dev_host);
> +	else {
> +		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
> +							tegra->host_clk,
> +							tegra->host_rst);
> +	}
> +	if (rc < 0) {
> +		dev_err(dev, "failed to enable XUSB Host partition: %d\n", rc);
> +		if (use_genpd)
> +			pm_runtime_put_sync(tegra->genpd_dev_ss);
> +		else
> +			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
> +{
> +	struct device *dev = tegra->dev;
> +	bool use_genpd;
> +	int rc;
> +
> +	use_genpd = of_property_read_bool(dev->of_node, "power-domains");
> +
> +	if (use_genpd)
> +		rc = pm_runtime_put_sync(tegra->genpd_dev_host);
> +	else
> +		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
> +
> +	if (rc < 0) {
> +		dev_err(dev, "failed to disable XUSB Host partition: %d\n", rc);
> +		return rc;
>  	}
>  
> -	tegra->genpd_dl_ss = device_link_add(dev, tegra->genpd_dev_ss,
> -					     DL_FLAG_PM_RUNTIME |
> -					     DL_FLAG_STATELESS);
> -	if (!tegra->genpd_dl_ss) {
> -		dev_err(dev, "adding superspeed device link failed!\n");
> -		return -ENODEV;
> +	if (use_genpd)
> +		rc = pm_runtime_put_sync(tegra->genpd_dev_ss);
> +	else
> +		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> +
> +	if (rc < 0) {
> +		dev_err(dev, "failed to disable XUSB SS partition: %d\n", rc);
> +		if (use_genpd)
> +			pm_runtime_get_sync(tegra->genpd_dev_host);
> +		else {
> +			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
> +							  tegra->host_clk,
> +							  tegra->host_rst);
> +		}
> +		return rc;

Sorry but NAK!

It has taken us literally years to get the XUSB driver working with
genpd for power-domains, this is a massive step backwards. Sorry but no.
There should be no need to use these legacy APIs.

>  	}
>  
>  	return 0;
>  }
>  
> +static irqreturn_t tegra_xusb_padctl_irq(int irq, void *data)
> +{
> +	struct tegra_xusb *tegra = data;
> +
> +	mutex_lock(&tegra->lock);
> +	if (tegra->suspended) {
> +		mutex_unlock(&tegra->lock);
> +		return IRQ_HANDLED;
> +	}
> +	mutex_unlock(&tegra->lock);
> +
> +	pm_runtime_resume(tegra->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int tegra_xusb_probe(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_mbox_msg msg;
> @@ -1035,6 +1165,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  	if (tegra->mbox_irq < 0)
>  		return tegra->mbox_irq;
>  
> +	tegra->padctl_irq = platform_get_irq(pdev, 2);
> +	if (tegra->padctl_irq < 0)
> +		return tegra->padctl_irq;
> +
>  	tegra->padctl = tegra_xusb_padctl_get(&pdev->dev);
>  	if (IS_ERR(tegra->padctl))
>  		return PTR_ERR(tegra->padctl);
> @@ -1119,25 +1253,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  				err);
>  			goto put_padctl;
>  		}
> -
> -		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
> -							tegra->ss_clk,
> -							tegra->ss_rst);
> -		if (err) {
> -			dev_err(&pdev->dev,
> -				"failed to enable XUSBA domain: %d\n", err);
> -			goto put_padctl;
> -		}
> -
> -		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
> -							tegra->host_clk,
> -							tegra->host_rst);
> -		if (err) {
> -			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> -			dev_err(&pdev->dev,
> -				"failed to enable XUSBC domain: %d\n", err);
> -			goto put_padctl;
> -		}
>  	} else {
>  		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
>  		if (err)
> @@ -1197,6 +1312,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  		err = -ENOMEM;
>  		goto put_powerdomains;
>  	}
> +	tegra->hcd->skip_phy_initialization = 1;
> +	tegra->hcd->regs = tegra->regs;
> +	tegra->hcd->rsrc_start = regs->start;
> +	tegra->hcd->rsrc_len = resource_size(regs);
>  
>  	/*
>  	 * This must happen after usb_create_hcd(), because usb_create_hcd()
> @@ -1204,33 +1323,40 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  	 */
>  	platform_set_drvdata(pdev, tegra);
>  
> -	pm_runtime_enable(&pdev->dev);
> -	if (pm_runtime_enabled(&pdev->dev))
> -		err = pm_runtime_get_sync(&pdev->dev);
> -	else
> -		err = tegra_xusb_runtime_resume(&pdev->dev);
> +	err = tegra_xusb_clk_enable(tegra);
> +	if (err) {
> +		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
> +		goto put_hcd;
> +	}
> +
> +	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
> +	if (err) {
> +		dev_err(tegra->dev, "failed to enable regulators: %d\n", err);
> +		goto disable_clk;
> +	}
>  
> +	err = tegra_xusb_phy_enable(tegra);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
> -		goto disable_rpm;
> +		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
> +		goto disable_regulator;
>  	}
>  
> -	tegra_xusb_config(tegra, regs);
> +	err = tegra_xusb_unpowergate_partitions(tegra);
> +	if (err)
> +		goto disable_phy;
> +
> +	tegra_xusb_config(tegra);
>  
>  	err = tegra_xusb_load_firmware(tegra);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
> -		goto put_rpm;
> +		goto powergate;
>  	}
>  
> -	tegra->hcd->regs = tegra->regs;
> -	tegra->hcd->rsrc_start = regs->start;
> -	tegra->hcd->rsrc_len = resource_size(regs);
> -
>  	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
> -		goto put_rpm;
> +		goto powergate;
>  	}
>  
>  	device_wakeup_enable(tegra->hcd->self.controller);
> @@ -1253,6 +1379,26 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  		goto put_usb3;
>  	}
>  
> +	err = devm_request_threaded_irq(&pdev->dev, tegra->mbox_irq,
> +					tegra_xusb_mbox_irq,
> +					tegra_xusb_mbox_thread, 0,
> +					dev_name(&pdev->dev), tegra);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to request mbox IRQ: %d\n", err);
> +		goto remove_usb3;
> +	}
> +
> +	err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq,
> +					NULL,
> +					tegra_xusb_padctl_irq,
> +					IRQF_ONESHOT |
> +					IRQF_TRIGGER_HIGH,
> +					dev_name(&pdev->dev), tegra);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
> +		goto remove_usb3;
> +	}
> +
>  	mutex_lock(&tegra->lock);
>  
>  	/* Enable firmware messages from controller. */
> @@ -1268,14 +1414,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  
>  	mutex_unlock(&tegra->lock);
>  
> -	err = devm_request_threaded_irq(&pdev->dev, tegra->mbox_irq,
> -					tegra_xusb_mbox_irq,
> -					tegra_xusb_mbox_thread, 0,
> -					dev_name(&pdev->dev), tegra);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
> -		goto remove_usb3;
> -	}
> +	/* Enable wake for both USB 2.0 and USB 3.0 roothubs */
> +	device_init_wakeup(&tegra->hcd->self.root_hub->dev, true);
> +	device_init_wakeup(&xhci->shared_hcd->self.root_hub->dev, true);
> +	device_init_wakeup(tegra->dev, true);
> +
> +	pm_runtime_use_autosuspend(tegra->dev);
> +	pm_runtime_set_autosuspend_delay(tegra->dev, 2000);
> +	pm_runtime_mark_last_busy(tegra->dev);
> +	pm_runtime_set_active(tegra->dev);
> +	pm_runtime_enable(tegra->dev);
>  
>  	return 0;
>  
> @@ -1285,19 +1433,18 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  	usb_put_hcd(xhci->shared_hcd);
>  remove_usb2:
>  	usb_remove_hcd(tegra->hcd);
> -put_rpm:
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		tegra_xusb_runtime_suspend(&pdev->dev);
> -disable_rpm:
> -	pm_runtime_disable(&pdev->dev);
> +powergate:
> +	tegra_xusb_powergate_partitions(tegra);
> +disable_phy:
> +	tegra_xusb_phy_disable(tegra);
> +disable_regulator:
> +	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
> +disable_clk:
> +	tegra_xusb_clk_disable(tegra);
> +put_hcd:
>  	usb_put_hcd(tegra->hcd);
>  put_powerdomains:
> -	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
> -		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
> -		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> -	} else {
> -		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
> -	}
> +	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
>  put_padctl:
>  	tegra_xusb_padctl_put(tegra->padctl);
>  	return err;
> @@ -1308,6 +1455,8 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>  	struct tegra_xusb *tegra = platform_get_drvdata(pdev);
>  	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
>  
> +	pm_runtime_get_sync(&pdev->dev);
> +
>  	usb_remove_hcd(xhci->shared_hcd);
>  	usb_put_hcd(xhci->shared_hcd);
>  	xhci->shared_hcd = NULL;
> @@ -1317,38 +1466,429 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>  	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
>  			  tegra->fw.phys);
>  
> -	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put(&pdev->dev);
>  
> -	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
> -		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
> -		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> -	} else {
> +	tegra_xusb_powergate_partitions(tegra);
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "power-domains"))
>  		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
> -	}
>  
> +	tegra_xusb_phy_disable(tegra);
> +	tegra_xusb_clk_disable(tegra);
> +	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
>  	tegra_xusb_padctl_put(tegra->padctl);

Do you release the firmware anywhere?

>  
>  	return 0;
>  }
>  
> +static void tegra_xhci_save_context(struct tegra_xusb *tegra)
> +{
> +	if (tegra->soc->has_ipfs) {
> +		/* Save IPFS registers */
> +		tegra->ipfs_ctx.msi_bar_sz =
> +			ipfs_readl(tegra, XUSB_HOST_MSI_BAR_SZ_0);
> +		tegra->ipfs_ctx.msi_axi_barst =
> +			ipfs_readl(tegra, XUSB_HOST_MSI_AXI_BAR_ST_0);
> +		tegra->ipfs_ctx.msi_fpci_barst =
> +			ipfs_readl(tegra, XUSB_HOST_MSI_FPCI_BAR_ST_0);
> +		tegra->ipfs_ctx.msi_vec0 =
> +			ipfs_readl(tegra, XUSB_HOST_MSI_VEC0_0);
> +		tegra->ipfs_ctx.msi_en_vec0 =
> +			ipfs_readl(tegra, XUSB_HOST_MSI_EN_VEC0_0);
> +		tegra->ipfs_ctx.fpci_error_masks =
> +			ipfs_readl(tegra, XUSB_HOST_FPCI_ERROR_MASKS_0);
> +		tegra->ipfs_ctx.intr_mask =
> +			ipfs_readl(tegra, IPFS_XUSB_HOST_INTR_MASK_0);
> +		tegra->ipfs_ctx.ipfs_intr_enable =
> +			ipfs_readl(tegra, XUSB_HOST_IPFS_INTR_ENABLE_0);
> +		tegra->ipfs_ctx.ufpci_config =
> +			ipfs_readl(tegra, XUSB_HOST_UFPCI_CONFIG_0);
> +		tegra->ipfs_ctx.clkgate_hysteresis =
> +			ipfs_readl(tegra,
> +				IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0);
> +		tegra->ipfs_ctx.xusb_host_mccif_fifo_cntrl =
> +			ipfs_readl(tegra, XUSB_HOST_MCCIF_FIFOCTRL_0);
> +	}
> +
> +	/* Save FPCI registers */
> +	tegra->fpci_ctx.hs_pls =
> +		fpci_readl(tegra, XUSB_CFG_ARU_CONTEXT_HS_PLS);
> +	tegra->fpci_ctx.fs_pls =
> +		fpci_readl(tegra, XUSB_CFG_ARU_CONTEXT_FS_PLS);
> +	tegra->fpci_ctx.hsfs_speed =
> +		fpci_readl(tegra, XUSB_CFG_ARU_CONTEXT_HSFS_SPEED);
> +	tegra->fpci_ctx.hsfs_pp =
> +		fpci_readl(tegra, XUSB_CFG_ARU_CONTEXT_HSFS_PP);
> +	tegra->fpci_ctx.cfg_aru = fpci_readl(tegra, XUSB_CFG_ARU_CONTEXT);
> +	tegra->fpci_ctx.cfg_order = fpci_readl(tegra, XUSB_CFG_AXI_CFG);
> +	tegra->fpci_ctx.cfg_fladj = fpci_readl(tegra, XUSB_CFG_24);
> +	tegra->fpci_ctx.cfg_sid = fpci_readl(tegra, XUSB_CFG_16);
> +}
> +
> +static void tegra_xhci_restore_context(struct tegra_xusb *tegra)
> +{
> +	/* Restore FPCI registers */
> +	fpci_writel(tegra, tegra->fpci_ctx.hs_pls, XUSB_CFG_ARU_CONTEXT_HS_PLS);
> +	fpci_writel(tegra, tegra->fpci_ctx.fs_pls, XUSB_CFG_ARU_CONTEXT_FS_PLS);
> +	fpci_writel(tegra, tegra->fpci_ctx.hsfs_speed,
> +		    XUSB_CFG_ARU_CONTEXT_HSFS_SPEED);
> +	fpci_writel(tegra, tegra->fpci_ctx.hsfs_pp,
> +		    XUSB_CFG_ARU_CONTEXT_HSFS_PP);
> +	fpci_writel(tegra, tegra->fpci_ctx.cfg_aru, XUSB_CFG_ARU_CONTEXT);
> +	fpci_writel(tegra, tegra->fpci_ctx.cfg_order, XUSB_CFG_AXI_CFG);
> +	fpci_writel(tegra, tegra->fpci_ctx.cfg_fladj, XUSB_CFG_24);
> +	fpci_writel(tegra, tegra->fpci_ctx.cfg_sid, XUSB_CFG_16);
> +
> +	if (tegra->soc->has_ipfs) {
> +		/* Restore IPFS registers */
> +		ipfs_writel(tegra, tegra->ipfs_ctx.msi_bar_sz,
> +			XUSB_HOST_MSI_BAR_SZ_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.msi_axi_barst,
> +			XUSB_HOST_MSI_AXI_BAR_ST_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.msi_fpci_barst,
> +			XUSB_HOST_MSI_FPCI_BAR_ST_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.msi_vec0,
> +			XUSB_HOST_MSI_VEC0_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.msi_en_vec0,
> +			XUSB_HOST_MSI_EN_VEC0_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.fpci_error_masks,
> +			XUSB_HOST_FPCI_ERROR_MASKS_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.intr_mask,
> +			IPFS_XUSB_HOST_INTR_MASK_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.ipfs_intr_enable,
> +			XUSB_HOST_IPFS_INTR_ENABLE_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.ufpci_config,
> +			XUSB_HOST_UFPCI_CONFIG_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.clkgate_hysteresis,
> +			IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0);
> +		ipfs_writel(tegra, tegra->ipfs_ctx.xusb_host_mccif_fifo_cntrl,
> +			XUSB_HOST_MCCIF_FIFOCTRL_0);
> +	}
> +}
> +
> +static enum usb_device_speed
> +tegra_xhci_portsc_to_speed(struct tegra_xusb *tegra, u32 portsc)
> +{
> +	if (DEV_LOWSPEED(portsc))
> +		return USB_SPEED_LOW;
> +	else if (DEV_HIGHSPEED(portsc))
> +		return USB_SPEED_HIGH;
> +	else if (DEV_FULLSPEED(portsc))
> +		return USB_SPEED_FULL;
> +	else if (DEV_SUPERSPEED_ANY(portsc))
> +		return USB_SPEED_SUPER;
> +	else
> +		return USB_SPEED_UNKNOWN;
> +}
> +
> +static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
> +{
> +	struct tegra_xusb_padctl *padctl = tegra->padctl;
> +	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	enum usb_device_speed speed;
> +	struct phy *phy;
> +	int index, offset;
> +	int i, j, k;
> +	struct xhci_hub *rhub;
> +	u32 portsc;
> +
> +	for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
> +		if (strcmp(tegra->soc->phy_types[i].name, "usb3") == 0)
> +			rhub = &xhci->usb3_rhub;
> +		else
> +			rhub = &xhci->usb2_rhub;
> +
> +		if (strcmp(tegra->soc->phy_types[i].name, "hsic") == 0)
> +			offset = tegra->soc->ports.usb2.count;
> +		else
> +			offset = 0;
> +
> +		for (j = 0; j < tegra->soc->phy_types[i].num; j++) {
> +			phy = tegra->phys[k++];
> +
> +			if (!phy)
> +				continue;
> +
> +			index = j + offset;
> +
> +			if (index >= rhub->num_ports)
> +				continue;
> +
> +			portsc = readl(rhub->ports[index]->addr);
> +			speed = tegra_xhci_portsc_to_speed(tegra, portsc);
> +			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy,
> +							       speed);
> +			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
> +		}
> +	}
> +}
> +
> +static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
> +{
> +	struct tegra_xusb_padctl *padctl = tegra->padctl;
> +	int i;
> +
> +	for (i = 0; i < tegra->num_phys; i++) {
> +		if (!tegra->phys[i])
> +			continue;
> +
> +		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
> +	}
> +}
> +
> +static void tegra_xhci_disable_phy_sleepwalk(struct tegra_xusb *tegra)
> +{
> +	struct tegra_xusb_padctl *padctl = tegra->padctl;
> +	int i;
> +
> +	for (i = 0; i < tegra->num_phys; i++) {
> +		if (!tegra->phys[i])
> +			continue;
> +
> +		tegra_xusb_padctl_disable_phy_sleepwalk(padctl, tegra->phys[i]);
> +	}
> +}
> +
> +static int tegra_xhci_check_ports_for_u3(struct tegra_xusb *tegra)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	struct device *dev = tegra->dev;
> +	struct xhci_hub *rhubs[] = {&xhci->usb2_rhub, &xhci->usb3_rhub, NULL};
> +	struct xhci_hub **rhub;
> +	unsigned long flags;
> +	u32 usbcmd, reg;
> +	int i, ret = 0;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +
> +	usbcmd = readl(&xhci->op_regs->command);
> +	usbcmd &= ~CMD_EIE;
> +	writel(usbcmd, &xhci->op_regs->command);
> +
> +	for (rhub = rhubs; (*rhub) != NULL; rhub++) {
> +		for (i = 0; i < (*rhub)->num_ports; i++) {
> +			reg = readl((*rhub)->ports[i]->addr);
> +			if (!(reg & PORT_PE))
> +				continue;
> +
> +			if ((reg & PORT_PLS_MASK) != XDEV_U3) {
> +				dev_info(dev, "%d-%d isn't suspended: 0x%08x\n",
> +					 (*rhub)->hcd->self.busnum, i + 1, reg);
> +				ret = -EBUSY;
> +			}
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	return ret;
> +}
> +
> +/* caller must hold tegra->lock */
> +static int tegra_xhci_enter_elpg(struct tegra_xusb *tegra, bool runtime)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	struct device *dev = tegra->dev;
> +	bool do_wakeup = runtime ? true : device_may_wakeup(dev);
> +	unsigned int i;
> +	int rc;
> +
> +	dev_info(dev, "entering ELPG\n");
> +
> +	rc = tegra_xhci_check_ports_for_u3(tegra);
> +	if (rc < 0)
> +		goto out;
> +
> +	rc = xhci_suspend(xhci, do_wakeup);
> +
> +	if (rc) {
> +		dev_warn(dev, "xhci_suspend() failed %d\n", rc);
> +		goto out;
> +	}
> +
> +	tegra_xhci_save_context(tegra);
> +
> +	if (do_wakeup)
> +		tegra_xhci_enable_phy_sleepwalk_wake(tegra);
> +
> +	tegra_xusb_powergate_partitions(tegra);
> +
> +	for (i = 0; i < tegra->num_phys; i++) {
> +		if (!tegra->phys[i])
> +			continue;
> +
> +		phy_power_off(tegra->phys[i]);
> +		if (!do_wakeup)
> +			phy_exit(tegra->phys[i]);
> +	}
> +
> +	tegra_xusb_clk_disable(tegra);
> +out:
> +	if (!rc)
> +		dev_info(tegra->dev, "entering ELPG done\n");
> +	else {
> +		u32 usbcmd;
> +
> +		usbcmd = readl(&xhci->op_regs->command);
> +		usbcmd |= CMD_EIE;
> +		writel(usbcmd, &xhci->op_regs->command);
> +
> +		dev_info(tegra->dev, "entering ELPG failed\n");
> +		pm_runtime_mark_last_busy(tegra->dev);
> +	}
> +
> +	return rc;
> +}
> +
> +/* caller must hold tegra->lock */
> +static int tegra_xhci_exit_elpg(struct tegra_xusb *tegra, bool runtime)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	struct device *dev = tegra->dev;
> +	struct tegra_xusb_mbox_msg msg;
> +	bool do_wakeup = runtime ? true : device_may_wakeup(dev);
> +	unsigned int i;
> +	int rc;
> +	u32 usbcmd;
> +
> +	dev_info(dev, "exiting ELPG\n");
> +	pm_runtime_mark_last_busy(tegra->dev);
> +
> +	rc = tegra_xusb_clk_enable(tegra);
> +	if (rc) {
> +		dev_warn(dev, "failed to enable xhci clocks %d\n", rc);
> +		goto out;
> +	}
> +
> +	rc = tegra_xusb_unpowergate_partitions(tegra);
> +	if (rc)
> +		goto disable_clks;
> +
> +	if (do_wakeup)
> +		tegra_xhci_disable_phy_wake(tegra);
> +
> +	for (i = 0; i < tegra->num_phys; i++) {
> +		if (!tegra->phys[i])
> +			continue;
> +
> +		if (!do_wakeup)
> +			phy_init(tegra->phys[i]);
> +
> +		phy_power_on(tegra->phys[i]);
> +	}
> +
> +	tegra_xusb_config(tegra);
> +	tegra_xhci_restore_context(tegra);
> +
> +	rc = tegra_xusb_load_firmware(tegra);
> +	if (rc < 0)
> +		goto disable_phy;
> +
> +	msg.cmd = MBOX_CMD_MSG_ENABLED;
> +	msg.data = 0;
> +
> +	rc = tegra_xusb_mbox_send(tegra, &msg);
> +	if (rc < 0) {
> +		dev_err(dev, "failed to enable messages: %d\n", rc);
> +		goto disable_phy;
> +	}
> +
> +	if (do_wakeup)
> +		tegra_xhci_disable_phy_sleepwalk(tegra);
> +
> +	rc = xhci_resume(xhci, 0);
> +
> +	usbcmd = readl(&xhci->op_regs->command);
> +	usbcmd |= CMD_EIE;
> +	writel(usbcmd, &xhci->op_regs->command);
> +
> +	goto out;
> +
> +disable_phy:
> +	for (i = 0; i < tegra->num_phys; i++) {
> +		if (!tegra->phys[i])
> +			continue;
> +
> +		phy_power_off(tegra->phys[i]);
> +		if (!do_wakeup)
> +			phy_exit(tegra->phys[i]);
> +	}
> +	tegra_xusb_powergate_partitions(tegra);
> +disable_clks:
> +	tegra_xusb_clk_disable(tegra);
> +out:
> +	if (!rc)
> +		dev_info(dev, "exiting ELPG done\n");
> +	else
> +		dev_info(dev, "exiting ELPG failed\n");
> +
> +	return rc;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int tegra_xusb_suspend(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> -	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> -	bool wakeup = device_may_wakeup(dev);
> +	int ret;
> +
> +	synchronize_irq(tegra->mbox_irq);
> +
> +	mutex_lock(&tegra->lock);
> +
> +	if (pm_runtime_suspended(dev)) {
> +		ret = tegra_xhci_exit_elpg(tegra, true);
> +		if (ret < 0)
> +			goto out;
> +	}
> +
> +	ret = tegra_xhci_enter_elpg(tegra, false);
> +	if (ret < 0) {
> +		if (pm_runtime_suspended(dev)) {
> +			pm_runtime_disable(dev);
> +			pm_runtime_set_active(dev);
> +			pm_runtime_enable(dev);
> +		}
>  
> -	/* TODO: Powergate controller across suspend/resume. */
> -	return xhci_suspend(xhci, wakeup);
> +		goto out;
> +	}
> +
> +out:
> +	if (!ret) {
> +		tegra->suspended = true;
> +		pm_runtime_disable(dev);
> +	}
> +
> +	mutex_unlock(&tegra->lock);
> +
> +	return ret;
>  }
>  
>  static int tegra_xusb_resume(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> -	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	int ret = 0;
> +
> +	mutex_lock(&tegra->lock);
> +
> +	if (!tegra->suspended) {
> +		mutex_unlock(&tegra->lock);
> +		return 0;
> +	}
> +
> +	ret = tegra_xhci_exit_elpg(tegra, true);
> +	if (ret < 0) {
> +		mutex_unlock(&tegra->lock);
> +		return ret;
> +	}
> +
> +	tegra->suspended = false;
> +	mutex_unlock(&tegra->lock);
>  
> -	return xhci_resume(xhci, 0);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
>  }
>  #endif
>  
> 

-- 
nvpublic
