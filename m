From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 17:22:03 -0600
Message-ID: <20140829232203.GA17664@obsidianresearch.com>
References: <53F5D8D9.7040604@suse.de>
 <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
 <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com>
 <20140825174610.GA13737@obsidianresearch.com>
 <53FB9AC4.8010704@gmail.com>
 <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl>
 <540099AF.4020005@suse.de>
 <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl>
 <20140829173102.GA30917@obsidianresearch.com>
 <5400C53D.70501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5400C53D.70501@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 29, 2014 at 11:23:57AM -0700, Florian Fainelli wrote:
> On 08/29/2014 10:31 AM, Jason Gunthorpe wrote:
> > On Fri, Aug 29, 2014 at 08:35:36AM -0700, S=F6ren Brinkmann wrote:
> >=20
> >> The compatible string is listed as optional property for PHYs. So,=
 not
> >> having one is an option, I guess. But, I'd also prefer to at least=
 keep
> >> the -c22 one, since I saw problems when I tried using -c45 (the Ze=
d phy
> >> should support it...).
> >=20
> > -c45 and -c22 use a completely different MDIO protocol, Zed doesn't
> > have a 10GE port, so it certainly doesn't use -c45.
>=20
> Most recent 1GbE PHYs should also implement clause 45. It is a nice
> improvement if you are using lot of transactions, otherwise clause 45
> over clause 22 is suitable and supported by the PHY library (for EEE =
in
> particular).

Oh, that is interesting, I haven't actually seen one of those yet..

Hum. So that is messy, even if the Zed phy supports the C45 format,
the macb driver (and by my reading, the Zynq hardware) lacks the
capability to generate C45 frames.

It could be supported, but you'd have to use the GPIO bitbang MDIO
driver to talk to the phy.

So... that makes the compatible string for the phy even more
confusing. 'Describe The HW' says it should have both c22 and c45
listed - however we don't have software support in Linux to negotiate
c22 and c45 support between the phy bus driver and attached phy :(

Jason
