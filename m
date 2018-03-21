Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 14:45:13 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 2/5] net: phy: Move time stamping
 interface into the generic mdio layer.
Message-ID: <20180321214513.5kkw4qpbhp3juxur@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <b032dcdb34684e3831530da1bb198c764e61968b.1521656774.git.richardcochran@gmail.com>
 <e6c7b4e1-9449-58be-f670-4b6a8aa4b526@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c7b4e1-9449-58be-f670-4b6a8aa4b526@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 12:10:07PM -0700, Florian Fainelli wrote:
> > +	phydev->mdio.ts_info = dp83640_ts_info;
> > +	phydev->mdio.hwtstamp = dp83640_hwtstamp;
> > +	phydev->mdio.rxtstamp = dp83640_rxtstamp;
> > +	phydev->mdio.txtstamp = dp83640_txtstamp;
> 
> Why is this implemented a the mdio_device level and not at the
> mdio_driver level? This looks like the wrong level at which this is done.

The question could be asked of:

struct mdio_device {
	int (*bus_match)(struct device *dev, struct device_driver *drv);
	void (*device_free)(struct mdio_device *mdiodev);
	void (*device_remove)(struct mdio_device *mdiodev);
}

I saw how this is done for the phy, etc, but I don't see any benefit
of doing it that way.  It would add an extra layer (or two) of
indirection and save the space four pointer functions.  Is that
trade-off worth it?

Thanks,
Richard
