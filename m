From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 3/5] regulator: of: Add regulator desc param to of_get_regulator_init_data()
Date: Fri, 07 Nov 2014 17:11:49 +0100
Message-ID: <545CEF45.1000503@collabora.co.uk>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk> <1415365205-27630-4-git-send-email-javier.martinez@collabora.co.uk> <1415373792.31102.27.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1415373792.31102.27.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

On 11/07/2014 04:23 PM, Krzysztof Kozlowski wrote:
>>  
>>  static struct fan53555_platform_data *fan53555_parse_dt(struct device *dev,
>> -							struct device_node *np)
>> +						struct device_node *np,
>> +						struct regulator_desc *desc)
> 
> Not a const? Why not?
>

Right, I removed all your other mentions to the same issue but I'll double
check all the drivers to be sure that use const.
 
>>  {
>>  	struct fan53555_platform_data *pdata;
>>  	int ret;
>> @@ -312,7 +313,7 @@ static struct fan53555_platform_data *fan53555_parse_dt(struct device *dev,
>>  	if (!pdata)
>>  		return NULL;
>>  
>> -	pdata->regulator = of_get_regulator_init_data(dev, np);
>> +	pdata->regulator = of_get_regulator_init_data(dev, np, desc);
> 
> Desc would be always NULL here which is safe (check in patch 5/5) but if
> someone puts "regulator-initial-mode" in DTS then this will always print
> warning. Just wonder - is it actually what you wanted?
> 
> This applies also for tps51632 and tps62360.
>

In an early version of the series I just passed NULL for all drivers but
Mark said that is more future proof to pass the descriptor and I agree.

I guess I should just remove the warning and only show an error if the
descriptor is not NULL and also the map mode function is defined but
the callback returns an error.
 
> (...)
> 
> Rest looks fine.
>

Thanks a lot for the review.
 
> Krzysztof
> 
> 

Best regards,
Javier
