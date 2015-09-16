From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: imx27.dtsi: change the clock information
 for usb
Date: Wed, 16 Sep 2015 01:55:52 -0300
Message-ID: <CAOMZO5BO6_KwMKEN8oc8y-dA9tZr4JcsQBKm53uvRJWoCrPTHQ@mail.gmail.com>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
	<1442368183-8103-3-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1442368183-8103-3-git-send-email-peter.chen@freescale.com>
Sender: stable-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, USB list <linux-usb@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 10:49 PM, Peter Chen <peter.chen@freescale.com> wrote:
> For imx27, it needs three clocks to let the controller work,
> the old code is wrong, and will cause below data abort when
> accass usbmisc registers.

s/acass/accessing

>
> usbcore: registered new interface driver usb-storage
> Unhandled fault: external abort on non-linefetch (0x008) at 0xf4424600
> pgd = c0004000
> [f4424600] *pgd=10000452(bad)
> Internal error: : 8 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-next-20150701-dirty #3089
> Hardware name: Freescale i.MX27 (Device Tree Support)
> task: c7832b60 ti: c783e000 task.ti: c783e000
> PC is at usbmisc_imx27_init+0x4c/0xbc
> LR is at usbmisc_imx27_init+0x40/0xbc
> pc : [<c03cb5c0>]    lr : [<c03cb5b4>]    psr: 60000093
> sp : c783fe08  ip : 00000000  fp : 00000000
> r10: c0576434  r9 : 0000009c  r8 : c7a773a0
> r7 : 01000000  r6 : 60000013  r5 : c7a776f0  r4 : c7a773f0
> r3 : f4424600  r2 : 00000000  r1 : 00000001  r0 : 00000001
> Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> Control: 0005317f  Table: a0004000  DAC: 00000017
> Process swapper (pid: 1, stack limit = 0xc783e190)
> Stack: (0xc783fe08 to 0xc7840000)
>
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> Reported-by: Fabio Estevam <fabio.estevam@freescale.com>
> Cc: <stable@vger.kernel.org>

Tested-by: Fabio Estevam <fabio.estevam@freescale.com>
