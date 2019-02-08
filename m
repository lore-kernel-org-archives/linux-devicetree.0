From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 05/12] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 17:36:22 +0530
Message-ID: <9d423e18-8c85-731b-388a-1843067db242@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-6-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-6-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> +static const struct davinci_timer_cfg da850_timer_cfg = {
> +	.reg = {
> +		.start		= DA8XX_TIMER64P0_BASE,
> +		.end		= DA8XX_TIMER64P0_BASE + SZ_4K,

SZ_4K - 1

This should have prevented watchdog timer from getting registered.

Thanks,
Sekhar
