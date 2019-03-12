From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 02/11] ARM: davinci: enable the clocksource driver for
 DT mode
Date: Tue, 12 Mar 2019 13:19:55 -0500
Message-ID: <4a8b2bec-b67d-e198-0df4-e2ed1f24926c@lechnology.com>
References: <20190226120633.18200-1-brgl@bgdev.pl>
 <20190226120633.18200-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-3-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/26/19 6:06 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Switch all davinci boards supporting device tree to using the new
> clocksource driver: remove the previous OF_TIMER_DECLARE() from
> mach-davinci and select davinci-timer for ARCH_DAVINCI.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---


Reviewed-by: David Lechner <david@lechnology.com>
