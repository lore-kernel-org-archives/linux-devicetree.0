From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 1/5] clk: actions: Add REGMAP as dependency
Date: Sun, 15 Jul 2018 14:35:53 +0200
Message-ID: <b0e29fe8-c16a-e783-8877-d01f052ba963@suse.de>
References: <20180715123145.16975-1-sravanhome@gmail.com>
 <20180715123145.16975-2-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715123145.16975-2-sravanhome@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: manivannan.sadhasivam@linaro.org, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Hi,

Am 15.07.2018 um 14:31 schrieb Saravanan Sekar:
> Add REGMAP as dependency to avoid undefined reference to regmap symbol

Is this a bugfix for S900? Then please add a Fixes: line. If not, why is
it a separate patch and not in 3/5?

Also, the subject is fine as is, but please add a full stop at the end
of the sentence in the commit message.

Regards,
Andreas


-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
