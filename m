From: atull <atull@opensource.altera.com>
Subject: Re: [PATCHv2 3/3] fpga manager: Adding FPGA Manager support for
 Xilinx Zynq 7000
Date: Thu, 22 Oct 2015 12:56:51 -0500
Message-ID: <alpine.DEB.2.02.1510221247360.23148@linuxheads99>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com> <1445035350-3569-4-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445035350-3569-4-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Oct 2015, Moritz Fischer wrote:

Hi Moritz,

I just noticed a problem regarding private data.  Fortunately
it is easy to fix.  See below...

> +static int zynq_fpga_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct zynq_fpga_priv *priv;
> +	struct resource *res;
> +	int err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);

fpga-mgr.c uses drvdata for its struct fpga_manager, so this will
get overwritten.  So remove this platform_set_drvdata().  priv
is saved in struct fpga_manager during fpga_mgr_register().

...

> +static int zynq_fpga_remove(struct platform_device *pdev)
> +{

Here you can get a pointer to priv from the fpga_manager struct:
        struct fpga_manager *mgr = platform_get_drvdata(pdev);
        struct zynq_fpga_priv *priv = mgr->priv;

Alan

> +	struct zynq_fpga_priv *priv;
> +
> +	fpga_mgr_unregister(&pdev->dev);
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
