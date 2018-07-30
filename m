From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/9] Add Reset Controller support for Actions Semi Owl
 SoCs
Date: Mon, 30 Jul 2018 20:41:31 +0530
Message-ID: <20180730151131.GA28633@mani>
References: <20180727184527.13287-1-manivannan.sadhasivam@linaro.org>
 <c3ae668a-6bcc-a0eb-1e00-14ef9d607316@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c3ae668a-6bcc-a0eb-1e00-14ef9d607316@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On Mon, Jul 30, 2018 at 12:26:07PM +0200, Andreas Färber wrote:
> Hi Mani,
> 
> Am 27.07.2018 um 20:45 schrieb Manivannan Sadhasivam:
> > This patchset adds Reset Controller (RMU) support for Actions Semi
> > Owl SoCs, S900 and S700. For the Owl SoCs, RMU has been integrated into
> > the clock subsystem in hardware. Hence, in software we integrate RMU
> > support into common clock driver inorder to maintain compatibility.
> 
> Can this not be placed into drivers/reset/ by using mfd-simple with a
> sub-node in DT?
> 

Actually I was not sure where to place this reset controller driver. When I
looked into other similar ones such as sunxi, they just integrated into the
clk subsystem. So I just chose that path. But yeah, this is hacky!

But this RMU is not MFD by any means. Since the CMU (Clock) and RMU (Reset)
are two separate IPs inside SoC, we shouldn't describe it as a MFD driver. Since
RMU has only 2 registers, the HW designers decided to use up the CMU memory
map. So, maybe syscon would be best option I think. What is your opinion?

Even if we go for syscon, we should place the reset driver within clk
framework as I can see other SoCs like Mediatek are doing the same. But again
I'm not sure!

Thanks,
Mani

> Regards,
> Andreas
> 
> -- 
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer, Jane Smithard, Graham Norton
> HRB 21284 (AG Nürnberg)
