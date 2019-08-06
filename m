From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 15/16] net: phy: adin: add ethtool get_stats support
Date: Tue, 6 Aug 2019 17:46:58 +0200
Message-ID: <20190806154658.GC20422@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-16-alexandru.ardelean@analog.com>
 <20190805152832.GT24275@lunn.ch>
 <ce952e3f8d927cdbccb268d708b4e47179d69b06.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ce952e3f8d927cdbccb268d708b4e47179d69b06.camel@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 07:11:57AM +0000, Ardelean, Alexandru wrote:
> On Mon, 2019-08-05 at 17:28 +0200, Andrew Lunn wrote:
> > [External]
> > 
> > > +struct adin_hw_stat {
> > > +	const char *string;
> > > +static void adin_get_strings(struct phy_device *phydev, u8 *data)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++) {
> > > +		memcpy(data + i * ETH_GSTRING_LEN,
> > > +		       adin_hw_stats[i].string, ETH_GSTRING_LEN);
> > 
> > You define string as a char *. So it will be only as long as it should
> > be. However memcpy always copies ETH_GSTRING_LEN bytes, doing off the
> > end of the string and into whatever follows.
> > 
> 
> hmm, will use strlcpy()
> i blindedly copied memcpy() from some other driver

Hopefully that driver used const char string[ETH_GSTRING_LEN]. Then a
memcpy is safe. If not, please let me know what driver you copied.

> i'm afraid i don't understand about the snapshot feature you are mentioning;
> i.e. i don't remember seeing it in other chips;

It is frequency done at the MAC layer for statistics. You tell the
hardware to snapshot all the statistics. It atomically makes a copy of
all the statistics into a set of registers. These values are then
static, and consistent between counters. You can read them out knowing
they are not going to change.

> regarding the danger that stat->reg1 rolls over, i guess that is
> possible, but it's a bit hard to guard against;

The normal solution is the read the MSB, the LSB and then the MSB
again. If the MSB value has changed between the two reads, you know a
roll over has happened, and you need to do it all again.

     Andrew
