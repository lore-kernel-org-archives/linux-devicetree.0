From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/4] dt-binding: irq: imx-irqsteer: use irq number
 instead  of group number
Date: Fri, 22 Feb 2019 11:37:38 -0600
Message-ID: <20190222173738.GA2168@bogus>
References: <1550662447-8565-1-git-send-email-aisheng.dong@nxp.com>
 <1550662447-8565-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550662447-8565-2-git-send-email-aisheng.dong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 11:40:40 +0000, Aisheng Dong wrote:
> Not all 64 interrupts may be used in one group. e.g. most irqsteer in
> imx8qxp and imx8qm subsystems supports only 32 interrupts.
> 
> As the IP integration parameters are Channel number and interrupts number,
> let's use fsl,irqs-num to represents how many interrupts supported
> by this irqsteer channel.
> 
> Note this will break the compatibility of old binding. As the original
> fsl,irq-groups was born out of a misunderstanding of the HW config
> options and we are not aware of any users of the current binding.
> And the old binding was just published in recent months, so it's
> worth to change now to avoid confusing in the future.
> 
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v3->v4:
>  * add more commit messages to describe the compatibility break
> v2->v3:
>  * no changes
> v1->v2:
>  * change property name fsl,irqs-per-chan to fsl,num-irqs.
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
