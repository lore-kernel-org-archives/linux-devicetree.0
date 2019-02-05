From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 10/27] PCI: mobiveil: fix the INTx process error
Date: Tue, 5 Feb 2019 11:41:25 +0530
Message-ID: <CAFZiPx3niFC67o-p_NRi-ReuWYDcSJqUWmVfqKj+R2LnzAMPFA@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
 <20190129080926.36773-11-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129080926.36773-11-Zhiqiang.Hou@nxp.com>
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

On Tue, Jan 29, 2019 at 1:39 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> In the loop block, there is not code change the loop key,
> this patch updated the loop key by re-read the INTx status
> register.
>
> This patch also change to clear the handled INTx status.
>
> Note: Need MV to test this fix.
>
> Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host
> Bridge IP driver")
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V3:
>  - No change
>
>  drivers/pci/controller/pcie-mobiveil.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 4ba458474e42..78e575e71f4d 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -361,6 +361,7 @@ static void mobiveil_pcie_isr(struct irq_desc *desc)
>         /* Handle INTx */
>         if (intr_status & PAB_INTP_INTX_MASK) {
>                 shifted_status = csr_readl(pcie, PAB_INTP_AMBA_MISC_STAT);
> +               shifted_status &= PAB_INTP_INTX_MASK;
>                 shifted_status >>= PAB_INTX_START;
>                 do {
>                         for_each_set_bit(bit, &shifted_status, PCI_NUM_INTX) {
> @@ -372,12 +373,16 @@ static void mobiveil_pcie_isr(struct irq_desc *desc)
>                                         dev_err_ratelimited(dev, "unexpected IRQ, INT%d\n",
>                                                             bit);
>
> -                               /* clear interrupt */
> -                               csr_writel(pcie,
> -                                          shifted_status << PAB_INTX_START,
> +                               /* clear interrupt handled */
> +                               csr_writel(pcie, 1 << (PAB_INTX_START + bit),
>                                            PAB_INTP_AMBA_MISC_STAT);
>                         }
> -               } while ((shifted_status >> PAB_INTX_START) != 0);
> +
> +                       shifted_status = csr_readl(pcie,
> +                                                  PAB_INTP_AMBA_MISC_STAT);
> +                       shifted_status &= PAB_INTP_INTX_MASK;
> +                       shifted_status >>= PAB_INTX_START;
> +               } while (shifted_status != 0);
>         }
>
>         /* read extra MSI status register */
> --
> 2.17.1
>
