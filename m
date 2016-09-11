From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: gpio-leds broken on OCTEON
Date: Sun, 11 Sep 2016 14:41:39 +0200
Message-ID: <dc278c85-5ebd-7b91-2524-8c3549d1ee0c@leemhuis.info>
References: <20160823203605.GA12169@raspberrypi.musicnaut.iki.fi>
 <57BDCE58.20200@cavium.com>
 <20160825182453.GF12169@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160825182453.GF12169@raspberrypi.musicnaut.iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>, "Steven J. Hill" <Steven.Hill@cavium.com>
Cc: David Daney <ddaney@caviumnetworks.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi! On 25.08.2016 20:24, Aaro Koskinen wrote:
> On Wed, Aug 24, 2016 at 11:42:00AM -0500, Steven J. Hill wrote:
>> It is actually two patches that cause the breakage. The other is:
>>    commit e55aeb6ba4e8cc3549bff1e75ea1d029324bce21
>>    of/irq: Mark interrupt controllers as populated before initialisation
>> I needed to revert both of these in order to get MMC working on our 71xx and
>> 78xx boards. For our MMC, I got error messages from the MMC core of "Invalid
>> POWER GPIO" until I applied the second patch. I will have a fix worthy of
>> upstreaming today which will be posted today.
> 
> The below change works for me...
> 
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index 5a9b87b..5fd57c2 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1618,6 +1618,7 @@ static int __init octeon_irq_init_gpio(
>  		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
>  		return -ENOMEM;
>  	}
> +	of_node_clear_flag(gpio_node, OF_POPULATED);
>  
>  	return 0;
>  }

This afaics wasn't merged and the discussion looks stalled. Was this
issue discussed elsewhere or even fixed in between? Just asking, because
this issue is on the list of regressions for 4.8.

Ciao, Thorsten
