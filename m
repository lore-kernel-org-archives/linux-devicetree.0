From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Thu, 30 Aug 2018 17:55:25 -0700
Message-ID: <20180831005524.GA67271@ban.mtv.corp.google.com>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
 <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
 <20180815014436.GA17200@ban.mtv.corp.google.com>
 <153437082071.28926.11684780766239178367@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153437082071.28926.11684780766239178367@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

(sorry for the delayed response here)

Hi,

On Wed, Aug 15, 2018 at 03:07:00PM -0700, Stephen Boyd wrote:
> Quoting Brian Norris (2018-08-14 18:44:36)
> > But anyway, would the idea be that you just put 'ethernet{0,1,...}' and
> > 'wifi{0,1,...}' aliases in the /chosen node, then require boot firmware
> > to insert any {ethernet,wifi}_mac{0,1,...} into the paths represented by
> > the corresponding aliases? I suppose that would reduce the problems with
> > (1), but it still doesn't really help with (2).
> 
> Yes. Aliases are the way to do this. It obviates much of this discussion
> about finding things in DT by directly pointing to the node the
> bootloader wants to go modify.

Sure, that does seem to help.

> > > > And finally, this may be surmountable, but the existing APIs seem very
> > > > device tree centric. We use this same format on ACPI systems, and the
> > > > current series would theoretically work on both [1]. I'd have to rewrite
> > > > the current (OF-only) helpers to get equivalent support...
> 
> Where does it go on ACPI systems? Does the firmware stick it into some
> ACPI table by reading from VPD?

I'm not aware of any ACPI system that needs to do something quite like
this. The closest I see is a Coreboot board for some Chromeboxes [1],
which handles Ethernet MAC addresses -- it does this by reading similar
VPD fields, but then it just goes and programs the MAC directly into the
Ethernet card's registers. This is a Realtek PCI Ethernet chip, and
apparently it even needs firmware to program its product and vendor ID
for it.

I'm not really sure what lesson to get out of that though. That
discoverable hardware is a giant dirty mess (even PCI gets a lot of help
from system firmware!)?

Or I guess maybe the lesson is: ACPI systems will always find a way to
do it in firmware, no matter how much bloat it costs. So I don't really
need to consider "does this solution work with ACPI"? But just, does it
work with {device,fwnode}_get_mac_address() -- e.g., by teaching them to
call of_get_nvmem_mac_address()?

Brian

[1] Here, and similar variants in other boards throughout the tree:
https://review.coreboot.org/cgit/coreboot.git/tree/src/mainboard/google/beltino/lan.c
