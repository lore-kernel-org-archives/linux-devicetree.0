From: Claudiu Beznea <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH] ARM: dts: at91: fix typo for PIN_PB22
Date: Mon, 16 Jul 2018 12:34:03 +0300
Message-ID: <f5cdc41d-8c6e-0f7f-9fbe-2b4057008720@microchip.com>
References: <1531326337-15504-1-git-send-email-claudiu.beznea@microchip.com>
 <20180712063021.h7t424iksdulj74a@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712063021.h7t424iksdulj74a@M43218.corp.atmel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ludovic,

On 12.07.2018 09:30, Ludovic Desroches wrote:
> Hi Claudiu,
> 
> On Wed, Jul 11, 2018 at 07:25:37PM +0300, Claudiu Beznea wrote:
>> Fix typo for PIN_PB22 on TD function.
> 
> In fact, this typo is present in several places in this file. It could
> be worth fixing all those occurences in a single patch.

Sure, I will look over all those occurrences.

Thank you,
Claudiu

> 
> Regards
> 
> Ludovic
> 
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> ---
>>  arch/arm/boot/dts/sama5d2-pinfunc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d2-pinfunc.h b/arch/arm/boot/dts/sama5d2-pinfunc.h
>> index e57191fb83de..ac61491c9d7f 100644
>> --- a/arch/arm/boot/dts/sama5d2-pinfunc.h
>> +++ b/arch/arm/boot/dts/sama5d2-pinfunc.h
>> @@ -375,7 +375,7 @@
>>  #define PIN_PB22__GPIO			PINMUX_PIN(PIN_PB22, 0, 0)
>>  #define PIN_PB22__LCDDAT11		PINMUX_PIN(PIN_PB22, 1, 1)
>>  #define PIN_PB22__A11			PINMUX_PIN(PIN_PB22, 2, 1)
>> -#define PIN_PB22__TDO			PINMUX_PIN(PIN_PB22, 3, 1)
>> +#define PIN_PB22__TD0			PINMUX_PIN(PIN_PB22, 3, 1)
>>  #define PIN_PB22__TIOA2			PINMUX_PIN(PIN_PB22, 4, 2)
>>  #define PIN_PB22__FLEXCOM3_IO1		PINMUX_PIN(PIN_PB22, 5, 3)
>>  #define PIN_PB22__GMDC			PINMUX_PIN(PIN_PB22, 6, 3)
>> -- 
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
