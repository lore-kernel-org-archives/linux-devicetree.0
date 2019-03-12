From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 05/11] ARM: davinci: da830: switch to using the
 clocksource driver
Date: Tue, 12 Mar 2019 13:40:44 -0500
Message-ID: <2e989dd2-6844-4b03-904f-34103e60d550@lechnology.com>
References: <20190226120633.18200-1-brgl@bgdev.pl>
 <20190226120633.18200-6-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-6-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/26/19 6:06 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We now have a proper clocksource driver for davinci. Switch the da830
> platform to using it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

(same comment as the da850 patch about the comment)
