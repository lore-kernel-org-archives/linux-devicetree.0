From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 12:15:51 -0700
Message-ID: <20181007191551.gy4l4g6qdgz6ztez@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007182751.GC22794@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 08:27:51PM +0200, Andrew Lunn wrote:
> The mii_timestamper is generic, in the same why hwmon is generic. It
> does not matter where the time stamper is. So i'm wondering if we
> should remove the special case for a PHY timestamper, remove all the
> phylib support, etc.

This implementation is (to the best of my understanding) what you were
asking for in your review of v1:

> So i really think you need to cleanly integrate into phylib and
> phylink.

> Use a phandle, and have
> of_mdiobus_register_phy() follow the phandle to get the device.

> To keep lifecycle issues simple, i would also keep it in phydev, not
> netdev.

This present series is a reasonable, incremental improvement to the
existing PHY time stamping support.  It will handle any use case that
I can think of, and I would like to avoid over-engineering this.

Thanks,
Richard
