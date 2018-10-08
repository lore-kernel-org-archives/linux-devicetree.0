From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Mon, 8 Oct 2018 17:07:22 +0200
Message-ID: <20181008150722.GC6216@lunn.ch>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181008020439.m2cytnnv5ue7yc5l@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008020439.m2cytnnv5ue7yc5l@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 07:04:39PM -0700, Richard Cochran wrote:
> On Sun, Oct 07, 2018 at 09:54:00PM +0200, Andrew Lunn wrote:
> > Sure, but things have moved on since then.
> 
> I was curious about this.  Based on your uses cases, I guess that you
> mean phylib?  But not much has changed AFAICT. (There is one new
> global function and two were removed, but that doesn't change the
> picture WRT time stamping.)
> 
> Phylink now has two or three new users, one of which is dsa.  Is that
> the big move?
> 
> The situation with MACs that handle their own PHYs without phylib is
> unchanged, AFAICT.
> 
> So what exactly do you mean?

Hi Richard

We are pushing phylink. I really do think anything using > 1Gbps links
should be using phylink, not phydev. And i think we have reached the
tipping point, that most new MACs will be > 1Gbps. 2.5G or maybe 5G
will be the new default. The MAC-PHY link is quiet messy when you get
above 1G. There are a number of options which you can use, and the MAC
and PHY need to negotiate a common set to use. phylink can do this,
phylib cannot easily do it. So i see phylib slowly becoming a legacy
API for MAC drivers.

We are also slowly seeing more SFPs, and Linux controlling them. SFP
are not new, they have been in top end switches for a long time. But
they are slowly becoming more popular in industrial settings, and such
embedded industrial systems tend to let Linux control them, not
firmware. And i think industry makes more use of PTP than other
fields, but i could be wrong. Since optical SFP modules are passive, a
bump-in-the-wire time stamper actually makes sense for these.

Also, fibre on the last mile is slowly becoming more of a thing, so
maybe we will start seeing CPE, consumer routers, with SFP ports?

As i said before, we are seeing more MACs which use firmware for
controlling the PHYs. I'm not sure why yet. Maybe it is coupled with
more MACs supporting > 1G, which is messy. Or the lack of good PHY
drivers for PHYs which support > 1G? Hopefully the drivers will
improve with time.

So as you said, the phylib API has not changed much, which is common
for mature code. But i think long term, it will become less important.
It will share the space with phylink. And any code which wants to be
generically usable, should not depend on phydev. Architecturally, it
seems wrong for you to hang what should be a generic time stamping
framework on phydev. It is not future proof. net_device is future
proof.

	  Andrew
