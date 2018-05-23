Return-Path: <SRS0=ZT0k=IK=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] mfd: dt: Add bindings for DA9063L
References: <20180523112644.9464-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUC243tr9rxUbmabzixFE8JwVm4hOEkm=AvTGUXpy_6Hw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6d4c8029-1480-db33-c6bc-47bef94d87cd@gmail.com>
Date: Wed, 23 May 2018 14:21:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUC243tr9rxUbmabzixFE8JwVm4hOEkm=AvTGUXpy_6Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 05/23/2018 02:08 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, May 23, 2018 at 1:26 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add device tree bindings for the Dialog DA9063L. This is a
>> variant of the DA9063 chip with smaller package, with less
>> LDO regulators and without RTC block. The other properties
>> of the chip are the same, including the content of the chip
>> ID register.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Minor nit below.
> 
>> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
>> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> 
>> @@ -6,14 +6,14 @@ Device                   Supply Names    Description
>>  ------                   ------------    -----------
>>  da9063-regulator        :               : LDOs & BUCKs
>>  da9063-onkey            :               : On Key
>> -da9063-rtc              :               : Real-Time Clock
>> +da9063-rtc              :               : Real-Time Clock (DA9063 only)
>>  da9063-watchdog         :               : Watchdog
>>
>>  ======
>>
>>  Required properties:
>>
>> -- compatible : Should be "dlg,da9063"
>> +- compatible : Should be "dlg,da9063" or "dlg,da9063l"
>>  - reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
>>    modified to match the chip's OTP settings).
>>  - interrupt-parent : Specifies the reference to the interrupt controller for
>> @@ -23,8 +23,8 @@ Required properties:
>>
>>  Sub-nodes:
>>
>> -- regulators : This node defines the settings for the LDOs and BUCKs. The
>> -  DA9063 regulators are bound using their names listed below:
>> +- regulators : This node defines the settings for the LDOs and BUCKs.
>> +  The DA9063 regulators are bound using their names listed below:
>>
>>      bcore1    : BUCK CORE1
>>      bcore2    : BUCK CORE2
>> @@ -44,13 +44,28 @@ Sub-nodes:
>>      ldo10     : LDO_10
>>      ldo11     : LDO_11
>>
>> +  The DA9063L regulators are bound using their names listed below:
>> +
>> +    bcore1    : BUCK CORE1
>> +    bcore2    : BUCK CORE2
>> +    bpro      : BUCK PRO
>> +    bmem      : BUCK MEM
>> +    bio       : BUCK IO
>> +    bperi     : BUCK PERI
>> +    ldo3      : LDO_3
>> +    ldo7      : LDO_7
>> +    ldo8      : LDO_8
>> +    ldo9      : LDO_9
>> +    ldo11     : LDO_11
>> +
> 
> As an alternative to having two lists, perhaps you can use a table, or
> mark entries "(DA9063 only)", like you did for da9063-rtc above?
> That makes it easier to see the differences.

Let's try that in V2

-- 
Best regards,
Marek Vasut
