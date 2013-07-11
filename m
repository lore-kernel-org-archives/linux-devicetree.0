From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [PATCH 2/3] arm: atmel: at91sam9n12: add qt1070 support
Date: Thu, 11 Jul 2013 09:17:13 +0800
Message-ID: <51DE0799.1090905@atmel.com>
References: <1373449869-5083-1-git-send-email-voice.shen@atmel.com> <1373449869-5083-3-git-send-email-voice.shen@atmel.com> <20130710143835.GG18012@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130710143835.GG18012@ns203013.ovh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, ludovic.desroches@atmel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi J,

On 7/10/2013 22:38, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 17:51 Wed 10 Jul     , Bo Shen wrote:
>> add qt1070 support on at91sam9n12ek board
>>
>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
>> ---
>>   arch/arm/boot/dts/at91sam9n12ek.dts |   16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
>> index d59b70c..3acac62 100644
>> --- a/arch/arm/boot/dts/at91sam9n12ek.dts
>> +++ b/arch/arm/boot/dts/at91sam9n12ek.dts
>> @@ -40,6 +40,15 @@
>>
>>   			i2c0: i2c@f8010000 {
>>   				status = "okay";
>> +
>> +				qt1070: keyboard@1b {
>> +					compatible = "qt1070";
>> +					reg = <0x1b>;
>> +					interrupt-parent = <&pioA>;
>> +					interrupts = <2 0x0>;
> use the macro

Thanks, I will use macro here.

>> +					pinctrl-names = "default";
>> +					pinctrl-0 = <&pinctrl_qt1070_irq>;
>> +				};
>>   			};
>>
>>   			i2c1: i2c@f8014000 {
>> @@ -66,6 +75,13 @@
>>   							<AT91_PIOA 7 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;	/* PA7 gpio CD pin pull up and deglitch */
>>   					};
>>   				};
>> +
>> +				qt1070 {
>> +					pinctrl_qt1070_irq: qt1070_irq {
>> +						atmel,pins =
>> +							<AT91_PIOA 2 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>; /* PA2 GPIO with pull up deglith */
> drop the comment as we use macro

OK, I will drop the comment

>> +					};
>> +				};
>>   			};
>>
>>   			spi0: spi@f0000000 {
>> --
>
> Best Regards,
> J.
>

Best Regards,
Bo Shen
