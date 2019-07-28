From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/5] Add support for WD MyCloud EX2 Ultra (+ versatile
 UART-based restart/poweroff drivers)
Date: Sun, 28 Jul 2019 15:20:47 +0200
Message-ID: <20190728132047.GA8718@xo-6d-61-c0.localdomain>
References: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeny Kolesnikov <evgenyz@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon 2019-07-22 21:53:00, Evgeny Kolesnikov wrote:
> This patchset consists of the DTS, which describes the WD MyCloud EX2 Ultra device,
> 'poweroff' and 'resert' drivers for power-managing MCUs connected to a board via UART
> (these drivers are more versatile than qnap-poweroff and could be used as a substitude),
> and DT bindings for these drivers.
> 
> The difference between uart-poweroff and qnap-poweroff is small, but important:
> uart-poweroff is able to send to an MCU a command of arbitrary length, and the command
> itself is defined in a DTS file for a specific device/board, thus making this driver
> applicable to wider range of devices.
> 
>  drivers/power/reset/uart-poweroff.c           | 155 +++++++++
>  drivers/power/reset/uart-restart.c            | 204 ++++++++++++

These twon really need to be combined somehow.

Plus... does it have mini-16550 driver in it? Should it use serdev instead?
										Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
