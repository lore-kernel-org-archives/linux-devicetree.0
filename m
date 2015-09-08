Return-Path: <linux@roeck-us.net>
Message-ID: <55EEF22B.1060906@roeck-us.net>
Date: Tue, 08 Sep 2015 07:35:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Subject: Re: [PATCH v3] Documentation: add Device tree bindings for hwmon/nct7802
References: <1441664902-32360-1-git-send-email-const@MakeLinux.com>	<20150908093812.GA19039@leverpostej>	<CAE7jHC8tdQCj-qcToBd+y017WZwMMeODGmm4uinMX=nL4yrSKw@mail.gmail.com>	<20150908124751.GB20562@leverpostej> <CAE7jHC8g5GGoNb8-sa0AhVm6eK8o33=wMqWO6m45Lr35kUxdgA@mail.gmail.com>
In-Reply-To: <CAE7jHC8g5GGoNb8-sa0AhVm6eK8o33=wMqWO6m45Lr35kUxdgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Constantine Shulyupin <const@makelinux.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Constantine,

On 09/08/2015 06:49 AM, Constantine Shulyupin wrote:
>> Sure, but why do you need _raw_ register values?
>>
>> Why can you not encode this in the DT in a manner that describes what is
>> connected to this device, then have the kernel figure out any particular
>> values that need to be poked into registers?
>>
>> That'll be easier to read, and it's far more likely people will get
>> things correct in a dts.
>>
>> Mark.
>
> Theoretically it is possible to use function store_temp_type
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drivers/hwmon/nct7802.c#n87
> to set sensors types.
> With ABI codes:
>   3 - thermal diode
>   4 - thermistor
>
> But:
> - Sensor type could be also voltage and is mapped to in_input
> attributes. Generic code would be over complicated.
> - For low level programmers and PCB engineers is much more comfortable
> and error safe
> to works with datasheets, registers and bits than with fancy "human
> readable" configuration.
> - Mapping between raw bits and ABI is not intuitive. More simple and
> directed configuration is preferable.
>

Mark is asking why you don't have a 'sensor-type' property (or similar).
This is not an ABI issue, since the sensor type is determined by the PCB,
not by user space configuration. The only reason to have the attribute
writable in the ABI is to be able to support hardware where for some
reason the hardware parameters configured by the BIOS or ROMMON
are wrong, not as primary means to set the sensor type. Actually,
in an automated system where the temperature is used for automatic
fan control, waiting for user space to configure the chip might be fatal.

As for your other arguments, pretty much all other devicetree properties
use logical values instead of raw register values. It appears that the
low level programmers and PCB engineers responsible for writing devicetree
files must be able to handle that level of abstraction. And I really
would content that it is easier to write
	sensor-type = "thermistor";
than forcing people to look up the datasheet when writing devicetree
files.

Thanks,
Guenter
