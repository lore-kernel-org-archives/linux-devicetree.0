From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 7/7] PCI: dwc: qcom: Add support for IPQ8074 PCIe
 controller
Date: Tue, 18 Jul 2017 09:44:38 -0700
Message-ID: <20170718164438.GE20973@minitux>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-8-git-send-email-varada@codeaurora.org>
 <20170717220718.GZ20973@minitux>
 <20170718095814.GE32439@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718095814.GE32439@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, svarbanov@mm-sol.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, smuthayy <smuthayy@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue 18 Jul 02:58 PDT 2017, Varadarajan Narayanan wrote:

> On Mon, Jul 17, 2017 at 03:07:18PM -0700, Bjorn Andersson wrote:
> > On Mon 17 Jul 05:04 PDT 2017, Varadarajan Narayanan wrote:
[..]
> >
> > Can you confirm that this is actually version 4 of this block? Or are we
> > just incrementing an arbitrary number here?
> 
> This is not exactly the 4th version of the block. However, it is
> a different version than the ones that are already supported in
> this driver. Since the existing driver didn't exactly tie it with
> the block IP version, I too followed the same versioning
> convention.
> 

Do you have a block IP version that you could base your numbering on, to
break the trend? (We should go back and fix up the others as well)

[..]
> > > +static int qcom_pcie_enable_resources_v4(struct qcom_pcie *pcie)
> > > +{
> > > +	struct qcom_pcie_resources_v4 *res = &pcie->res.v4;
> > > +	struct dw_pcie *pci = pcie->pci;
> > > +	struct device *dev = pci->dev;
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(res->sys_noc_clk);
> > > +	if (ret) {
> > > +		dev_err(dev, "cannot prepare/enable core clock\n");
> > > +		return ret;
> > > +	}
> >
> > Should these clocks really be handled explicitly in the driver? Are
> > these not the bus clocks, to be handled by "msm_bus"?
> 
> This not the bus clock. This clock is for the Bus Interface Unit
> between the PCIe module and the System NOC.
> 

Right, that was the piece I meant. Sorry for not using the right
nomenclature.

So then it would be handled by the msm_bus in the downstream kernel?


Perhaps we can merge it like this and once we have the interconnect
framework setup we can make this the fallback method.

Thanks,
Bjorn
