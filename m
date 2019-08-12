From: <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH] at91/dt: ariettag25: style cleanup
Date: Mon, 12 Aug 2019 15:47:54 +0000
Message-ID: <4f58b080-dd20-19eb-c3b6-76746009ecc8@microchip.com>
References: <20190731220045.3992-1-uwe@kleine-koenig.org>
 <20190801082622.hma5ejifj6i2a2jv@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801082622.hma5ejifj6i2a2jv@M43218.corp.atmel.com>
Content-Language: en-US
Content-ID: <527BAD675E30B540AE31C062686B708E@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: uwe@kleine-koenig.org, alexandre.belloni@bootlin.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/08/2019 at 10:26, Ludovic Desroches wrote:
> On Thu, Aug 01, 2019 at 12:00:45AM +0200, Uwe Kleine-K=F6nig wrote:
>>
>> - newline between properties and sub-nodes
>> - use tags from included dtsi instead of duplicating the hierarchy
>> - status should be the last property
>> - drop duplicated alias
>>
>> There are no differences in the generated .dtb
>>
>> Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> =

>> ---
>> Hello,
>>
>> these are the style rules I was teached when modifying imx dts files.
>> Do they apply to at91, too?
> =

> Hello Uwe,
> =

> It's okay for me, we had no guidelines at the beginning, that explain
> some inconsistency among our dt files. We tend to follow these rules
> excepted the use of labels.
> =

> I would like to be sure that Nicolas and Alexandre are on the same
> wavelength than me.

After I had been reluctant to use them (another syntax to learn in =

addition to learning DT, remember, back in the days...), I'm now okay to =

use labels as they are so convenient and widely used.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Uwe! Best regards,
   Nicolas


>>   arch/arm/boot/dts/at91-ariettag25.dts | 87 +++++++++++++--------------
>>   1 file changed, 43 insertions(+), 44 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/at91-ariettag25.dts b/arch/arm/boot/dts/a=
t91-ariettag25.dts
>> index 7a34c4dc05d2..8f9f5a22cbf6 100644
>> --- a/arch/arm/boot/dts/at91-ariettag25.dts
>> +++ b/arch/arm/boot/dts/at91-ariettag25.dts
>> @@ -6,14 +6,11 @@
>>    */
>>   /dts-v1/;
>>   #include "at91sam9g25.dtsi"
>> +
>>   / {
>>   	model =3D "Acme Systems Arietta G25";
>>   	compatible =3D "acme,ariettag25", "atmel,at91sam9x5", "atmel,at91sam9=
";
>>   =

>> -	aliases {
>> -		serial0 =3D &dbgu;
>> -	};
>> -
>>   	chosen {
>>   		stdout-path =3D "serial0:115200n8";
>>   	};
>> @@ -34,55 +31,16 @@
>>   =

>>   	ahb {
>>   		apb {
>> -			mmc0: mmc@f0008000 {
>> -				pinctrl-0 =3D <
>> -				  &pinctrl_mmc0_slot0_clk_cmd_dat0
>> -				  &pinctrl_mmc0_slot0_dat1_3>;
>> -				status =3D "okay";
>> -
>> -				slot@0 {
>> -					reg =3D <0>;
>> -					bus-width =3D <4>;
>> -				};
>> -			};
>> -
>> -			tcb0: timer@f8008000 {
>> -				timer@0 {
>> -					compatible =3D "atmel,tcb-timer";
>> -					reg =3D <0>;
>> -				};
>> -
>> -				timer@1 {
>> -					compatible =3D "atmel,tcb-timer";
>> -					reg =3D <1>;
>> -				};
>> -			};
>> -
>> -			usb2: gadget@f803c000 {
>> -				status =3D "okay";
>> -			};
>> -
>> -			dbgu: serial@fffff200 {
>> -				status =3D "okay";
>> -			};
>> -
>>   			rtc@fffffeb0 {
>>   				status =3D "okay";
>>   			};
>>   		};
>>   =

>> -		usb0: ohci@600000 {
>> -			status =3D "okay";
>> -			num-ports =3D <3>;
>> -		};
>> -
>> -		usb1: ehci@700000 {
>> -			status =3D "okay";
>> -		};
>>   	};
>>   =

>>   	leds {
>>   		compatible =3D "gpio-leds";
>> +
>>   		arietta_led {
>>   			label =3D "arietta_led";
>>   			gpios =3D <&pioB 8 GPIO_ACTIVE_HIGH>; /* PB8 */
>> @@ -90,3 +48,44 @@
>>   		};
>>   	};
>>   };
>> +
>> +&dbgu {
>> +	status =3D "okay";
>> +};
>> +
>> +&mmc0 {
>> +	pinctrl-0 =3D <
>> +		&pinctrl_mmc0_slot0_clk_cmd_dat0
>> +		&pinctrl_mmc0_slot0_dat1_3>;
>> +	status =3D "okay";
>> +
>> +	slot@0 {
>> +		reg =3D <0>;
>> +		bus-width =3D <4>;
>> +	};
>> +};
>> +
>> +&tcb0 {
>> +	timer@0 {
>> +		compatible =3D "atmel,tcb-timer";
>> +		reg =3D <0>;
>> +	};
>> +
>> +	timer@1 {
>> +		compatible =3D "atmel,tcb-timer";
>> +		reg =3D <1>;
>> +	};
>> +};
>> +
>> +&usb0 {
>> +	num-ports =3D <3>;
>> +	status =3D "okay";
>> +};
>> +
>> +&usb1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb2 {
>> +	status =3D "okay";
>> +};
>> -- =

>> 2.20.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =



-- =

Nicolas Ferre
