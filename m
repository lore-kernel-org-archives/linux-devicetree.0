From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: Handling of EPROBE_DEFER in of_get_mac_address [Was: Re: [PATCH
 v2 3/4] net: macb: Drop nvmem_get_mac_address usage]
Date: Wed, 1 May 2019 15:54:17 +0200
Message-ID: <20190501135417.GB19809@lunn.ch>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-4-git-send-email-ynezz@true.cz>
 <20190428165637.GJ23059@lunn.ch>
 <20190428210814.GA346@meh.true.cz>
 <20190428213640.GB10772@lunn.ch>
 <20190429075514.GB346@meh.true.cz>
 <20190429130248.GC10772@lunn.ch>
 <20190430141335.GC346@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430141335.GC346@meh.true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 04:13:35PM +0200, Petr Štetiar wrote:
> Andrew Lunn <andrew@lunn.ch> [2019-04-29 15:02:48]:
> 
> Hi Andrew,
> 
> > > My understanding of -PROBE_DEFER is, that it needs to be propagated back from
> > > the driver's probe callback/hook to the upper device/driver subsystem in order
> > > to be moved to the list of pending drivers and considered for probe later
> > > again. This is not going to happen in any of the current drivers, thus it will
> > > probably still always result in random MAC address in case of -EPROBE_DEFER
> > > error from the nvmem subsystem.
> > 
> > All current drivers which don't look in NVMEM don't expect
> > EPROBE_DEFER. 
> 
> once there's NVMEM wired in of_get_mac_address, one can simply use it, nothing
> is going to stop the potential user of doing so and if EPROBE_DEFER isn't
> propagated from the driver back to the upper device driver subsytem, it's
> probably going to end with random MAC address in some (very rare?) cases.

Hi Petr

There is no simple answer here. If we add EPROBE_DEFER support to all
the current drivers using of_get_mac_address(), we are likely to break
something. Regressions are bad. If somebody does add NVMEM properties
to a device which does not currently have them, and it fails, that it
just bad testing, not a regressions.

So i would keep it KISS. Allow of_get_mac_address() to return an
error, but don't modify current drivers to look for it.

       Andrew
