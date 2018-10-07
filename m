From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 4/5] net: mdio: of: Register discovered MII
 time stampers.
Date: Sun, 7 Oct 2018 21:57:44 +0200
Message-ID: <20181007195744.GB25883@lunn.ch>
References: <20181007173823.21590-5-richardcochran@gmail.com>
 <8a238abb-dfaa-54b4-1c10-86fa619f41e3@gmail.com>
 <20181007181754.GA22794@lunn.ch>
 <20181007192627.33nfcc27mvyqxbdy@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007192627.33nfcc27mvyqxbdy@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 12:26:27PM -0700, Richard Cochran wrote:
> On Sun, Oct 07, 2018 at 08:17:54PM +0200, Andrew Lunn wrote:
> > > > +	if (err == -ENOENT)
> > > > +		return NULL;
> > > > +	else if (err)
> > > > +		return ERR_PTR(err);
> > > > +
> > > > +	if (args.args_count >= 1)
> > > > +		port = args.args[0];
> > > 
> > > If it's greater than one, than it is an error, and it should be flagged
> > > as such.
> > > 
> > > The idea looks good though, should of_find_mii_timestamper() somehow be
> > > made conditional to CONFIG_PTP and we should have a stub for when it is
> > > disabled?
> > 
> > Hi Florian
> > 
> > There already is a stub. But register return -EOPNOTSUPP.
> 
> The stub returns NULL...

Ah, sorry, it is register_mii_tstamp_controller() which return
-EOPNOTSUP.

	Andrew
