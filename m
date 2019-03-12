From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 06/11] ARM: davinci: move timer definitions to
 davinci.h
Date: Tue, 12 Mar 2019 13:41:39 -0500
Message-ID: <9b712b40-f282-ece4-db41-b11a811e4db2@lechnology.com>
References: <20190226120633.18200-1-brgl@bgdev.pl>
 <20190226120633.18200-7-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-7-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/26/19 6:06 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Boards from the dm* family rely on register offset definitions from
> arch/arm/mach-davinci/include/mach/time.h. We'll be removing this file
> soon, so move the required defines to davinci.h where the rest of such
> constants live.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
