From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 19:04:39 -0700
Message-ID: <20181008020439.m2cytnnv5ue7yc5l@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007195400.GA25883@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 09:54:00PM +0200, Andrew Lunn wrote:
> Sure, but things have moved on since then.

I was curious about this.  Based on your uses cases, I guess that you
mean phylib?  But not much has changed AFAICT. (There is one new
global function and two were removed, but that doesn't change the
picture WRT time stamping.)

Phylink now has two or three new users, one of which is dsa.  Is that
the big move?

The situation with MACs that handle their own PHYs without phylib is
unchanged, AFAICT.

So what exactly do you mean?

Thanks,
Richard
