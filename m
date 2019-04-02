From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/5] Add bluetooth, gps and accelerometer to TBS A711
Date: Tue, 2 Apr 2019 10:28:52 +0200
Message-ID: <20190402082852.GL12562@localhost>
References: <20190401115616.21337-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401115616.21337-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: maxime.ripard@free-electrons.com, wens@csie.org, robh@kernel.org, johan@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 01, 2019 at 01:56:11PM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> This series enables some peripherals on TBS A711 tablet that already
> have mainline drivers:
> 
> - GPS u-blox neo-6m (via gnss u-blox driver)
> - Bluetooth (via recently added OF support in the Broadcom
>   bluetooth driver)
> - Accelermomter BMA-250 (hooked to the I2C bus)
> 
> It also modifies A83T DTSI and adds missing UART interfaces.
> 
> I've added additional compatible to the gnss/u-blox driver for NEO-6M,
> because this board uses this module, and I don't think I can use
> the existing compatible for u-blox,neo-m8, even as a fallback.
> 
> Please take a look, and apply the patches if you have no objections.
> 
> Many of the patches will go through the sunxi tree, but I'm not
> sure who will want to take the GPS patches.

I'll take the GPS patches through my tree once I've had a chance to
review them. Perhaps easiest to resend the corresponding dts change once
that is done.

Johan
