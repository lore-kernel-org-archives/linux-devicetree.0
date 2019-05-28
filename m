From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V3 net-next 3/6] net: Add a layer for non-PHY MII time
 stamping drivers.
Date: Mon, 27 May 2019 22:19:34 -0700
Message-ID: <20190528051934.wpoz6uuwwqwlr7gw@localhost>
References: <20190521224723.6116-4-richardcochran@gmail.com>
 <20190522010852.GE6577@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522010852.GE6577@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 03:08:52AM +0200, Andrew Lunn wrote:
> probe_channel returns an PTR_ERR. So if (mii_ts) should probably be
> if (IS_ERR(mii_ts))

Nice catch.  Thanks for the careful review!

Richard
