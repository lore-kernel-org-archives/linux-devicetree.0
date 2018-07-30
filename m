From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/9] Add Reset Controller support for Actions Semi Owl
 SoCs
Date: Mon, 30 Jul 2018 17:38:31 +0200
Message-ID: <1532965111.3471.14.camel@pengutronix.de>
References: <20180727184527.13287-1-manivannan.sadhasivam@linaro.org>
         <c3ae668a-6bcc-a0eb-1e00-14ef9d607316@suse.de>
         <20180730151131.GA28633@mani>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730151131.GA28633@mani>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 2018-07-30 at 20:41 +0530, Manivannan Sadhasivam wrote:
> Hi Andreas,
> 
> On Mon, Jul 30, 2018 at 12:26:07PM +0200, Andreas Färber wrote:
> > Hi Mani,
> > 
> > Am 27.07.2018 um 20:45 schrieb Manivannan Sadhasivam:
> > > This patchset adds Reset Controller (RMU) support for Actions Semi
> > > Owl SoCs, S900 and S700. For the Owl SoCs, RMU has been integrated into
> > > the clock subsystem in hardware. Hence, in software we integrate RMU
> > > support into common clock driver inorder to maintain compatibility.
> > 
> > Can this not be placed into drivers/reset/ by using mfd-simple with a
> > sub-node in DT?
> > 
> 
> Actually I was not sure where to place this reset controller driver. When I
> looked into other similar ones such as sunxi, they just integrated into the
> clk subsystem. So I just chose that path. But yeah, this is hacky!
> 
> But this RMU is not MFD by any means. Since the CMU (Clock) and RMU (Reset)
> are two separate IPs inside SoC, we shouldn't describe it as a MFD driver. Since
> RMU has only 2 registers, the HW designers decided to use up the CMU memory
> map. So, maybe syscon would be best option I think. What is your opinion?

Using syscon seems cleaner than stuffing the regmap into owl_clk_desc.

> Even if we go for syscon, we should place the reset driver within clk
> framework as I can see other SoCs like Mediatek are doing the same. But again
> I'm not sure!

Me neither. If the CMU and RMU are really separate and only share the
memory map, a syscon driver could live in drivers/reset without
problems.
It's only when there are interactions between clocks and resets that you
really want to have the reset driver integrated with clk.

regards
Philipp
