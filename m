From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [RFC PATCH 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx devices
Date: Tue, 26 May 2015 18:41:09 +0200
Message-ID: <CALszF6BTu_8SCE9hEiLYuvQg8J9eG5xktaVV7_LvnG3r20+wtw@mail.gmail.com>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

2015-05-22 22:41 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
>  2. Allocating ~80 clock components appears to fragment memory enough
>     to prevent busybox (.text is ~300K, non-XIP) from running getty.
>     I have to use "init=/bin/sh" to avoid OOM problems.
>

Yes, I reproduced the same issue while testing your work.

Could you try with:
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=0

It solves (hides) the problem on my side.
You can eventually setting it once booted to 1 via procfs.

Kind regards,
Maxime
