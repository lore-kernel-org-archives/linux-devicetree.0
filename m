From: "H. Nikolaus Schaller" <hns@computer.org>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Fri, 1 Jun 2018 18:37:36 +0200
Message-ID: <3A356534-FEB0-4E0D-A8C8-922EEF1E0926@computer.org>
References: <20180601082259.17563-1-johan@kernel.org> <20180601093311.GA31639@amd> <20180601094959.GA13775@localhost> <20180601102612.GC31639@amd> <20180601122217.GB13775@localhost> <20180601162645.GA30792@amd>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601162645.GA30792@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

> Am 01.06.2018 um 18:26 schrieb Pavel Machek <pavel@ucw.cz>:
> 
> NMEA would not be my first choice, really. I'd propose something very
> similar to existing /dev/input/eventX, but with wider data types.

Since even Rome wasn't built in a day, my first choice is NMEA, but I am
open to anything on higher level to come second.

What about iio?

It is quite flexible and extensible and GNSS coordinates are a not very
different from accelerometer, gyroscope or compass data as all of them
describe the position and orientation, maybe speed of the device these
things are built into (at least for mobile devices).

--hns
