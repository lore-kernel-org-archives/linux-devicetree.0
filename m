From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/6] ARM: at91/dt: define sama5d3 clocks
Date: Mon, 09 Dec 2013 09:43:23 +0100
Message-ID: <52A582AB.6010504@overkiz.com>
References: <1385650171-8756-1-git-send-email-b.brezillon@overkiz.com> <1385650228-8906-1-git-send-email-b.brezillon@overkiz.com> <201312090309.23723.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312090309.23723.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On 09/12/2013 03:09, Arnd Bergmann wrote:
> On Thursday 28 November 2013, Boris BREZILLON wrote:
>> @@ -92,6 +103,8 @@
>>   				dma-names = "tx", "rx";
>>   				pinctrl-names = "default";
>>   				pinctrl-0 = <&pinctrl_spi0>;
>> +				clocks = <&spi0_clk>;
>> +				clock-names = "spi_clk";
>>   				status = "disabled";
>>   			};
>>   
>> @@ -101,6 +114,8 @@
>>   				interrupts = <38 IRQ_TYPE_LEVEL_HIGH 4>;
>>   				pinctrl-names = "default";
>>   				pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
>> +				clocks = <&ssc0_clk>;
>> +				clock-names = "pclk";
>>   				status = "disabled";
>>   			};
>>   
> You are adding "clock-names" properties in a lot of cases. Are you sure you
> are using the strings that are documented in the respective device bindings
> for each name? In a lot of cases, drivers just want an anonymous clock
> and we don't name them.

I rechecked it, and almost all drivers call [devm_]clk_get with a 
specific clock
name, and as a result we must specify the "clock-names" property.
The only exceptions I found are the spi and PIT (Periodic Interval 
Timer) drivers,
and "clock-names" property is not defined in these nodes.


Best Regards,

Boris
>
> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
