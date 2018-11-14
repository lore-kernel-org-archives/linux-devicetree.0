From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCH 15/23] dt-bindings: pci: mobiveil: change gpio_slave and
 apb_csr to optional
Date: Wed, 14 Nov 2018 15:03:26 +0530
Message-ID: <CAFZiPx270bWemYRekvk1BZ23RW3ecK+znEc6C1Dix_U-2y+cnA@mail.gmail.com>
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com> <20181106131807.29951-16-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106131807.29951-16-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, Leo Li <leoyang.li@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, xiaowei.bao@nxp.com
List-Id: devicetree@vger.kernel.org

Acked-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>

On Tue, Nov 6, 2018 at 6:50 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> Change the "gpio_slave" and "apb_csr" to optional, the "gpio_slave"
> is not used in current code, and "apb_csr" is not used by some
> platorms.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/mobiveil-pcie.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> index a618d4787dd7..64156993e052 100644
> --- a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> @@ -10,8 +10,10 @@ Required properties:
>         interrupt source. The value must be 1.
>  - compatible: Should contain "mbvl,gpex40-pcie"
>  - reg: Should contain PCIe registers location and length
> +       Mandatory:
>         "config_axi_slave": PCIe controller registers
>         "csr_axi_slave"   : Bridge config registers
> +       Optional:
>         "gpio_slave"      : GPIO registers to control slot power
>         "apb_csr"         : MSI registers
>
> --
> 2.17.1
>
