From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: add DT binding for the layerscape PCIe
 GEN4 controller with EP mode
Date: Thu, 28 Feb 2019 13:45:26 -0600
Message-ID: <20190228194526.GA2716@bogus>
References: <20190218094643.2692-1-xiaowei.bao@nxp.com>
 <20190218094643.2692-2-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190218094643.2692-2-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bhelgaas@google.com, Zhiqiang.Hou@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, gregkh@linuxfoundation.org, l.subrahmanya@mobiveil.co.in, arnd@arndb.de, Minghuan.Lian@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, 18 Feb 2019 17:46:39 +0800, Xiaowei Bao wrote:
> Add the documentation for the Device Tree binding for the layerscape
> PCIe GEN4 controller with EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> depends on: http://patchwork.ozlabs.org/project/linux-pci/list/?series=88754
> 
>  .../bindings/pci/layerscape-pci-gen4.txt           |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
