From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4] Add TI CDCE925 I2C controlled clock synthesizer driver
Date: Wed, 03 Jun 2015 15:30:22 -0700
Message-ID: <556F7FFE.4050102@codeaurora.org>
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl> <1433309119-5186-1-git-send-email-mike.looijmans@topic.nl> <20150603222504.6017.28097@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150603222504.6017.28097@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/03/2015 03:25 PM, Michael Turquette wrote:
> Quoting Mike Looijmans (2015-06-02 22:25:19)
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 9897f35..1c31704 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -78,6 +78,23 @@ config COMMON_CLK_SI570
>>            This driver supports Silicon Labs 570/571/598/599 programmable
>>            clock generators.
>>   
>> +config COMMON_CLK_CDCE925
>> +       tristate "Clock driver for TI CDCE925 devices"
>> +       depends on I2C
>> +       depends on OF
>> +       select REGMAP_I2C
>> +       help
>> +       ---help---

Why two helps?


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
