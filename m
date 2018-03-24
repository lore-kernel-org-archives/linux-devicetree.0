Return-Path: <SRS0=/B89=GO=gmail.com=richardcochran@kernel.org>
Date: Sat, 24 Mar 2018 10:01:37 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 3/5] net: Introduce field for the MII
 time stamper.
Message-ID: <20180324170137.j2n7ryzifrpthj2s@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <338f19a006839f1d00e3cfd3521bdd5fd0afc5fe.1521656774.git.richardcochran@gmail.com>
 <cbab700a-8a4f-8c4a-b959-e356de006f6e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbab700a-8a4f-8c4a-b959-e356de006f6e@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 12:12:00PM -0700, Florian Fainelli wrote:
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index 5fbb9f1da7fd..223d691aa0b0 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -1943,6 +1943,7 @@ struct net_device {
> >  	struct netprio_map __rcu *priomap;
> >  #endif
> >  	struct phy_device	*phydev;
> > +	struct mdio_device	*mdiots;
> 
> phy_device embedds a mdio_device, can you find a way to rework the PHY
> PTP code to utilize the phy_device's mdio instance so do not introduce
> yet another pointer in that big structure that net_device already is?

You are right in that this field is wasted space for most users.

In V2 this will be inside #ifdef CONFIG_NETWORK_PHY_TIMESTAMPING.

Thanks,
Richard
