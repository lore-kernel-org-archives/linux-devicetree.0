From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V3 4/6] clk: bcm2835: remove use of BCM2835_CLOCK_COUNT in driver
Date: Thu, 14 Jan 2016 16:16:46 +0100
Message-ID: <6E590181-FFFB-4396-8B8A-61F277ED27B7@martin.sperl.org>
References: <1452779142-20615-1-git-send-email-kernel@martin.sperl.org> <1452779142-20615-5-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452779142-20615-5-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> On 14.01.2016, at 14:45, kernel@martin.sperl.org wrote:
> 
> -
> -	clks[BCM2835_CLOCK_PWM] =
> -		bcm2835_register_clock(cprman, &bcm2835_clock_pwm_data);
> +	for (i = 0; i < asize; i++) {
> +		desc = &clk_desc_array[i];
> +		if (desc)
		if (desc->data && desc->clk_register)
> +			clks[i] = desc->clk_register(cprman, desc->data);
> +	}

I will wait for other feedback before sending V4, which would fix this...
