From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Mon, 7 May 2018 21:06:44 +0200
Message-ID: <FA27606D-AB12-4D62-8EBD-3CC6F0900AF7@holtmann.org>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
 <20180507102056.GU2285@localhost>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507102056.GU2285@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Johan,

>>> This series adds a new subsystem for GNSS receivers (e.g. GPS
>>> receivers).
>>> 
>>> While GNSS receivers are typically accessed using a UART interface they
>>> often also support other I/O interfaces such as I2C, SPI and USB, while
>>> yet other devices use iomem or even some form of remote-processor
>>> messaging (rpmsg).
>>> 
>>> The new GNSS subsystem abstracts the underlying interface and provides a
>>> new "gnss" class type, which exposes a character-device interface (e.g.
>>> /dev/gnss0) to user space. This allows GNSS receivers to have a
>>> representation in the Linux device model, something which is important
>>> not least for power management purposes and which also allows for easy
>>> detection and (eventually) identification of GNSS devices.
>>> 
>>> Note that the character-device interface provides raw access to whatever
>>> protocol the receiver is (currently) using, such as NMEA 0183, UBX or
>>> SiRF Binary. These protocols are expected to be continued to be handled
>>> by user space for the time being, even if some hybrid solutions are also
>>> conceivable (e.g. to have kernel drivers issue management commands).
> 
>> Great work. I like your design decisions. I have quite a few devices
>> with have non-serial based GPS peripherals using binary protocols (*).
>> As far as I can see it should be possible to add support for those.
> 
> Thanks! Yeah, the aim here was to abstract the actual I/O interface
> used.
> 
>> I have one concern, though. While providing raw data by
>> default is fine generally, it is a problem with device
>> auto-discovery. I think there should be some IOCTL from
>> the start, that can be used to inform userspace about
>> the raw protocol being used (i.e. "NMEA"). I fear, that
>> userspace may start to just assume raw = NMEA without
>> having this (especially since all initial drivers provide
>> NMEA).
> 
> One problem I see here would be that the driver does not necessarily
> know either what protocol is currently being used. Some devices have
> boot-pins which can be used to configure the initial protocol used (and
> this could perhaps be reflected in DT), but this can often later be
> changed (by user space) and even be made persistent using battery-backed
> ram or eeproms.
> 
> Also note that at least u-blox devices supports having more than one
> protocol active on the same port...

as long as userspace can determine that it is GNSS hardware and what hardware it is, then you deal with the rest in userspace.

Regards

Marcel
