From: Liu Ying <Ying.Liu@freescale.com>
Subject: Re: [PATCH] ARM: dts: i.MX51 babbage: Support diagnostic LED
Date: Mon, 10 Feb 2014 14:05:23 +0800
Message-ID: <52F86C23.1010101@freescale.com>
References: <1391522263-17877-1-git-send-email-Ying.Liu@freescale.com>
 <20140210030214.GB9628@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140210030214.GB9628@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/10/2014 11:02 AM, Shawn Guo wrote:
> On Tue, Feb 04, 2014 at 09:57:42PM +0800, Liu Ying wrote:
>> The D25 LED controlled by gpio on the i.MX51 babbage
>> board is a diagnostic LED according to the board design.
>> This patch adds the relevant device tree nodes to the
>> i.MX51 babbage device tree file to support this LED.
>>
>> Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>> ---
>>  arch/arm/boot/dts/imx51-babbage.dts |   17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
>> index be1407c..8d6a74b 100644
>> --- a/arch/arm/boot/dts/imx51-babbage.dts
>> +++ b/arch/arm/boot/dts/imx51-babbage.dts
>> @@ -81,6 +81,17 @@
>>  		};
>>  	};
>>  
>> +	leds {
>> +		compatible = "gpio-leds";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&led_pin_gpio2_6>;
>> +
>> +		led-diagnostic {
>> +			label = "diagnostic";
>> +			gpios = <&gpio2 6 0>;
> 
> Just out of curiosity, how will you use/trigger the led?
> 

Switch on the LED:
echo 1 > /sys/class/leds/diagnostic/brightness

Switch off the LED:
echo 0 > /sys/class/leds/diagnostic/brightness

>> +		};
>> +	};
>> +
>>  	sound {
>>  		compatible = "fsl,imx51-babbage-sgtl5000",
>>  			     "fsl,imx-audio-sgtl5000";
>> @@ -280,6 +291,12 @@
>>  				MX51_PAD_CSPI1_RDY__GPIO4_26 0x80000000
>>  			>;
>>  		};
>> +
>> +		led_pin_gpio2_6: led_gpio2_6 {
> 
> This might be copied from some existing file, but I would hope the name
> can be more generic, something like the following
> 
> 	pinctrl_gpio_leds: gpioledsgrp {
> 
> , so that when we have more gpio controlled leds to add, we can just add
> more pins into the same group without concerning the name.
> 

Agree.  I will address this comment in patch v2.  Thanks!

Regards,
Liu Ying

> 
>> +			fsl,pins = <
>> +				MX51_PAD_EIM_D22__GPIO2_6 0x80000000
>> +			>;
>> +		};
>>  	};
>>  };
>>  
>> -- 
>> 1.7.9.5
>>
>>
> 
