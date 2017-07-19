From: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 7/7] PCI: dwc: qcom: Add support for IPQ8074 PCIe
 controller
Date: Wed, 19 Jul 2017 12:19:50 +0530
Message-ID: <20170719064943.GA29996@codeaurora.org>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-8-git-send-email-varada@codeaurora.org>
 <20170717220718.GZ20973@minitux>
 <20170718095814.GE32439@codeaurora.org>
 <20170718164438.GE20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170718164438.GE20973@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, smuthayy <smuthayy-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 09:44:38AM -0700, Bjorn Andersson wrote:
> On Tue 18 Jul 02:58 PDT 2017, Varadarajan Narayanan wrote:
>
> > On Mon, Jul 17, 2017 at 03:07:18PM -0700, Bjorn Andersson wrote:
> > > On Mon 17 Jul 05:04 PDT 2017, Varadarajan Narayanan wrote:
> [..]
> > >
> > > Can you confirm that this is actually version 4 of this block? Or are we
> > > just incrementing an arbitrary number here?
> >
> > This is not exactly the 4th version of the block. However, it is
> > a different version than the ones that are already supported in
> > this driver. Since the existing driver didn't exactly tie it with
> > the block IP version, I too followed the same versioning
> > convention.
> >
>
> Do you have a block IP version that you could base your numbering on, to
> break the trend? (We should go back and fix up the others as well)

Presently, the driver supports the ipq8064, apq8064, apq8084,
msm8996, ipq4019 and ipq8074. The SoCs, qcom_pcie_ops version and
the block IP versions are as follows.

	ipq8064 - v0 - 2.1.0
	apq8064 - v0 - 2.1.0
	apq8084 - v1 - 1.0.0
	msm8996 - v2 - 2.3.2
	ipq4019 - v3 - 2.4.0
	ipq8074 - v4 - 2.3.3

I will rename the qcom_pcie_ops structure and related functions
with the block IP version instead of vX numbering and post the
patch.

> [..]
> > > > +static int qcom_pcie_enable_resources_v4(struct qcom_pcie *pcie)
> > > > +{
> > > > +	struct qcom_pcie_resources_v4 *res = &pcie->res.v4;
> > > > +	struct dw_pcie *pci = pcie->pci;
> > > > +	struct device *dev = pci->dev;
> > > > +	int ret;
> > > > +
> > > > +	ret = clk_prepare_enable(res->sys_noc_clk);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "cannot prepare/enable core clock\n");
> > > > +		return ret;
> > > > +	}
> > >
> > > Should these clocks really be handled explicitly in the driver? Are
> > > these not the bus clocks, to be handled by "msm_bus"?
> >
> > This not the bus clock. This clock is for the Bus Interface Unit
> > between the PCIe module and the System NOC.
> >
>
> Right, that was the piece I meant. Sorry for not using the right
> nomenclature.
>
> So then it would be handled by the msm_bus in the downstream kernel?
>
>
> Perhaps we can merge it like this and once we have the interconnect
> framework setup we can make this the fallback method.

Agree that this has to be handled by the interconnect framework.
For now will rename this as "iface" similar to v0 and v1.

Thanks
Varada

> Thanks,
> Bjorn

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
