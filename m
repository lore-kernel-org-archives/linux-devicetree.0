From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/15] serial: 8250_ingenic: Parse earlycon options
Date: Thu, 08 Jun 2017 23:12:12 +0200
Message-ID: <1a2b9e1fcf0f9fbf76bd0d25e8904beb@crapouillou.net>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-7-paul@crapouillou.net>
 <939febde-f962-6e2b-3657-a9b6c719dac1@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <939febde-f962-6e2b-3657-a9b6c719dac1@imgtec.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

[...]
>> diff --git a/drivers/tty/serial/8250/8250_ingenic.c 
>> b/drivers/tty/serial/8250/8250_ingenic.c
>> index b31b2ca552d1..59f3e632df49 100644
>> --- a/drivers/tty/serial/8250/8250_ingenic.c
>> +++ b/drivers/tty/serial/8250/8250_ingenic.c
>> @@ -99,14 +99,24 @@ static int __init 
>> ingenic_early_console_setup(struct earlycon_device *dev,
>>   					      const char *opt)
>>   {
>>   	struct uart_port *port = &dev->port;
>> -	unsigned int baud, divisor;
>> +	unsigned int divisor;
>> +	int baud = 115200;
>>     	if (!dev->port.membase)
>>   		return -ENODEV;
>>   +	if (opt) {
>> +		char options[256];
>> +		unsigned int parity, bits, flow; /* unused for now */
>> +
>> +		strlcpy(options, opt, sizeof(options));
> 
> Rather than adding this extra local copy maybe you could instead:
> 
> -void uart_parse_options(char *options, int *baud, int *parity, int 
> *bits,
> +void uart_parse_options(const char *options, int *baud, int *parity, 
> int *bits,
> 
> I cannot see any reason why uart_parse_options shouldn't take 'const
> char *options' as an argument.

Sure, good remark. I'll send a patch to change the prototype.

Thanks,
- Paul
