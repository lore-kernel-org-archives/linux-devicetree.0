From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 13/41] clk: davinci: Add platform information for TI
 DM355 PSC
Date: Thu, 1 Feb 2018 17:20:42 +0530
Message-ID: <5fff33c5-68c3-4070-ddbd-4b8f91da8f4d@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-14-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-14-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
> +	LPSC(26, 0, gpio,        pll1_sysclk2, gpio_clkdev,        0),
> +	LPSC(27, 0, timer0,      pll1_auxclk,  timer0_clkdev,      0),
> +	LPSC(28, 0, timer1,      pll1_auxclk,  NULL,               0),
> +	/* REVISIT: why can't this be disabled? */
> +	LPSC(29, 0, timer2,      pll1_auxclk,  timer2_clkdev,
> +	     LPSC_ALWAYS_ENABLED),
> +	LPSC(31, 0, arm,         pll1_sysclk1, NULL,
> +	     LPSC_ALWAYS_ENABLED),

IMO, in this case the line break makes it more difficult to read so that
checkpatch warning should be ignored.

Thanks
Sekhar
