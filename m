From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Fri, 16 Aug 2019 14:27:28 -0700
Message-ID: <20190816212728.GW250418@google.com>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
 <20190816201342.GB1646@bug>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816201342.GB1646@bug>
Sender: netdev-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 10:13:42PM +0200, Pavel Machek wrote:
> On Tue 2019-08-13 12:11:47, Matthias Kaehlcke wrote:
> > Add a .config_led hook which is called by the PHY core when
> > configuration data for a PHY LED is available. Each LED can be
> > configured to be solid 'off, solid 'on' for certain (or all)
> > link speeds or to blink on RX/TX activity.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> THis really needs to go through the LED subsystem,

Sorry, I used what get_maintainers.pl threw at me, I should have
manually cc-ed the LED list.

> and use the same userland interfaces as the rest of the system.

With the PHY maintainers we discussed to define a binding that is
compatible with that of the LED one, to have the option to integrate
it with the LED subsystem later. The integration itself is beyond the
scope of this patchset.

The PHY LED configuration is a low priority for the project I'm
working on. I wanted to make an attempt to upstream it and spent
already significantly more time on it than planned, if integration
with the LED framework now is a requirement please consider this
series abandonded.
