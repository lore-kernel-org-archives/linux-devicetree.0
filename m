From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/5] Add support for WD MyCloud EX2 Ultra (+ versatile
 UART-based restart/poweroff drivers)
Date: Tue, 23 Jul 2019 03:56:31 +0200
Message-ID: <20190723015631.GI8972@lunn.ch>
References: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeny Kolesnikov <evgenyz@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 09:53:00PM +0200, Evgeny Kolesnikov wrote:
> This patchset consists of the DTS, which describes the WD MyCloud EX2 Ultra device,
> 'poweroff' and 'resert' drivers for power-managing MCUs connected to a board via UART
> (these drivers are more versatile than qnap-poweroff and could be used as a substitude),
> and DT bindings for these drivers.
> 
> The difference between uart-poweroff and qnap-poweroff is small, but important:
> uart-poweroff is able to send to an MCU a command of arbitrary length, and the command
> itself is defined in a DTS file for a specific device/board, thus making this driver
> applicable to wider range of devices.

Hi Evgeny

There is a lot of replicated code here, and in the original
qnap-poweroff.c driver. Please consolidate it by extending the current
driver. It should be easy to add a new compatible string, and turn
power_off_cfg.cmd into an array.

	  Andrew
