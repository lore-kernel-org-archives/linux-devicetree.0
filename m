From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: qcom: Add support for IPQ4019 PCIe controller
Date: Tue, 23 May 2017 15:07:19 -0500
Message-ID: <20170523200719.GG7241@bhelgaas-glaptop.roam.corp.google.com>
References: <20170505152524.29337-1-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170505152524.29337-1-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stanimir?

On Fri, May 05, 2017 at 05:25:24PM +0200, John Crispin wrote:
> Add support for the IPQ4019 PCIe controller. IPQ4019 supports Gen
> 1/2, one lane, one PCIe root complex with support for MSI and legacy
> interrupts, and it conforms to PCI Express Base 2.1 specification.
> 
> The core init is the sames as for the MSM8996, however the clocks and
> reset lines differ.
> 
> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt          |  20 +-
>  drivers/pci/host/pcie-qcom.c                       | 304 +++++++++++++++++++++

pcie-qcom.c was recently moved to drivers/pci/dwc, but I was able to
apply this by hand pretty easily.  But I would like Stanimir's ack
first.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
