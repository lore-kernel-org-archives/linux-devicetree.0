From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/2] GPIO: add single-register gpio via creg driver
Date: Thu, 23 Aug 2018 08:08:34 -0700
Message-ID: <c5f75b43-6ef3-31e2-0366-b6c8623d3f5d@infradead.org>
References: <20180823150013.21837-1-Eugeniy.Paltsev@synopsys.com>
 <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 08/23/2018 08:00 AM, Eugeniy Paltsev wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 71c0ab46f216..0f9cc1582cab 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -430,6 +430,15 @@ config GPIO_REG
>  	  A 32-bit single register GPIO fixed in/out implementation.  This
>  	  can be used to represent any register as a set of GPIO signals.
>  
> +config GPIO_SNPS_CREG
> +	bool "GPIO via CREG (Control REGisers) driver"

	                             REGisters)

> +	select OF_GPIO
> +	help
> +	  This driver supports GPIOs via CREG on various Synopsys SoCs.
> +	  This is is single-register MMIO gpio driver for complex cases

	  This is a                  MMIO GPIO

> +	  where only several fields in register belong to GPIO and

	                            in a register

> +	  each GPIO owns field with different length and on/off values.

maybe:
	                 fields with different lengths

> +
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR


-- 
~Randy
