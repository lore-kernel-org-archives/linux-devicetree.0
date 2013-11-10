From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Add Netgear ReadyNAS 2120 board
Date: Sun, 10 Nov 2013 01:57:09 +0100
Message-ID: <527ED9E5.80800@gmail.com>
References: <87bo1tmibv.fsf@natisbad.org> <527ECBDD.7050607@gmail.com> <87hablulxu.fsf@natisbad.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87hablulxu.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/10/2013 01:42 AM, Arnaud Ebalard wrote:
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> On 11/09/2013 09:27 PM, Arnaud Ebalard wrote:
>>> All hardware parts of the (mv78230 Armada XP based) NETGEAR ReadyNAS
>>> 2120 are supported by mainline kernel (USB 3.0 and eSATA rear ports,
>>> USB 2.0 front port, Gigabit controller and PHYs for the two rear ports,
>>> serial port, LEDs, Buttons, 88SE9170 SATA controllers, three G762 fan
>>> controllers, G751 temperature sensor) except for:
>>>
>>>    - the Intersil ISL12057 I2C RTC Chip,
>>>    - the Armada NAND controller.
>>>
>>> Support for both of those is currently work in progress and does not
>>> prevent boot.
>>>
>>> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
>>> ---
>> [...]
>>>    arch/arm/boot/dts/Makefile                     |   1 +
>>>    arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 289 +++++++++++++++++++++++++
>>
>> Arnaud,
>>
>> thanks for providing this! I do have some comments below.
>>
>> we recently had a discussion about the naming of new DTS files, which
>> proposes to name those after vendor,board.dts (or vendor-board.dts).
>>
>> I personally prefer vendor,board.dts which would give
>> netgear,readynas-2120.dts based on your compatible below.
>> The final call for ',' vs '-' has not been made, so I  suggest Jason
>> makes a call here.
>
> ok, will wait for a decision before resending. I a am not in a hurry.
>
>>> +
>>> +			serial@12000 {
>>> +				clock-frequency = <250000000>;
>>
>> Where does that 250MHz come from? If it is an internal clock
>> and we already have a DT clock provider for it, please use
>> clocks = <&provider num>;
>>
>> If it is TCLK it can be optained from <&coreclk 0>.
>
> Well, no innovation here: to be honest - it's not a valid argument but -
> I copy pasted the line from other armada-xp-*.dts files:
>
> $ grep 250000000 armada-xp-*.dts
> armada-xp-axpwifiap.dts:                                clock-frequency = <250000000>;
> armada-xp-axpwifiap.dts:                                clock-frequency = <250000000>;
> armada-xp-db.dts:                               clock-frequency = <250000000>;
> armada-xp-db.dts:                               clock-frequency = <250000000>;
> armada-xp-db.dts:                               clock-frequency = <250000000>;
> armada-xp-db.dts:                               clock-frequency = <250000000>;
> armada-xp-gp.dts:                               clock-frequency = <250000000>;
> armada-xp-gp.dts:                               clock-frequency = <250000000>;
> armada-xp-gp.dts:                               clock-frequency = <250000000>;
> armada-xp-gp.dts:                               clock-frequency = <250000000>;
> armada-xp-openblocks-ax3-4.dts:                         clock-frequency = <250000000>;
> armada-xp-openblocks-ax3-4.dts:                         clock-frequency = <250000000>;
>
> I will use <&coreclk 0> in next resend.

Yeah, I never said that existing dts are perfect ;)

If you feel like fixing this, I suggest to put clocks property in
SoC dtsi. I am sure Gregory can confirm this, but there is no other
clock possible for Armada 370/XP's serial IP.

But anyway, I checked drivers/clk/mvebu/armada-xp.c and 250MHz is TCLK
which can be referenced as <&coreclk 0>.

