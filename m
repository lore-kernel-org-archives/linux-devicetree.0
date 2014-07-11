From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: add clocks for usb device
Date: Fri, 11 Jul 2014 12:55:16 +0200
Message-ID: <53BFC294.4050502@aksignal.cz>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com> <20140711104755.GA3112@piout.net>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140711104755.GA3112@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bo Shen <voice.shen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thanks, it works now.

Dne 11.7.2014 12:47, Alexandre Belloni napsal(a):
> On 11/07/2014 at 18:22:55 +0800, Bo Shen wrote :
>> Add clocks for usb device, or else switch to CCF, the gadget
>> won't work.
>>
>> Reported-by: Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz>
>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Tested-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>
>> ---
>>   arch/arm/boot/dts/at91sam9x5.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/a=
t91sam9x5.dtsi
>> index d6133f4..2ebc421 100644
>> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
>> @@ -1045,6 +1045,8 @@
>>   				reg =3D <0x00500000 0x80000
>>   				       0xf803c000 0x400>;
>>   				interrupts =3D <23 IRQ_TYPE_LEVEL_HIGH 0>;
>> +				clocks =3D <&usb>, <&udphs_clk>;
>> +				clock-names =3D "hclk", "pclk";
>>   				status =3D "disabled";
>>
>>   				ep0 {
>> --
>> 1.8.5.2
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
