Return-Path: <SRS0=JSor=FX=linaro.org=shawn.guo@kernel.org>
Date: Thu, 1 Mar 2018 09:22:46 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 0/2] Add power control for pcie-histb driver
Message-ID: <20180301012241.GA28619@dragon>
References: <1516722337-1533-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516722337-1533-1-git-send-email-shawn.guo@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jianguo Sun <sunjianguo1@huawei.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 23, 2018 at 11:45:35PM +0800, Shawn Guo wrote:
> The first patch is a small fix which is useful for the second one.
> This version basically follows Fabio's suggestion to reimplement the
> first version patch, using a regulator that can be backed by GPIO to
> control the power to PCIe port.
> 
> Shawn Guo (2):
>   PCI: histb: fix error path of histb_pcie_host_enable()
>   PCI: histb: add an optional regulator for PCIe port power control
> 
>  .../bindings/pci/hisilicon-histb-pcie.txt          |  1 +
>  drivers/pci/dwc/pcie-histb.c                       | 28 ++++++++++++++++++----
>  2 files changed, 25 insertions(+), 4 deletions(-)

Hi Bjorn,

Did you get a chance to look at the series?

Shawn
