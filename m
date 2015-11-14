From: Constantine Shulyupin <const@makelinux.com>
Subject: Re: [PATCH v8] Documentation: add Device tree bindings for hwmon/nct7802
Date: Sat, 14 Nov 2015 21:35:55 +0200
Message-ID: <CAE7jHC-63Gvp4An55TGx5ZG_Yk0ijt6-XzDNp_MXjbaUn3NNkA@mail.gmail.com>
References: <1445891057-1554-1-git-send-email-const@makelinux.com>
	<20151112172658.GA27337@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151112172658.GA27337@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lm-sensors@lm-sensors.org, Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12, 2015 at 7:26 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Oct 26, 2015 at 10:24:17PM +0200, Constantine Shulyupin wrote:
>> From: Constantine Shulyupin <const@MakeLinux.com>
>> +Optional subnodes:
>> +
>> +Sensor subnodes properties:
>> + - "compatible", allowed values:
>> +      - "nuvoton,nct7802"
>
> This should have -sensor appended?

Right.

>> + - "sensor-type", allowed values:
>> +     "thermal-diode"
>> +     "thermistor"
>> +     "voltage"
>> +     "local"
>> +     "vcore"
>> +     "vcc"
>
> These are different connections to the same h/w block in the chip? If
> so, then this is fine. If the h/w blocks are different, then it would be
> better to go back to different compatible strings.

"thermal-diode", "thermistor", "voltage",  "local" - is one H/W block
(7.2.32 Mode Selection Register, 22h)
One of above "local" - is single input, enables by one bit EnLTD

 "vcore", "vcc" - another H/W block (7.2.35 Voltage Monitor Enable
Register, 25h), each of them is different input.

I'll divide them in the next patch.

>
>> +For sensors of types "thermal-diode", "thermistor" and "voltage" required
>> + - "reg": index in range 0 .. 2
>> +
>> +Except sensor at address 2 can't be "thermal-diode".
>> +
>> +Fan subnode:
>> +
>> +Required properties:
>> + - "reg" :index of in range 0 .. 2.
>
> What does the numbering correspond to in the h/w?
The numberring corresponds to the three different temperature/voltage
inputs (RTD1_MD, RTD2_MD, RTD3_MD) and three different fans (EnFan1,
EnFan2, EnFan3, EnDCFAN*, etc)

>> +     vcc {
>> +             compatible = "nuvoton,nct7802-sensor";
>> +             sensor-type = "vcc";
>
> No unit address?
>
>> +     };
>> +     vcore {
>> +             compatible = "nuvoton,nct7802-sensor";
>> +             sensor-type = "vcore";
>> +     };

There is only one vcc anv vcore input.


-- 
Thanks
Constantine
