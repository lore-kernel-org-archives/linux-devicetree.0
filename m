From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 06/12] ARM: davinci: da830: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 17:53:17 +0530
Message-ID: <3e80e485-10f0-1bf6-72eb-69d69a571cb6@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-7-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-7-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> -/*
> - * T0_BOT: Timer 0, bottom		: Used for clock_event & clocksource
> - * T0_TOP: Timer 0, top			: Used by DSP
> - * T1_BOT, T1_TOP: Timer 1, bottom & top: Used for watchdog timer

Aren't we changing this usage model for DA830 now, leaving no clock for
use by DSP? It seems to me that after these patches clockevent is always
T0_BOT and clocksource is always T0_TOP.

Thanks,
Sekhar