>>> +				status = "okay";
>>> +			};
>>> +
>>> +			mdio {
>>> +				phy0: ethernet-phy@0 {
>>> +					reg = <0>;
>>
>> Can you evaluate PHYs compatible from u-boot or post vendor:prodid
>> from MDIO registers?
>
> Looking at the PCB, 88E1318-NNB2. I will dig into Documentation/ the
> associated compatible. Out of curiosity, how do you get the PHY model
> from u-boot or userland?

If it is 88e1318 the compatible is "marvell,88e1318" then. I usually
look at u-boot messages which sometimes reveal the PHY used. If that
is not sufficient, you can read PHY ID 1/2 (SMI address 2 and 3)
registers and go looking for model numbers.

>>> +
>>> +	clocks {
>>> +	       #address-cells = <1>;
>>> +	       #size-cells = <0>;
>>
>> Your nodes below neither have a reg property nor can they be
>> addressed in any way.
>
> I think I do not understand that comment. Can you clarify, possibly w/
> an example of you think is wrong and how it could be corrected?

Above two properties define that reg properties below "clocks" node
have 1 address cell and no size. As it is usually just an unsorted list
of oscillators and clock generators and no "bus", there is no
"addressing" of that devices.

No addressing, no reg property, no #address-cells/#size-cells required.

Sebastian

>> Both properties above are not required, so please remove them.
>>
>>> +	       g762_clk: fixedclk {
>>
>> s/fixedclk/oscillator/ ?
>>
>>> +			 compatible = "fixed-clock";
>>> +			 #clock-cells = <0>;
>>> +			 clock-frequency = <32768>;
>>> +	       };
>>> +	};
>>> +
>
> Something like the following?
>
>          clocks {
>                 g762_clk: oscillator {
>                           compatible = "fixed-clock";
>                           #clock-cells = <0>;
>                           clock-frequency = <32768>;
>                 };
>          };
>
> I think I could then backport that change to all readynas .dts and
> the Documentation/devicetree/bindings/hwmon/g762.txt at some point.

Ah, it is just a name. No need to backport this.

>>> +	gpio_leds {
>>> +		compatible = "gpio-leds";
>>> +		pinctrl-0 = <&sata1_led_pin &sata2_led_pin &err_led_pin
>>> +			     &sata3_led_pin &sata4_led_pin>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		red_sata1_led {
>>> +			label = "rn2120:red:sata1";
>>> +			gpios = <&gpio0 31 0>;   /* GPIO 31 Active High */
>>
>> You can
>>
>> #include <dt-bindings/gpio/gpio.h>
>>
>> then use
>>
>> gpios = <&gpio0 31 GPIO_ACTIVE_HIGH>
>>
>> and get rid of the comments.
>
> ok, will do.
>
>
>>> +			default-state = "off";
>>> +		};
>>> +
>>> +		red_sata2_led {
>>> +			label = "rn2120:red:sata2";
>>> +			gpios = <&gpio1 8 0>;   /* GPIO 40 Active High */
>>> +			default-state = "off";
>>> +		};
>>> +
>>> +		red_sata3_led {
>>> +			label = "rn2120:red:sata3";
>>> +			gpios = <&gpio1 12 0>;   /* GPIO 44 Active High */
>>> +			default-state = "off";
>>> +		};
>>> +
>>> +		red_sata4_led {
>>> +			label = "rn2120:red:sata4";
>>> +			gpios = <&gpio1 15 0>;   /* GPIO 47 Active High */
>>> +			default-state = "off";
>>> +		};
>>> +
>>> +		red_err_led {
>>> +			label = "rn2120:red:err";
>>> +			gpios = <&gpio1 13 1>;   /* GPIO 45 Active Low */
>>> +			default-state = "off";
>>> +		};
>>> +	};
>>> +
>>> +	gpio_keys {
>>> +		compatible = "gpio-keys";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>
>> Again, no addressing of those buttons possible.
>>
>>> +		pinctrl-0 = <&power_key_pin
>>> +			     &reset_key_pin>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		button@1 {
>>
>> Instead of button@n you can name the nodes after their function,
>> e.g. power_button, reset_button, ...
>
> ok, will change that.
>
>> I know both comments above are in the current binding documentation
>> (at least for gpio-keys-polled.txt, there is no gpio-keys.txt); but
>> IMHO both "bus-like" structure of gpio_keys and numbering of buttons
>> just looks so wrong.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
