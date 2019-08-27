From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/10] dt-bindings: PCI: Add the pf-offset property
Date: Tue, 27 Aug 2019 11:26:47 -0500
Message-ID: <20190827162647.GA21347@bogus>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-8-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190815083716.4715-8-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, 15 Aug 2019 16:37:14 +0800, Xiaowei Bao wrote:
> Add the pf-offset property for multiple PF.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
