Return-Path: <SRS0=kDyz=HM=rock-chips.com=shawn.lin@kernel.org>
Subject: Re: [PATCH v3 1/2] Documentation: mmc: add optional cd-delay-ms
 property
References: <1524207555-165403-1-git-send-email-shawn.lin@rock-chips.com>
 <CAPDyKFrVaSwNxCUg1JYOYN9wx=yX68uU-LvNJMght-JOsmZhHw@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <4be95489-2ba0-5062-af12-b97398f36ef1@rock-chips.com>
Date: Mon, 23 Apr 2018 18:00:12 +0800
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrVaSwNxCUg1JYOYN9wx=yX68uU-LvNJMght-JOsmZhHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Ulf,

On 2018/4/23 17:04, Ulf Hansson wrote:
> On 20 April 2018 at 08:59, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>> slot-gpio uses a fixed delay, 200ms, before detecting card after the card
>> is inserted. 200ms doesn't work for some platforms, so some host drivers
>> added their own properties for parsing that from DT, for instance,
>> dw_mmc and pxamci. That being said, it should also be tunable when using
>> cd-gpios.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>
>> ---
>>
>> Changes in v3:
>> - fix misleading typo in commit msg
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
> 
> I would prefer the property to be named "cd-debounce-delay-ms"
> instead. Would you mind changing it?
> 

ok, will change it in v4.

>>   - wp-inverted: when present, polarity on the WP line is inverted. See the note
>>     below for the case, when a GPIO is used for the WP line
>>   - disable-wp: When set no physical WP line is present. This property should
>> --
>> 1.9.1
>>
>>
> 
> Kind regards
> Uffe
> 
> 
> 
