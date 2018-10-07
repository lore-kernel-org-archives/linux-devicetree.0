From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 4/5] net: mdio: of: Register discovered MII
 time stampers.
Date: Sun, 7 Oct 2018 12:23:41 -0700
Message-ID: <20181007192341.rkwqxxhjqf4dctkl@localhost>
References: <20181007173823.21590-5-richardcochran@gmail.com>
 <8a238abb-dfaa-54b4-1c10-86fa619f41e3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8a238abb-dfaa-54b4-1c10-86fa619f41e3@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 11:14:38AM -0700, Florian Fainelli wrote:
> There appears to be a binding document missing to describe what a
> timerstamper provider is. Using a more specific name than
> "#phandle-cells" is preferred when dealing with specific devices, e.g:
> 
> interrupt-controller/#interrupt-cells
> clocks/#clock-cells

Sure.

> So I would go with #timestamp-cells here, and define what the cell sie
> and format should be in a separate "dt-bindings" prefixed patch that the
> Device Tree folks can also comment on.

I documented this in the last patch.  I didn't see any example in our
device tree that explains a "reference" like this that is not
connected to a specific node type.

> 
> > +	if (err == -ENOENT)
> > +		return NULL;
> > +	else if (err)
> > +		return ERR_PTR(err);
> > +
> > +	if (args.args_count >= 1)
> > +		port = args.args[0];
> 
> If it's greater than one, than it is an error, and it should be flagged
> as such.

I wanted to allow specific MII time stamping drivers to use one than
one value in the future, should the need arise.

> The idea looks good though, should of_find_mii_timestamper() somehow be
> made conditional to CONFIG_PTP and we should have a stub for when it is
> disabled?

Do you mean CONFIG_NETWORK_PHY_TIMESTAMPING ?
There is a stub for that.

Thanks,
Richard
