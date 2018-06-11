From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v6 4/5] clocksource: add driver for i.MX EPIT timer
Date: Mon, 11 Jun 2018 17:40:02 +0300
Message-ID: <27c914a5-22b2-1f64-dc89-4ecee5bff2b9@mleia.com>
References: <20180607140544.22268-1-peron.clem@gmail.com>
 <20180607140544.22268-5-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180607140544.22268-5-peron.clem@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

On 06/07/2018 05:05 PM, Clément Péron wrote:
> From: Colin Didier <colin.didier@devialet.com>
> 
> Add driver for NXP's EPIT timer used in i.MX SoC.
> 
> Signed-off-by: Colin Didier <colin.didier@devialet.com>
> Signed-off-by: Clément Peron <clement.peron@devialet.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Tested-by: Vladimir Zapolskiy <vz@mleia.com>

I tested the driver on i.MX31 only, and I didn't find any problems.

Please fix the indentation issue found by Stefan in v7.

Regarding utilization of timer-of.c it can be postponed IMHO,
but it's up to clocksource maintainers and you to decide, and if
you do such an update for v7, then please don't add my tags,
I'll review and test it again.

--
With best wishes,
Vladimir
