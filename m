From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 03/12] ARM: davinci: enable the clocksource driver for
 DT mode
Date: Mon, 4 Feb 2019 20:16:25 -0600
Message-ID: <e2276265-7c20-81d3-6e55-ddff446c7e54@lechnology.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-4-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Switch all davinci boards using device tree to using the new
> clocksource driver: remove the previous OF_TIMER_DECLARE() from
> mach-davinci and select davinci-timer to be built for
> davinci_all_defconfig.

I don't see how this patch is related to davinci_all_defconfig.
It looks like the new driver is just selected when ARCH_DAVINCI
is selected in Kconfig.

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
