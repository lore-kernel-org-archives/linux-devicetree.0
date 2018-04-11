From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH v2 7/9] PCI: dwc: Replace lower into upper case characters
Date: Tue, 10 Apr 2018 20:05:59 -0400
Message-ID: <000001d3d128$dfa4e8a0$9eeeb9e0$@gmail.com>
References: <cover.1523266508.git.gustavo.pimentel@synopsys.com> <a28d463d04b198f51c64c1a7eb5b3f77da2d4ab9.1523266508.git.gustavo.pimentel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a28d463d04b198f51c64c1a7eb5b3f77da2d4ab9.1523266508.git.gustavo.pimentel@synopsys.com>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Gustavo Pimentel' <gustavo.pimentel@synopsys.com>, bhelgaas@google.com, lorenzo.pieralisi@arm.com, Joao.Pinto@synopsys.com, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday, April 9, 2018 5:41 AM, Gustavo Pimentel wrote:
> 
> Replaces lower into upper case characters in comments and debug printks.
> 
> This is an attempt to keep the messages coherent within the designware
> driver.
> 
> Also fixed code style on dw_pcie_irq_domain_free function.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>


> ---
> Change v1->v2:
> - Added an extra log description line about code style following Fabio
> Estevam suggestion.
> 
>  drivers/pci/dwc/pcie-designware-ep.c   | 16 ++++++++--------
>  drivers/pci/dwc/pcie-designware-host.c | 35 ++++++++++++++++++-----------
> -----
>  drivers/pci/dwc/pcie-designware.c      | 22 ++++++++++-----------
>  3 files changed, 38 insertions(+), 35 deletions(-)
> 

[.....]
