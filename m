Return-Path: <SRS0=Rw9b=HW=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v3 3/5] pcie-rcar: add R-Car gen3 PHY support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <b98130a7-b128-9fc3-aee1-1a5a2590b320@cogentembedded.com>
 <def3b364-088b-3fcc-47ab-bcb0838b8fe4@cogentembedded.com>
Message-ID: <a3495bc2-978a-04d5-e9b8-a21b9ecfc019@cogentembedded.com>
Date: Thu, 3 May 2018 22:50:40 +0300
MIME-Version: 1.0
In-Reply-To: <def3b364-088b-3fcc-47ab-bcb0838b8fe4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 05/03/2018 10:40 PM, Sergei Shtylyov wrote:

> On R-Car gen3 SoCs the PCIe PHY has its own register region -- and I have
> written a generic PHY driver for it, thus we need to add the corresponding
> code in rcar_pcie_hw_init_gen3() and call devm_phy_optional_get() at the
> driver's probing time, so that the existing R-Car gen3 device trees (not
> having a PHY node) would still work (we only need to power up the PHY on
> R-Car V3H).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

   Oops, forgot to add Rob's tag:

Reviewed-by: Rob Herring <robh@kernel.org>

MBR, Sergei
