From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Mon, 8 Oct 2018 08:28:00 -0700
Message-ID: <20181008152800.u3mmtr4txt67o7jc@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181008020439.m2cytnnv5ue7yc5l@localhost>
 <20181008150722.GC6216@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008150722.GC6216@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org


On Mon, Oct 08, 2018 at 05:07:22PM +0200, Andrew Lunn wrote:
> So as you said, the phylib API has not changed much, which is common
> for mature code.

I meant that phy-LINK hasn't changed much.

> But i think long term, it will become less important.
> It will share the space with phylink. And any code which wants to be
> generically usable, should not depend on phydev.

Thanks for your view of the big picture.

> Architecturally, it
> seems wrong for you to hang what should be a generic time stamping
> framework on phydev. It is not future proof. net_device is future
> proof.

You still haven't said how net_device is going to work.

Today there are exactly zero phylink devices needing time stamping
support, but there are new phylib devices.  We don't have a
net_device->phylink connection, and it isn't needed yet.  Adding that
is way out of scope for this series.

Let's stick to phylib for now.  We can cross the other bridge when we
come to it.  Maybe the net_device->phylink will emerge for purposes
other that time stamping.  Let's not guess about how it should look.

We are only talking about kernel interfaces here, and so nothing is
set in stone.

Thanks,
Richard
