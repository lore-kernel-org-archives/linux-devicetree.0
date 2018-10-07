From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 14:07:28 -0700
Message-ID: <20181007210728.nimnrijadb2skedg@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181007205906.3h7fpyxdhc24o6lc@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007205906.3h7fpyxdhc24o6lc@localhost>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 01:59:06PM -0700, Richard Cochran wrote:
> On Sun, Oct 07, 2018 at 09:54:00PM +0200, Andrew Lunn wrote:
> > 1) phylink, not phdev. We have been pushing some MAC drivers towards
> > phylink, especially those which support >1Gbp.
> 
> If a phylink device appears that wants time stamping, can't we add the
> call to register_mii_timestamper()?

Actually, I see that 'struct phylink' has a 'struct phy_device *phydev',
and so it can implement the 'struct mii_timestamper' interface directly.

Thanks,
Richard
