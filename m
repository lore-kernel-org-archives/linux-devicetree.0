From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Please suggest proper format for DT properties.
Date: Tue, 22 Sep 2015 08:08:25 -0700
Message-ID: <56016EE9.1010302@roeck-us.net>
References: <1442615803-17766-1-git-send-email-const@MakeLinux.com>
 <3914149.k3sqApaTEz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3914149.k3sqApaTEz@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Constantine Shulyupin <const@makelinux.com>, Jean Delvare <jdelvare@suse.com>
Cc: open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 09/22/2015 01:36 AM, Arnd Bergmann wrote:
> On Saturday 19 September 2015 01:36:43 Constantine Shulyupin wrote:
>>
>> I am designing DT support for a hwmon chip.
>> It has some sensors, each of them can be:
>>   - "disabled"
>>   - "thermal diode"
>>   - "thermistor"
>>   - "voltage"
>>
>> Four possible options for DT properties format.
>>
>> Option 1: Separated property for each sensor.
>>
>> Example nct7802 node:
>>
>> nct7802 {
>>          compatible = "nuvoton,nct7802";
>>          reg = <0x2a>;
>>          nuvoton,sensor1-type = "thermistor";
>>          nuvoton,sensor2-type = "disabled";
>>          nuvoton,sensor3-type = "voltage";
>> };
>>
>> Option 2: Array of strings for all sensors.
>>
>> nct7802 {
>>          compatible = "nuvoton,nct7802";
>>          reg = <0x2a>;
>>          nuvoton,sensors-types = "thermistor", "disabled", "voltage";
>> };
>>
>> Option 3: Sets of 4 cells.
>>
>>    Borrowed from marvell,reg-init and broadcom,c45-reg-init.
>>
>>    The first cell is the page address,
>>    the second a register address within the page,
>>    the third cell contains a mask to be ANDed with the existing register
>>    value, and the fourth cell is ORed with the result to yield the
>>    new register value. If the third cell has a value of zero,
>>    no read of the existing value is performed.
>>
>> Example nct7802 node:
>>
>> nct7802 {
>>          compatible = "nuvoton,nct7802";
>>          reg = <0x2a>;
>>          nct7802,reg-init =
>>                  <0 0x21 0 0x01 > // START = 1
>>                  <0 0x22 0x03 0x02>; // RTD1_MD = 2
>> };
>>
>
> I would strongly prefer Option 1 or 2 over option 3.
> Between 1 and 2, I'd probably go for 1. Another option might
> be to have a subnode per sensor:
>
> nct7802@2a {
>          compatible = "nuvoton,nct7802";
>          reg = <0x2a>;
> 	#address-cells=<1>;
> 	#size-cells=<0>;
>
> 	sensor@1 {
> 		compatible = "nuvoton,nct7802-thermistor";
> 		further-properties;
> 	};
> 	sensor@3 {
> 		compatible = "nuvoton,nct7802-voltage";
> 		for-example-range-mv = <0 5000>;
> 	};
> };
>
I personally would prefer this approach. It would also make it easier to add more
properties. Wonder what is more appropriate, though - a compatible property or
something like the following ?
		sensor-type = "xxx";

I don't have a preference, just asking.

Also, would the index be derived from "@1", or should there be a reg property ?

> In either case, I'd say that disabled sensors should not need to
> be listed.
>
Agreed.

Thanks,
Guenter
