From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 8 May 2018 09:49:36 +0200
Message-ID: <C8F35484-132F-466C-B87F-B209B2BC8B37@holtmann.org>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe>
 <20180507102056.GU2285@localhost>
 <FA27606D-AB12-4D62-8EBD-3CC6F0900AF7@holtmann.org>
 <20180508070153.GX2285@localhost>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508070153.GX2285@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Johan,

>>>> I have one concern, though. While providing raw data by
>>>> default is fine generally, it is a problem with device
>>>> auto-discovery. I think there should be some IOCTL from
>>>> the start, that can be used to inform userspace about
>>>> the raw protocol being used (i.e. "NMEA"). I fear, that
>>>> userspace may start to just assume raw = NMEA without
>>>> having this (especially since all initial drivers provide
>>>> NMEA).
>>> 
>>> One problem I see here would be that the driver does not necessarily
>>> know either what protocol is currently being used. Some devices have
>>> boot-pins which can be used to configure the initial protocol used (and
>>> this could perhaps be reflected in DT), but this can often later be
>>> changed (by user space) and even be made persistent using battery-backed
>>> ram or eeproms.
>>> 
>>> Also note that at least u-blox devices supports having more than one
>>> protocol active on the same port...
>> 
>> as long as userspace can determine that it is GNSS hardware and what
>> hardware it is, then you deal with the rest in userspace.
> 
> Yeah, I think that will do for now.

I forgot to mention that this part should be simple. So providing a DEVTYPE attribute that can be easily associated to the /dev/gnssX nodes is a must have here. Doing complex mapping of USB or DT layouts to figure out this is NMEA vs some vendor vs I need extra code to change the mode etc.

So a proper GNSS daemon will require some hardware abstraction anyway. There will be still a few GNSS devices that are part of the cellular modem, where you have to go via the telephony daemon to get access to it. We have done this within oFono since there would be otherwise no access to it. So only extra pieces that could be done here is to provide a /dev/ugnss (like /dev/uinput, /dev/uhid) so that you can emulate GNSS hardware from userspace as well. In oFono, we could then just hook this up with /dev/ugnss and the GNSS daemon would not have to have to know how to talk to oFono.

Regards

Marcel
