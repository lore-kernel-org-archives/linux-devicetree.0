From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/9] irqchip/ls-scfg-msi: add LS1046a MSI support
Date: Tue, 3 Jan 2017 11:44:47 -0600
Message-ID: <20170103174447.cy4b7nafea7s4hwf@rob-hp-laptop>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
 <1482829985-24421-7-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482829985-24421-7-git-send-email-Minghuan.Lian@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Minghuan Lian <Minghuan.Lian@nxp.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Roy Zang <roy.zang@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Stuart Yoder <stuart.yoder@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Scott Wood <scott.wood@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 05:13:03PM +0800, Minghuan Lian wrote:
> LS1046a includes 4 MSIRs, each MSIR is assigned a dedicate GIC
> SPI interrupt and provides 32 MSI interrupts. Compared to previous
> MSI, LS1046a's IBS(interrupt bit select) shift is changed to 2 and
> total MSI interrupt number is changed to 128.
> 
> The patch adds structure 'ls_scfg_msir' to describe MSIR setting and
> 'ibs_shift' to store the different value between the SoCs.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
>  .../interrupt-controller/fsl,ls-scfg-msi.txt       |   2 +-
>  drivers/irqchip/irq-ls-scfg-msi.c                  | 161 ++++++++++++++++-----
>  2 files changed, 127 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> index 54597b0..dde4552 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> @@ -6,7 +6,7 @@ Required properties:
>  	      Layerscape PCIe MSI controller block such as:
>                "fsl,ls1021a-msi"
>                "fsl,ls1043a-msi"
> -	      "fsl,ls1046a-msi"
> +              "fsl,ls1046a-msi"

This hunk goes in the previous patch...

>  - msi-controller: indicates that this is a PCIe MSI controller node
>  - reg: physical base address of the controller and length of memory mapped.
>  - interrupts: an interrupt to the parent interrupt controller.
