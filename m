From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Mon, 7 May 2018 12:01:35 +0200
Message-ID: <20180507100135.GS2285@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-5-johan@kernel.org>
 <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
 <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
 <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
 <20180503205037.7be552c1@aktux>
 <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
 <20180504114213.3xlzqxe74n55tk5s@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504114213.3xlzqxe74n55tk5s@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 04, 2018 at 01:42:13PM +0200, Sebastian Reichel wrote:

> Having said all of this, serdev does not yet support runtime PM (at
> all). Tony is currently looking into it. Fortunately serdev allows
> us to enable runtime PM by default (once implemented), since we know
> the remote side and can (hopefully) avoid losing characters (i.e.
> with sideband wakeup gpios).

I'm not sure we want generic runtime-pm support for the controllers in
the sense that the slave device state is always reflected by the serial
controller. Similar as for i2c and spi, we really only want to keep the
controller active when we are doing I/O, but we may want to keep a
client active for longer.

Take the u-blox driver in this series for example. As I'm using runtime
PM to manage device power, user-space can chose to prevent the receiver
from runtime suspending in order to avoid lengthy (re-)acquisition times
in setups without a backup battery (by means of the power/control
attribute).

Note that serdev not enabling runtime pm for controllers is roughly
equivalent to setting the .ignore_children flag, which is what we do for
i2c and spi controller, and possibly what we want here too.

Thanks,
Johan
