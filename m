From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 01/17] ARM: dts: da850: fix interrupt numbers for
 clocksource
Date: Thu, 17 Jan 2019 19:52:59 +0530
Message-ID: <250a521a-ba07-ba17-83d8-d9ad8f55a460@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111172134.30147-2-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The timer interrupts specified in commit 3652e2741f42 ("ARM: dts:
> da850: Add clocks") are wrong but since the current timer code
> hard-codes them, the bug was never spotted.
> 
> This patch must go into stable since, once we introduce a proper
> clocksource driver, devices with buggy device tree will stop booting.

Is this the case where someone uses device-tree from a stable tree and
kernel from latest mainline?

I have added it to my fixes branch for v5.0 anyway.

Thanks,
Sekhar
