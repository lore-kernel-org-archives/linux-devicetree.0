From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 04/17] ARM: davinci: da850: WARN() if clk_get() fails
Date: Mon, 14 Jan 2019 17:52:00 +0530
Message-ID: <fcee383c-f2cb-1faf-d2a3-a35a17d57b8b@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111172134.30147-5-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently the timer code checks if the clock pointer passed to it is
> good (!IS_ERR(clk)). The new clocksource driver expects the clock to
> be functional and doesn't perform any checks so emit a warning if
> clk_get() fails.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I think 4-9 can be a single patch. They are doing something very similar
and its unlikely we will have to patch/revert just one of them.

Thanks,
Sekhar
