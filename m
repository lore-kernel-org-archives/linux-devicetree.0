From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [PATCH 1/3] arm: atmel: at91sam9n12: add pinctrl of TWI
Date: Thu, 11 Jul 2013 09:17:52 +0800
Message-ID: <51DE07C0.7060304@atmel.com>
References: <1373449869-5083-1-git-send-email-voice.shen@atmel.com> <1373449869-5083-2-git-send-email-voice.shen@atmel.com> <20130710143923.GH18012@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130710143923.GH18012@ns203013.ovh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, ludovic.desroches@atmel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi J,

On 7/10/2013 22:39, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 17:51 Wed 10 Jul     , Bo Shen wrote:
>> add pinctrl of TWI for at91sam9n12 SoC
>>
>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
>> ---
>>   arch/arm/boot/dts/at91sam9n12.dtsi |   20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
>> index bb7f564..3db62f6 100644
>> --- a/arch/arm/boot/dts/at91sam9n12.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9n12.dtsi
>> @@ -291,6 +291,22 @@
>>   					};
>>   				};
>>
>> +				i2c0 {
>> +					pinctrl_i2c0: i2c0-0 {
>> +						atmel,pins =
>> +							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA30 periph A I2C0 data */
>> +							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA31 periph A I2C0 clock */
>> +					};
>> +				};
>> +
>> +				i2c1 {
>> +					pinctrl_i2c1: i2c1-0 {
>> +						atmel,pins =
>> +							<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_NONE	/* PC0 periph C I2C1 data */
>> +							 AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_NONE>;	/* PC1 periph C I2C1 clock */
> drop  the comment as we use macro

Thanks, I will drop the comment.

>> +					};
>> +				};
>> +
>>   				tcb0 {
>>   					pinctrl_tcb0_tclk0: tcb0_tclk0-0 {
>>   						atmel,pins = <AT91_PIOA 24 AT91_PERIPH_A AT91_PINCTRL_NONE>;
>> @@ -471,6 +487,8 @@
>>   				dma-names = "tx", "rx";
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c0>;
>>   				status = "disabled";
>>   			};
>>
>> @@ -483,6 +501,8 @@
>>   				dma-names = "tx", "rx";
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c1>;
>>   				status = "disabled";
>>   			};
>>
>> --
>> 1.7.9.5
>>

Best Regards,
Bo Shen
