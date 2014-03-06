From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: add Device Tree for the Armada 385 RD board
Date: Thu, 6 Mar 2014 15:46:00 +0100
Message-ID: <20140306144600.GM4780@lunn.ch>
References: <1394107868-26094-1-git-send-email-gregory.clement@free-electrons.com>
 <20140306131429.GJ4780@lunn.ch>
 <5318779C.8030901@free-electrons.com>
 <20140306142117.GL4780@lunn.ch>
 <531886B4.2070002@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <531886B4.2070002-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >>> I think you can use aliases to get the order correct, independent of
> >>> how you list them in DT. That should be a lot safer than assuming
> >>> things are instantiated from top to bottom.
> >>
> >> It sounds interesting, how would you do this?
> > 
> > As there already is in armada-370-xp.dtsi
> > 
> >         aliases {
> >                 eth0 = &eth0;
> >                 eth1 = &eth1;
> >         };
> > 
> > 
> > 	eth0: ethernet@70000 {
> > 	}
> >         eth1: ethernet@74000 {
> > 	}
> > 
> > This at least works for i2c devices. The pdev->id is set using the
> > alias number.
> 
> Well I think it doesn't work with ethernet devices because we already do
> this in aramda-38x.dtsi:
> 
> 	aliases {
> 		gpio0 = &gpio0;
> 		gpio1 = &gpio1;
> 		eth0 = &eth0;
> 		eth1 = &eth1;
> 		eth2 = &eth2;
> 	};
> 
> 	eth1: ethernet@30000 {
> 	}
> 	eth2: ethernet@34000 {
> 	}
> 	eth0: ethernet@70000 {
> 	}

Ah, Erm, O.K. 

It seems to be an i2c thing. Take a look at i2c_add_adapter().

        if (dev->of_node) {
                id = of_alias_get_id(dev->of_node, "i2c");
 
You could put something similar into the ethernet driver.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
