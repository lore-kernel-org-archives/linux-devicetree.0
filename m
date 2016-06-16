From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/2] nxp/dts: add pcie aer interrupt-name property in
 the dts
Date: Thu, 16 Jun 2016 08:36:27 +0800
Message-ID: <20160616003627.GJ20243@tiger>
References: <1464242406-20203-1-git-send-email-po.liu@nxp.com>
 <1465892645-32381-1-git-send-email-po.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465892645-32381-1-git-send-email-po.liu@nxp.com>
Sender: linux-pci-owner@vger.kernel.org
To: Po Liu <po.liu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Roy Zang <roy.zang@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>, Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 04:24:04PM +0800, Po Liu wrote:
> NXP some platforms aer interrupt was not MSI/MSI-X/INTx
> but using interrupt line independently. This patch add a "aer"
> interrupt-names for aer interrupt.
> 
> Signed-off-by: Po Liu <po.liu@nxp.com>
> ---
> changes for v3:
> 	- None;
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt         |  4 ++--

The bindings shouldn't be part of dts patch but the driver patch who
is actually using it.

Shawn

>  arch/arm/boot/dts/ls1021a.dtsi                         |  6 ++++--
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi         | 18 +++++++++---------
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi         | 16 ++++++++--------
>  4 files changed, 23 insertions(+), 21 deletions(-)
