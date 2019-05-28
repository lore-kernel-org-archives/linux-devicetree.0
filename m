From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V3 net-next 5/6] net: mdio: of: Register discovered MII
 time stampers.
Date: Mon, 27 May 2019 22:21:48 -0700
Message-ID: <20190528052148.euhxk75brsiwzixo@localhost>
References: <20190521224723.6116-6-richardcochran@gmail.com>
 <20190522012227.GA734@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522012227.GA734@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 03:22:27AM +0200, Andrew Lunn wrote:
> Shouldn't unregister_mii_timestamper() be called on error?

Yes.

Thanks,
Richard
