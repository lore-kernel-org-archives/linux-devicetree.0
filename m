From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/5] Add support for WD MyCloud EX2 Ultra (+ versatile
 UART-based restart/poweroff drivers)
Date: Wed, 24 Jul 2019 00:06:28 +0200
Message-ID: <20190723220628.GA13517@lunn.ch>
References: <cover.1563822216.git.evgenyz@gmail.com>
 <20190723015631.GI8972@lunn.ch>
 <c2ffe662-6975-351b-87b8-af760984ef4d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c2ffe662-6975-351b-87b8-af760984ef4d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeny Kolesnikov <evgenyz@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 07:48:49PM +0200, Evgeny Kolesnikov wrote:
> On 23/07/2019 03:56, Andrew Lunn wrote:
> >On Mon, Jul 22, 2019 at 09:53:00PM +0200, Evgeny Kolesnikov wrote:
> >>
> >>The difference between uart-poweroff and qnap-poweroff is small, but important:
> >>uart-poweroff is able to send to an MCU a command of arbitrary length, and the command
> >>itself is defined in a DTS file for a specific device/board, thus making this driver
> >>applicable to wider range of devices.
> >
> >There is a lot of replicated code here, and in the original
> >qnap-poweroff.c driver. Please consolidate it by extending the current
> >driver. It should be easy to add a new compatible string, and turn
> >power_off_cfg.cmd into an array.
> 
> Hi, Andrew.
> 
> I've considered extending qnap driver, but I have some doubts about this
> approach.
> 
> First of all there is only a poweroff counterpart. As there is no
> qnap-restart driver, what should I do with uart-restart? Is it OK to have
> xxx-restart-poweroff driver (never saw anything like that)?

Hi Evgeny

There are a few options. You can refactor all the code into a library
and small drivers which wrap around the library. Or you can make the
driver handle both, using the compatible string to determine which it
should do.
 
> While I can add cmd as a parameter to qnap driver (having it converted
> into an array) it should be optional as original qnap relies on two
> hardcoded values for its devices.

That is not what i meant. You can make the current code more generic
by changing the single byte in power_off_cfg to an array. DT should
describe the hardware, not bytes you poke into registers. So it is
perfectly valid to have the bytes hard coded in the driver.

	  Andrew
