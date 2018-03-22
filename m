Return-Path: <SRS0=wYJ4=GM=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 18:57:38 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180322015738.hkt5bwm4hrj4nsmb@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180322004349.GB28402@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322004349.GB28402@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 22, 2018 at 01:43:49AM +0100, Andrew Lunn wrote:
> On Wed, Mar 21, 2018 at 03:47:02PM -0700, Richard Cochran wrote:
> > I happy to improve the modeling, but the solution should be generic
> > and work for every MAC driver.

Let me qualify that a bit...
 
> Something else to think about. There are a number of MAC drivers which
> don't use phylib. All the intel drivers for example. They have their
> own MDIO and PHY code. And recently there have been a number of MAC
> drivers for hardware capable of > 1GBps which do all the PHY control
> in firmware.
> 
> A phydev is optional, the MAC is mandatory.

So MACs that have a built in PHY won't work, but we don't care because
there is no way to hang another MII device in there anyhow.

We already require phylib for NETWORK_PHY_TIMESTAMPING, and so we
expect that here, too.

Many of these IP core things will be targeting arm with device tree,
and I want that to "just work" without MAC changes.  

(This is exactly the same situation with DSA, BTW.)

If someone attaches an MII time stamper to a MACs whose driver does
their own thing without phylib, then they are going to have to hack
the MAC driver in any case.  Such hacks will never be acceptable for
mainline because they are design specific.  We really don't have to
worry about this case.

Thanks,
Richard
