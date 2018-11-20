From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv4 0/3] dts: Add the property of IB and OB
Date: Tue, 20 Nov 2018 17:30:34 +0000
Message-ID: <20181120173021.GA29331@e107981-ln.cambridge.arm.com>
References: <20171110034847.17891-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171110034847.17891-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bao Xiaowei <xiaowei.bao@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, bhelgaas@google.com, shawnguo@kernel.org, madalin.bucur@nxp.com, sumit.garg@nxp.com, yangbo.lu@nxp.com, hongtao.jia@nxp.com, Yuantian.Tang@nxp.com, leoyang.li@nxp.com, kishon@ti.com, jingoohan1@gmail.com, pbrobinson@gmail.com, songxiaowei@hisilicon.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, Minghuan.Lian@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 10, 2017 at 11:48:44AM +0800, Bao Xiaowei wrote:
> Depend on http://patchwork.ozlabs.org/patch/815382/
> 
> Bao Xiaowei (3):
>   ARMv8: dts: ls1046a: add the property of IB and OB
>   ARMv8: layerscape: add the pcie ep function support
>   ARMv8: pcie: make the DWC EP driver support for layerscape
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   6 ++
>  drivers/pci/dwc/Kconfig                        |   1 +
>  drivers/pci/dwc/pci-layerscape.c               | 121 +++++++++++++++++++++++--
>  3 files changed, 121 insertions(+), 7 deletions(-)

Can I drop this series from the linux-pci patch queue ? I reckon
it is superseded by:

https://patchwork.ozlabs.org/patch/992928/

but I wanted to make sure that's the case, I really can't follow
the version numbering so I am asking.

Thanks,
Lorenzo
