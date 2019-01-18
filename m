From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/4] dt-binding: irq: imx-irqsteer: use irq number per
 channel instead of group number
Date: Fri, 18 Jan 2019 09:39:17 +0000
Message-ID: <45c7e5b6-26bb-81b1-093b-96312a1788ec@arm.com>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
 <1547797668-30342-2-git-send-email-aisheng.dong@nxp.com>
 <1547801291.2626.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547801291.2626.3.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 18/01/2019 08:48, Lucas Stach wrote:
> Am Freitag, den 18.01.2019, 07:53 +0000 schrieb Aisheng Dong:
>> Not all 64 interrupts may be used in one group. e.g. most irqsteer in
>> imx8qxp and imx8qm subsystems supports only 32 interrupts.
>>
>> As the IP integration parameters are Channel number and interrupts number,
>> let's use fsl,irqs-per-chan to represents how many interrupts supported
>> by this irqsteer channel.
> 
> Sorry, but total NACK. I've got to great lengths with dumping the
> actually implemented register layout on i.MX8M and AFAICS the IRQs are
> always managed in groups of 64 IRQs, even if less than that are
> connected as input IRQs. This is what the actually present register set
> on i.MX8M tells us.

Also, I'd really like the DT bindings not to change at every release. So
whatever change (if any) has to be done for this driver to support
existing HW, please make sure that the DT bindings are kept as stable as
possible.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
