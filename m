From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 03/33] ARM: davinci: select GENERIC_IRQ_MULTI_HANDLER
Date: Sat, 9 Feb 2019 15:13:04 -0600
Message-ID: <c9dbec4e-8738-e2bf-9011-1cc1ac5f44dd@lechnology.com>
References: <20190208173458.4801-1-brgl@bgdev.pl>
 <20190208173458.4801-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208173458.4801-4-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org



On 2/8/19 11:34 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> In order to support SPARSE_IRQ we first need to make davinci use the
> generic irq handler for ARM. Translate the legacy assembly to C and
> put the irq handlers into their respective drivers (aintc and cp-intc).
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>


> diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
> index 07d8ef8037e4..3ce821a06e52 100644
> --- a/arch/arm/mach-davinci/irq.c
> +++ b/arch/arm/mach-davinci/irq.c
> @@ -29,11 +29,13 @@
>   #include <mach/cputype.h>
>   #include <mach/common.h>
>   #include <asm/mach/irq.h>
> +#include <asm/exception.h>

Alphabetical order?
