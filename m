From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v5 1/5] clk: actions: Fix the missing REGMAP_MMIO
 dependency
Date: Sun, 15 Jul 2018 22:19:12 +0200
Message-ID: <4255c9c7-fffb-5b35-dbb7-ec91c6424c34@suse.de>
References: <20180715200151.10416-1-sravanhome@gmail.com>
 <20180715200151.10416-2-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715200151.10416-2-sravanhome@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: manivannan.sadhasivam@linaro.org, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Am 15.07.2018 um 22:01 schrieb Saravanan Sekar:
> Add REGMAP_MMIO as dependency to avoid undefined
> reference to regmap symbols.
> 
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

Still no Fixes: header. Please read SubmittingPatches.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
