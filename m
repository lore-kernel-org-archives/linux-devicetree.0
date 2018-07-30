From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 0/9] Add Reset Controller support for Actions Semi Owl
 SoCs
Date: Mon, 30 Jul 2018 12:26:07 +0200
Message-ID: <c3ae668a-6bcc-a0eb-1e00-14ef9d607316@suse.de>
References: <20180727184527.13287-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727184527.13287-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Mani,

Am 27.07.2018 um 20:45 schrieb Manivannan Sadhasivam:
> This patchset adds Reset Controller (RMU) support for Actions Semi
> Owl SoCs, S900 and S700. For the Owl SoCs, RMU has been integrated into
> the clock subsystem in hardware. Hence, in software we integrate RMU
> support into common clock driver inorder to maintain compatibility.

Can this not be placed into drivers/reset/ by using mfd-simple with a
sub-node in DT?

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
