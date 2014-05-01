From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 03/15] ARM: dts: kirkwood: add stdout-path property to
 all boards
Date: Thu, 1 May 2014 09:30:01 +0200
Message-ID: <20140501073001.GI3082@lunn.ch>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <53615342.8010600@gmail.com>
 <20140430202130.GE3082@lunn.ch>
 <142642785.6KSg8q4tJP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <142642785.6KSg8q4tJP@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 10:30:21PM +0200, Arnd Bergmann wrote:
> On Wednesday 30 April 2014 22:21:30 Andrew Lunn wrote:
> > > Yes, we *can* move it in kirkwood.dtsi, but IMHO we *should* keep it in
> > > the board files. I see the "chosen" node and its properties as _the_
> > > board node.
> > > 
> > > One could argue then, that we should count the memory properties too and
> > > put the most common in the SoC dtsi. But you are right, as UART0 is also
> > > the UART with boot support, it is likely to be always connected to
> > > a more-or-less accessible console output.
> > > 
> > > I really have no strong opinion about it.
> > 
> > Me neithe, but the advantage of putting it in kirkwood.dtsi is that it
> > then does not get forgotten, and is always there for bearbox to use.
> 
> I would prefer having it in the board.dts file out of principle, but I
> agree it's not very important either way.

OK, then i can add my 

Acked-by: Andrew Lunn <andrew@lunn.ch>

I will try to do some testing over the weekend.

	  Andrew
