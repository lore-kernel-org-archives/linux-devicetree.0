From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 05/12] PCI: aardvark: add suspend to RAM support
Date: Mon, 3 Dec 2018 10:27:08 +0000
Message-ID: <20181203102708.GA6090@e107981-ln.cambridge.arm.com>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
 <20181123141831.8214-6-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181123141831.8214-6-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, sudeep.holla@arm.com
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

[+Rafael, Sudeep]

On Fri, Nov 23, 2018 at 03:18:24PM +0100, Miquel Raynal wrote:
> Add suspend and resume callbacks. The priority of these are
> "_noirq()", to workaround early access to the registers done by the
> PCI core through the ->read()/->write() callbacks at resume time.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/pci/controller/pci-aardvark.c | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 108b3f15c410..7ecf1ac4036b 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -1108,6 +1108,55 @@ static int advk_pcie_setup_clk(struct advk_pcie *pcie)
>  	return ret;
>  }
>  
> +static int __maybe_unused advk_pcie_suspend(struct device *dev)
> +{
> +	struct advk_pcie *pcie = dev_get_drvdata(dev);
> +
> +	advk_pcie_disable_phy(pcie);
> +
> +	clk_disable_unprepare(pcie->clk);

I have noticed it is common practice, still, I would like to check whether
it is allowed to call functions that may sleep in a NOIRQ suspend/resume
callback ?

Thanks,
Lorenzo

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused advk_pcie_resume(struct device *dev)
> +{
> +	struct advk_pcie *pcie = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(pcie->clk);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Empirical delay needed after enabling the clock and before
> +	 * accessing any register.
> +	 */
> +	msleep(10);
> +
> +	ret = advk_pcie_enable_phy(pcie);
> +	if (ret)
> +		return ret;
> +
> +	advk_pcie_hard_reset(pcie);
> +
> +	advk_pcie_setup_hw(pcie);
> +
> +	advk_sw_pci_bridge_init(pcie);
> +
> +	return 0;
> +}
> +
> +/*
> + * The PCI core will try to reconfigure the bus quite early in the resume path.
> + * We must use the _noirq() alternatives to ensure the controller is ready when
> + * the core uses the ->read()/->write() callbacks.
> + */
> +static const struct dev_pm_ops advk_pcie_dev_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(advk_pcie_suspend,
> +				      advk_pcie_resume)
> +};
> +
>  static int advk_pcie_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1188,6 +1237,8 @@ static int advk_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dev_set_drvdata(dev, pcie);
> +
>  	return 0;
>  }
>  
> @@ -1200,6 +1251,7 @@ static struct platform_driver advk_pcie_driver = {
>  	.driver = {
>  		.name = "advk-pcie",
>  		.of_match_table = advk_pcie_of_match_table,
> +		.pm = &advk_pcie_dev_pm_ops,
>  		/* Driver unloading/unbinding currently not supported */
>  		.suppress_bind_attrs = true,
>  	},
> -- 
> 2.19.1
> 
