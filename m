From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 08:49:49 +0200
Message-ID: <5C928A70-2E4C-443D-A4F9-AACBF164C4BE@holtmann.org>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424201318.GA14390@amd>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424201318.GA14390@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

>> This series adds a new subsystem for GNSS receivers (e.g. GPS
>> receivers).
> 
> Actually... I'd just call it GPS subsystem. Yes, GPS is a bit
> misleading, but so is GNSS. We'd like Loran to use similar interface,
> right? We'd like to QZSS to use similar interface, too…

GNSS is the term that is known and used by everybody in the industry to identify GPS, GLONASS, Galileo etc.

> https://www.pcworld.com/article/205325/japan_launches_its_first_gps_satellite.html
> . QZSS is not _global_ positioning system. Still they call it GPS. I'd
> call it GPS too.
> 
> (Alternatively, we could have drivers/position and /dev/pos0...)
> 
> Looking closer... I'm not sure if it makes sense to push different
> protocols (SiRF, NMEA, ...) through one device. Userland should know
> what protocol to expect... Yes, there will be common code between
> /dev/nmea0 and /dev/sirf0…

Device node naming is pointless, use DEVTYPE uevent property for identifying the expected protocol.

Regards

Marcel
