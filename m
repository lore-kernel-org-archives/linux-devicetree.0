From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 14/27] PCI: mobiveil: initialize Primary/Secondary/Subordinate
 bus number
Date: Fri, 8 Feb 2019 18:01:48 +0530
Message-ID: <CAFZiPx3qPHWfyz8R1xhsvZyS40WdyWGCZzSd8xgcQ3q+H9WCYQ@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com> <20190129080926.36773-15-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129080926.36773-15-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 1:40 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> The reset value is all zero, so set a workable value for Primary,
> Secondary and Subordinate bus numbers.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V3:
>  - No change
>
>  drivers/pci/controller/pcie-mobiveil.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index db7ecb021c63..9210165fe8c0 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -582,6 +582,12 @@ static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>         u32 value, pab_ctrl, type;
>         struct resource_entry *win;
>
> +       /* setup bus numbers */
> +       value = csr_readl(pcie, PCI_PRIMARY_BUS);
> +       value &= 0xff000000;
> +       value |= 0x00ff0100;
> +       csr_writel(pcie, value, PCI_PRIMARY_BUS);
> +
>         /*
>          * program Bus Master Enable Bit in Command Register in PAB Config
>          * Space
> --
> 2.17.1
>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
