From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/10] PCI: dwc: artpec6: add support for the ARTPEC-7 SoC
Date: Tue, 17 Oct 2017 17:25:31 -0500
Message-ID: <20171017222531.svoanlsnpxr4pi7f@rob-hp-laptop>
References: <20171013160914.3220-1-niklas.cassel@axis.com>
 <20171013160914.3220-11-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013160914.3220-11-niklas.cassel@axis.com>
Sender: linux-pci-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Niklas Cassel <niklass@axis.com>, Jesper Nilsson <jespern@axis.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@axis.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 06:09:13PM +0200, Niklas Cassel wrote:
> The ARTPEC-6 SoC and the ARTPEC-7 SoC are very similar.
> Unfortunately, some fields in the PCIECFG and PCIESTAT
> register have changed.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
> ---
>  .../devicetree/bindings/pci/axis,artpec6-pcie.txt  |   2 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pci/dwc/pcie-artpec6.c                     | 162 ++++++++++++++++++++-
>  2 files changed, 161 insertions(+), 3 deletions(-)
