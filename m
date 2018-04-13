Return-Path: <robherring2@gmail.com>
Date: Fri, 13 Apr 2018 12:22:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] pcie-rcar: add R-Car gen3 PHY support
Message-ID: <20180413172244.ceixi5lhl2tygsfk@rob-hp-laptop>
References: <26e803ca-06b6-28c5-b87c-fc639b322d6f@cogentembedded.com>
 <3eb7e548-8b21-2347-c742-a007fd9cfed9@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eb7e548-8b21-2347-c742-a007fd9cfed9@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 08, 2018 at 09:05:10PM +0300, Sergei Shtylyov wrote:
> On R-Car gen3 SoCs the PCIe PHY has its own register region -- and I have
> written  a generic PHY driver for it, thus we need to add the corresponding
> code in  rcar_pcie_hw_init_gen3() and call devm_phy_optional_get() at the
> driver's probing time,  so that the existing R-Car gen3 device trees (not
> having a PHY node) would still work (we only need  to power up the PHY on
> R-Car V3H).

Spurious spaces, again...

> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - updated the bindings.
> 
>  Documentation/devicetree/bindings/pci/rcar-pci.txt |    5 +++

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/pci/host/pcie-rcar.c                       |   27 +++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
