From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Sun, 6 May 2018 08:47:34 +0200
Message-ID: <31DFBFE6-5E04-4C1E-863A-33DC9EFA1219@holtmann.org>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180504132741.brn5jqv5ufjhp7ky@earth.universe> <20180504200315.GA22519@amd>
 <20180505172847.qqpqkrfspak53sc6@earth.universe> <20180505211129.GA762@amd>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180505211129.GA762@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

>>>> (*) I have those in mind:
>>>> 
>>>> Nokia N900: The phone has GPS integrated into the modem and uses
>>>> ISI encapsulated data. The protocol has been reverse engineered
>>>> and it should be possible to write a kernel driver for handling
>>>> the GPS packets and dumping the raw data to /dev/gnss0. I don't
>>>> think this is particularly useful without a non-raw interface,
>>>> though. It would still require a custom userspace implementation.
>>> 
>>> Actually... in this case it would be nice to do the protocol
>>> processing in kernel and just present reasonable interface to
>>> userland... or maybe NMEA.
>> 
>> Converting a binary protocol to NMEA, which needs to be string
>> parsed is not very nice. I think first step would be to write a
>> simple driver, which exposes the binary location protocol without
>> ISI header. Then in a second step we can think about a reasonable
>> interface, that should be supported by all GNSS devices.
> 
> Well, most of the userspace expects NMEA. So yes, its an ugly
> protocol, but .. it is not really a high-performance device.
> 
> I'd suggest modeling this over input subsystem. We could use similar
> tag/value/sync protocol (evdev). In similar way /dev/input/mice was
> used for running legacy apps during transition, we'd have /dev/...//nmea.

I would _not_ model it after the input system. And /dev/input/mice was a really bad design choice. It was there because userspace was too stupid.

>>>> Droid 4: GPS is similar to N900, but different protocol and QMI
>>>> encapsulated. This one also has known protocol with userspace
>>>> implementation. I did not yet have a detailed look, if its possible
>>>> to (un)wrap this in the kernel.
>>> 
>>> So, this is actually NMEA over QMI. I do have patches libqmi that
>>> provides NMEA on stdout.
>> 
>> Ok. So raw data is NMEA for this one. Should be reasonably easy to
>> write a driver exposing this via /dev/gnss device.
> 
> If we have qmi implementation somewhere in kernel. Do we?

Not in a way that it can easily be hooked up, but essentially the QMUX part and everything around it needs to be done in the kernel. Like Phonet and CAIF have been done before that.

>>> But there seems to be another possibile interface (yes, that modem is
>>> crazy, and you can talk to it over few different interfaces), and
>>> that's NMEA over GSM07.10. That one should be feasible to decode in
>>> kernel and just provide NMEA to userland.
>> 
>> I think both should be feasible. I suggest to wait a bit more
>> until you and Tony figured out some more details. You've got
>> the libqmi patch as workaround for now and we want a stable API
>> later.
> 
> I do have the gsm07.10 one now, too. That one is certainly simple
> enough (and should eat less power -- no need to keep USB running).

Someone also needs to make the GSM 07.10 multiplexer code serdev aware. Since currently it is a line discipline and that is not really needed. In case this is a USB serial, it might be better to be hooked up directly into GSM 07.10 without even going through serdev.

Regards

Marcel
