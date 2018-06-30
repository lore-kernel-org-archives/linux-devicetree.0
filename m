Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 5/7] mmc: pxamci: call mmc_of_parse()
References: <20180629144738.446-1-daniel@zonque.org>
 <20180629144738.446-6-daniel@zonque.org> <87r2koi9e2.fsf@belgarion.home>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <25c89d51-6d3c-9018-8cb9-10fc4309d2e0@zonque.org>
Date: Sat, 30 Jun 2018 20:07:14 +0200
MIME-Version: 1.0
In-Reply-To: <87r2koi9e2.fsf@belgarion.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Saturday, June 30, 2018 05:25 PM, Robert Jarzmik wrote:
> Daniel Mack <daniel@zonque.org> writes:
> 
>> Call into mmc_of_parse() from pxamci_of_init(). As it needs a pointer to a
>> struct mmc_host, refactor the code a bit.
>>
>> This allows all generic MMC properties to be set that are described in
>> Documentation/devicetree/bindings/mmc/mmc.txt.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> 
> I'm a bit worried about this one :
>   - mmc_of_init() will request the gpios from "cd-gpios" and "wp-gpios"
>   - pdata->gpio_card_detect will be used to request the same gpio in
>   pxa_mci_of_init()
> 
> So the gpio is acquired twice, isn't it ? Do you know this works by test proof,
> and doesn't it make sense to remove the "pdata->gpio* =" statements from
> pxamci_of_init() ?

Ah, yes. Thanks for spotting this, you're right! Will fix in v2!


Thanks,
Daniel
