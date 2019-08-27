From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: PCI: Add Amazon's Annapurna Labs
 PCIe host bridge binding
Date: Tue, 27 Aug 2019 13:53:58 -0500
Message-ID: <20190827185358.GA23134@bogus>
References: <20190821153545.17635-1-jonnyc@amazon.com>
 <20190821154745.31834-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821154745.31834-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, andrew.murray@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

On Wed, 21 Aug 2019 18:47:43 +0300, Jonathan Chocron wrote:
> Document Amazon's Annapurna Labs PCIe host bridge.
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  .../devicetree/bindings/pci/pcie-al.txt       | 46 +++++++++++++++++++
>  MAINTAINERS                                   |  3 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
