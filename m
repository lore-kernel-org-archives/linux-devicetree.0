From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 03/27] PCI: mobiveil: correct the returned error number
Date: Tue, 5 Feb 2019 11:23:17 +0530
Message-ID: <CAFZiPx0wjqHFbu_b9cphSfsbBSU9W6Nupn6QS6R9MgmO_S0Vnw@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
 <20190129080926.36773-4-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129080926.36773-4-Zhiqiang.Hou@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>

On Tue, Jan 29, 2019 at 1:38 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> This patch corrected the returned error number by convention,
> and removed a unnecessary error check.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V3:
>  - No change
>
>  drivers/pci/controller/pcie-mobiveil.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index b87471f08a40..563210e731d3 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -819,7 +819,7 @@ static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
>
>         if (!pcie->intx_domain) {
>                 dev_err(dev, "Failed to get a INTx IRQ domain\n");
> -               return -ENODEV;
> +               return -ENOMEM;
>         }
>
>         raw_spin_lock_init(&pcie->intx_mask_lock);
> @@ -845,11 +845,9 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>         /* allocate the PCIe port */
>         bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
>         if (!bridge)
> -               return -ENODEV;
> +               return -ENOMEM;
>
>         pcie = pci_host_bridge_priv(bridge);
> -       if (!pcie)
> -               return -ENOMEM;
>
>         pcie->pdev = pdev;
>
> @@ -866,7 +864,7 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>                                                     &pcie->resources, &iobase);
>         if (ret) {
>                 dev_err(dev, "Getting bridge resources failed\n");
> -               return -ENOMEM;
> +               return ret;
>         }
>
>         /*
> --
> 2.17.1
>
