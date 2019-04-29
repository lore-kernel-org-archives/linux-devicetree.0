From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/4] net: macb: Drop nvmem_get_mac_address usage
Date: Mon, 29 Apr 2019 15:02:48 +0200
Message-ID: <20190429130248.GC10772@lunn.ch>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-4-git-send-email-ynezz@true.cz>
 <20190428165637.GJ23059@lunn.ch>
 <20190428210814.GA346@meh.true.cz>
 <20190428213640.GB10772@lunn.ch>
 <20190429075514.GB346@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190429075514.GB346@meh.true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 29, 2019 at 09:55:14AM +0200, Petr Štetiar wrote:
> Andrew Lunn <andrew@lunn.ch> [2019-04-28 23:36:40]:
> 
> Hi Andrew,
> 
> > > so if I understand this correctly, it probably means, that this approach with
> > > modified of_get_mac_address is dead end as current of_get_mac_address users
> > > don't expect and handle possible -EPROBE_DEFER error, so I would need to
> > > change all the current users, which is nonsense.
> > 
> > I would not say it is dead, it just needs a bit more work.
> 
> ok, that's good news, I've probably just misunderstood your concern about the
> random MAC address in case when platform/nvmem subsystem returns -EPROBE_DEFER.
> 
> > The current users should always be checking for a NULL pointer.  You
> > just need to change that to !IS_ERR(). You can then return
> > ERR_PTR(-PROBE_DEFER) from the NVMEM operation.
> 
> I'm more then happy to address this in v3, but I'm still curious, what is it
> going to change in the current state of the tree. 
> 
> My understanding of -PROBE_DEFER is, that it needs to be propagated back from
> the driver's probe callback/hook to the upper device/driver subsystem in order
> to be moved to the list of pending drivers and considered for probe later
> again. This is not going to happen in any of the current drivers, thus it will
> probably still always result in random MAC address in case of -EPROBE_DEFER
> error from the nvmem subsystem.

Hi Petr

All current drivers which don't look in NVMEM don't expect
EPROBE_DEFER. So not returning it as the result of the probe is fine.
The one driver which does expect EPROBE_DEFER already has the code to
handle it.

What you have to be careful of, is the return value from your new code
looking in NVMEM. It should only return EPROBE_DEFER, or another error
if there really is expected to be a value in NVMEM, or getting it from
NVMEM resulted in an error.

I've not looked at the details of nvmem_get_mac_address(), but it
should be a two stage process. The first is to look in device tree to
find the properties. Device tree is always accessible. So performing a
lookup will never return EPROBE_DEFER. If there are no properties, it
probably return -ENODEV. You need to consider that as not being a real
error, since these are optional properties. of_get_mac_address() needs
to try the next source of the MAC address. The second stage is to look
into the NVMEM. That could return -EPROBE_DEFER and you should return
that error, or any other error at this stage. The MAC address should
exist in NVMEM so we want to know about the error.

      Andrew
