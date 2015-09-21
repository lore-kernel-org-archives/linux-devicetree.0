From: Constantine Shulyupin <const@makelinux.com>
Subject: Re: Please suggest proper format for DT properties.
Date: Mon, 21 Sep 2015 22:24:56 +0300
Message-ID: <CAE7jHC-8NeHKo8x5oCPQTPTzoWmpyXxa3G2+PxJgSBxEct5ocA@mail.gmail.com>
References: <1442615803-17766-1-git-send-email-const@MakeLinux.com>
	<CAL_JsqLtyM9v1nCE_ZqcBTmnmLU2AjqBKCG5FhLSmkcXZYjV0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLtyM9v1nCE_ZqcBTmnmLU2AjqBKCG5FhLSmkcXZYjV0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lm-sensors@lm-sensors.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 4:51 AM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Sep 18, 2015 at 5:36 PM, Constantine Shulyupin
> <const@makelinux.com> wrote:
>> Hi,
>>
>> I am designing DT support for a hwmon chip.
>> It has some sensors, each of them can be:
>>  - "disabled"
>>  - "thermal diode"
>>  - "thermistor"
>>  - "voltage"
>>
>> Four possible options for DT properties format.
>>
>> Option 1: Separated property for each sensor.
>>
>> Example nct7802 node:
>>
>> nct7802 {
>>         compatible = "nuvoton,nct7802";
>>         reg = <0x2a>;
>>         nuvoton,sensor1-type = "thermistor";
>>         nuvoton,sensor2-type = "disabled";
>>         nuvoton,sensor3-type = "voltage";
>> };
>>
>> Option 2: Array of strings for all sensors.
>>
>> nct7802 {
>>         compatible = "nuvoton,nct7802";
>>         reg = <0x2a>;
>>         nuvoton,sensors-types = "thermistor", "disabled", "voltage";
>> };
>
> It seems you are just listing out all possible modes. Why do you need
> this in the DT at all? This can be inferred by the compatible string.

There are tree sensor, each of one can be one of three type ("thermal
diode", "thermistor", "voltage") or be disabled.
Also there are at least five platform depended registers, most of them
are enable/disable.
You can find full datasheet here
https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/

The question is how to describe configuration of this registers in dts.
The second option is array of types for tree registers.

>> Option 3: Sets of 4 cells.
>>
>>   Borrowed from marvell,reg-init and broadcom,c45-reg-init.
>>
>>   The first cell is the page address,
>>   the second a register address within the page,
>>   the third cell contains a mask to be ANDed with the existing register
>>   value, and the fourth cell is ORed with the result to yield the
>>   new register value. If the third cell has a value of zero,
>>   no read of the existing value is performed.
>
> I don't see how this relates to the first 2 options. The register you
> write selects the mode? In general, we don't want bindings of just
> random register writes.
>
> Rob
Option 3 allows arbitrary registers configuration.

To see the full picture you can refer to datasheet mentioned above to
function nct7802_init_chip via
http://lxr.free-electrons.com/source/drivers/hwmon/nct7802.c#L789
and proposed patch for option #2: https://lkml.org/lkml/2015/9/13/204

-- 
Thanks
Constantine
