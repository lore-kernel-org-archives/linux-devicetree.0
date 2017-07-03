From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 01/14] qcom: mtd: nand: Add driver data for QPIC DMA
Date: Mon, 3 Jul 2017 21:41:50 +0200
Message-ID: <20170703214150.6a7b3f38@bbrezillon>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
        <1498720566-20782-2-git-send-email-absahu@codeaurora.org>
        <bd6add74-4f42-5036-3513-2e672ef97b15@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <bd6add74-4f42-5036-3513-2e672ef97b15@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Mon, 3 Jul 2017 10:08:32 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> On 06/29/2017 12:45 PM, Abhishek Sahu wrote:
> > The current driver only support EBI2 NAND which uses ADM DMA. The
> > latest QCOM controller supports QPIC NAND which uses BAM DMA. NAND
> > registers and programming sequence are same for EBI2 and QPIC
> > NAND so the same driver can support QPIC NAND also by adding the
> > BAM DMA support. This patch adds the QPIC NAND support in current
> > NAND driver with compatible string "qcom,qpic-nandc-v1.4.0" and
> > maps it with different configuration parameter in driver data.
> > 
> > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > ---
> >   .../devicetree/bindings/mtd/qcom_nandc.txt         | 41 +++++++++++++++++++++-
> >   drivers/mtd/nand/qcom_nandc.c                      | 37 ++++++++++++++++---
> >   2 files changed, 73 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> > index 70dd511..5d0f7ae 100644
> > --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> > +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> > @@ -1,7 +1,9 @@
> >   * Qualcomm NAND controller
> >   
> >   Required properties:
> > -- compatible:		should be "qcom,ipq806x-nand"  
> 
> Since you're changing the compatible string, could you mention in the commit message that
> it's okay to do so since there aren't any upstream dtsi files using this binding?

Yep. I was going to ask about backward compat, but I guess it's fine if
there's no user in mainline yet, just mention it in the commit message
as suggested by Archit.

