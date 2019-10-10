From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/8] clocksource/drivers/timer-atmel-tcb: add sama5d2
 support
Date: Thu, 10 Oct 2019 10:26:21 +0200
Message-ID: <20191010082602.ytfc2tilizruwrts@linutronix.de>
References: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-10-10 00:39:58 [+0200], Alexandre Belloni wrote:
> This series mainly adds sama5d2 support where we need to avoid using
> clock index 0 because that clock is never enabled by the driver.
> 
> There is also a rework of the 32khz clock handling so it is not used for
> clockevents on 32 bit counter because the increased rate improves the
> resolution and doesn't have any drawback with that counter width. This
> replaces a patch that has been carried in the linux-rt tree for a while.

Thank you for doing this!

Sebastian
