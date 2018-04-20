Return-Path: <SRS0=Yg38=HJ=rock-chips.com=shawn.lin@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: mmc: add optional cd-delay-ms
 property
References: <1523585925-169568-1-git-send-email-shawn.lin@rock-chips.com>
 <20180416192648.frw3kvwa3lr7jvsq@rob-hp-laptop>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <cb68f876-5c83-4b06-8ce9-d87c335c9191@rock-chips.com>
Date: Fri, 20 Apr 2018 14:57:38 +0800
MIME-Version: 1.0
In-Reply-To: <20180416192648.frw3kvwa3lr7jvsq@rob-hp-laptop>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: shawn.lin@rock-chips.com, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On 2018/4/17 3:26, Rob Herring wrote:
> On Fri, Apr 13, 2018 at 10:18:44AM +0800, Shawn Lin wrote:
>> slot-gpio uses a fixed delay, 200ms, before detecting card after the card
>> is inserted. 200ms doesn't work for some platforms, so some host drivers
>> added their own properties for parsing that from DT, for instance,
>> dw_mmc and pxamci. That being said, it should also be tunable when using
>> slog-gpio.
> 
> slot-gpio?
> 
> Or is it cd-gpios?

I think actually it shoule be cd-gpios. :)
Will update it.

> 
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>>
>> Changes in v2: None
>>
>>   Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
>> index 467cd7b..215b9a2 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
>> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
>> @@ -19,6 +19,8 @@ Optional properties:
>>   - wp-gpios: Specify GPIOs for write protection, see gpio binding
>>   - cd-inverted: when present, polarity on the CD line is inverted. See the note
>>     below for the case, when a GPIO is used for the CD line
>> +- cd-delay-ms: Set delay time before detecting card after card insert interrupt.
>> +  It's only valid when cd-gpios is present.
>>   - wp-inverted: when present, polarity on the WP line is inverted. See the note
>>     below for the case, when a GPIO is used for the WP line
>>   - disable-wp: When set no physical WP line is present. This property should
>> -- 
>> 1.9.1
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
