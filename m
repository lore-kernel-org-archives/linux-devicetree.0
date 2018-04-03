From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Tue, 3 Apr 2018 08:02:04 -0700
Message-ID: <20180403150204.gaamvb27ssacv6r3@localhost>
References: <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch>
 <20180325221004.6svjbx54yghwuk7w@localhost>
 <4c3c939f-4cbe-51db-c141-950b85a5b4de@gmail.com>
 <20180403035527.lgcm6gql3qx4rpuv@localhost>
 <20180403131319.GD31740@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180403131319.GD31740@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 03, 2018 at 03:13:19PM +0200, Andrew Lunn wrote:
> Have you tried implementing it using a phandle in the phy node,
> pointing to the time stamping device?

Not yet, but I'll take this up for V2, after the merge window...

Thinking about MII, it really is a 1:1 connection between the MAC and
the PHY.  It has no representation in the current code, at least not
yet.  It is too bad about the naming of mii_bus, oh well.  While
hanging this thing off of the PHY isn't really great modeling (it
isn't a sub-device of the PHY in any sense), still this will work well
enough to enable the new functionality.

Thanks,
Richard