> 
> > +- compatible:		must be one of the following:
> > +	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.  
> 
> Are we sure that all EBI2 based NAND controllers would work by this single binding?
> Should we put a version here too like we've done for QPIC?
> 
> > +	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA like IPQ4019.
> >   - reg:			MMIO address range
> >   - clocks:		must contain core clock and always on clock
> >   - clock-names:		must contain "core" for the core clock and "aon" for the
> > @@ -84,3 +86,40 @@ nand@1ac00000 {
> >   		};
> >   	};
> >   };
> > +
> > +nand@79b0000 {

nand-controller@xxxx {

BTW, glad to see another driver moving to the new DT representation :-).

> > +	compatible = "qcom,qpic-nandc-v1.4.0";
> > +	reg = <0x79b0000 0x1000>;
> > +
> > +	clocks = <&gcc GCC_QPIC_CLK>,
> > +		<&gcc GCC_QPIC_AHB_CLK>;
> > +	clock-names = "core", "aon";
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	nandcs@0 {

	nand@0 {

> > +		compatible = "qcom,nandcs";

Why do you need a compatible here?

> > +		reg = <0>;
> > +
> > +		nand-ecc-strength = <4>;
> > +		nand-ecc-step-size = <512>;
> > +		nand-bus-width = <8>;
> > +
> > +		partitions {
> > +			compatible = "fixed-partitions";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			partition@0 {
> > +				label = "boot-nand";
> > +				reg = <0 0x58a0000>;
> > +			};
> > +
> > +			partition@58a0000 {
> > +				label = "fs-nand";
> > +				reg = <0x58a0000 0x4000000>;
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> > index 57d483a..f55f728 100644
> > --- a/drivers/mtd/nand/qcom_nandc.c
> > +++ b/drivers/mtd/nand/qcom_nandc.c
> > @@ -1,5 +1,5 @@
> >   /*
> > - * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
> >    *
> >    * This software is licensed under the terms of the GNU General Public
> >    * License version 2, as published by the Free Software Foundation, and
> > @@ -234,6 +234,8 @@ struct nandc_regs {
> >    * @cmd1/vld:			some fixed controller register values
> >    * @ecc_modes:			supported ECC modes by the current controller,
> >    *				initialized via DT match data
> > + * @dma_bam_enabled:		flag to tell whether nand controller is using
> > + *				bam dma
> >    */
> >   struct qcom_nand_controller {
> >   	struct nand_hw_control controller;
> > @@ -253,6 +255,7 @@ struct qcom_nand_controller {
> >   	struct list_head desc_list;
> >   
> >   	u8		*data_buffer;
> > +	bool		dma_bam_enabled;
> >   	int		buf_size;
> >   	int		buf_count;
> >   	int		buf_start;
> > @@ -316,6 +319,17 @@ struct qcom_nand_host {
> >   	u32 clrreadstatus;
> >   };
> >   
> > +/*
> > + * This data type corresponds to the nand driver data which will be used at
> > + * driver probe time
> > + * @ecc_modes - ecc mode for nand
> > + * @dma_bam_enabled - whether this driver is using bam
> > + */
> > +struct qcom_nand_driver_data {
> > +	u32 ecc_modes;
> > +	bool dma_bam_enabled;
> > +};
> > +
> >   static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
> >   {
> >   	return container_of(chip, struct qcom_nand_host, chip);
> > @@ -2073,6 +2087,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
> >   	struct device_node *dn = dev->of_node, *child;
> >   	struct resource *res;
> >   	int ret;
> > +	const struct qcom_nand_driver_data *driver_data;
> >   
> >   	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
> >   	if (!nandc)
> > @@ -2087,7 +2102,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
> >   		return -ENODEV;
> >   	}
> >   
> > -	nandc->ecc_modes = (unsigned long)dev_data;
> > +	driver_data = (const struct qcom_nand_driver_data *)dev_data;

Cast is unneeded here.

> > +
> > +	nandc->ecc_modes = driver_data->ecc_modes;
> > +	nandc->dma_bam_enabled = driver_data->dma_bam_enabled;

Why don't you store a pointer to the driver data object in your nandc
struct?

> >   
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	nandc->base = devm_ioremap_resource(dev, res);
> > @@ -2179,15 +2197,26 @@ static int qcom_nandc_remove(struct platform_device *pdev)
> >   	return 0;
> >   }
> >   
> > -#define EBI2_NANDC_ECC_MODES	(ECC_RS_4BIT | ECC_BCH_8BIT)
> >   
> > +static const struct qcom_nand_driver_data ebi2_nandc_data = {
> > +	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
> > +	.dma_bam_enabled = false,
> > +};
> > +
> > +static const struct qcom_nand_driver_data qpic_nandc_v1_4_0_data = {
> > +	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
> > +	.dma_bam_enabled = true,
> > +};

This patch should be split in 2 IMO:
1/ introduce the qcom_nand_driver_data struct (which I'd prefer to call
qcom_nand_controller_caps, or something like that) and use it for the
existing compatible
2/ add the new compat with its own set of capabilities.

> >   /*
> >    * data will hold a struct pointer containing more differences once we support
> >    * more controller variants
> >    */
> >   static const struct of_device_id qcom_nandc_of_match[] = {
> >   	{	.compatible = "qcom,ipq806x-nand",  
> 
> Please make sure that you update the compatible string above too.
> 
> Thanks,
> Archit
> 
> > -		.data = (void *)EBI2_NANDC_ECC_MODES,
> > +		.data = (void *)&ebi2_nandc_data,

Cast unneeded.

> > +	},
> > +	{	.compatible = "qcom,qpic-nandc-v1.4.0",
> > +		.data = (void *)&qpic_nandc_v1_4_0_data,

Ditto.

> >   	},
> >   	{}
> >   };
> >   
> 
