From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Mon, 8 Oct 2018 08:36:12 -0700
Message-ID: <20181008153612.woazb6qmk3bvj65s@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181008020439.m2cytnnv5ue7yc5l@localhost>
 <20181008150722.GC6216@lunn.ch>
 <20181008152800.u3mmtr4txt67o7jc@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008152800.u3mmtr4txt67o7jc@localhost>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 08:28:00AM -0700, Richard Cochran wrote:
> Let's stick to phylib for now.  We can cross the other bridge when we
> come to it.  Maybe the net_device->phylink will emerge for purposes
> other that time stamping.  Let's not guess about how it should look.

In fact, it is kernel policy to reject new framework that lacks users.
Even if we added new net_device->phylink hooks, I bet that davem would
reject them for that reason.  We can't just add to net_device for
vaporware.

The whole point of _this_ series is the first patch.  That new option
is important for complete PTP support, and it could be used by every
PTP hardware.  Unfortunately I only have one device in hand that
implements this, and that is the reason why you see patches 2-5.

Thanks,
Richard
