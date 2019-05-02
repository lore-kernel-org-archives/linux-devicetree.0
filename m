From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/3] PCI: qcom: Use clk_bulk API for 2.4.0 controllers
Date: Thu, 2 May 2019 08:00:06 -0700
Message-ID: <20190502150006.GL2938@tuxbook-pro>
References: <20190502001955.10575-1-bjorn.andersson@linaro.org>
 <20190502001955.10575-2-bjorn.andersson@linaro.org>
 <20190502115351.GM3845@vkoul-mobl.Dlink>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502115351.GM3845@vkoul-mobl.Dlink>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 02 May 04:53 PDT 2019, Vinod Koul wrote:
> On 01-05-19, 17:19, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 0ed235d560e3..d740cbe0e56d 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -112,10 +112,10 @@ struct qcom_pcie_resources_2_3_2 {
> >  	struct regulator_bulk_data supplies[QCOM_PCIE_2_3_2_MAX_SUPPLY];
> >  };
> >  
> > +#define QCOM_PCIE_2_4_0_MAX_CLOCKS	3
> 
> empty line after the define please
> 

This follows the style of QCOM_PCIE_2_3_2_MAX_SUPPLY one block up, so
I think this is the way we want it.

> >  struct qcom_pcie_resources_2_4_0 {
[..]
> 
> 
> rest lgtm:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 

Thanks!

Regards,
Bjorn
