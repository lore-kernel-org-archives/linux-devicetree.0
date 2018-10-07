From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 20:27:51 +0200
Message-ID: <20181007182751.GC22794@lunn.ch>
References: <20181007173823.21590-3-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007173823.21590-3-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 10:38:20AM -0700, Richard Cochran wrote:
> Currently the stack supports time stamping in PHY devices.  However,
> there are newer, non-PHY devices that can snoop an MII bus and provide
> time stamps.  In order to support such devices, this patch introduces
> a new interface to be used by both PHY and non-PHY devices.
> 
> In addition, the one and only user of the old PHY time stamping API is
> converted to the new interface.

Hi Richard

I'm a bit undecided about this. If you look at how we do HWMON sensors
in PHYs, the probe function just registers with the HWMON subsystem.
We don't have any support in phy_device, or anywhere else in the PHY
core.

The mii_timestamper is generic, in the same why hwmon is generic. It
does not matter where the time stamper is. So i'm wondering if we
should remove the special case for a PHY timestamper, remove all the
phylib support, etc.

I need to look at the other patches and see how this all fits
together.

	Andrew
