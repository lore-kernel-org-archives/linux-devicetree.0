From: Constantine Shulyupin <const@makelinux.com>
Subject: Re: [PATCH v3] Documentation: add Device tree bindings for hwmon/nct7802
Date: Tue, 8 Sep 2015 16:49:04 +0300
Message-ID: <CAE7jHC8g5GGoNb8-sa0AhVm6eK8o33=wMqWO6m45Lr35kUxdgA@mail.gmail.com>
References: <1441664902-32360-1-git-send-email-const@MakeLinux.com>
	<20150908093812.GA19039@leverpostej>
	<CAE7jHC8tdQCj-qcToBd+y017WZwMMeODGmm4uinMX=nL4yrSKw@mail.gmail.com>
	<20150908124751.GB20562@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150908124751.GB20562@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Sure, but why do you need _raw_ register values?
>
> Why can you not encode this in the DT in a manner that describes what is
> connected to this device, then have the kernel figure out any particular
> values that need to be poked into registers?
>
> That'll be easier to read, and it's far more likely people will get
> things correct in a dts.
>
> Mark.

Theoretically it is possible to use function store_temp_type
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drivers/hwmon/nct7802.c#n87
to set sensors types.
With ABI codes:
 3 - thermal diode
 4 - thermistor

But:
- Sensor type could be also voltage and is mapped to in_input
attributes. Generic code would be over complicated.
- For low level programmers and PCB engineers is much more comfortable
and error safe
to works with datasheets, registers and bits than with fancy "human
readable" configuration.
- Mapping between raw bits and ABI is not intuitive. More simple and
directed configuration is preferable.

-- 
Thanks
Constantine
