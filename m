From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH 12/13] clk: mvebu: add support for 1866MHz variants
Date: Tue, 23 May 2017 21:55:12 +0200
Message-ID: <20170523215512.6112d725@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
 <20170521124903.11050-13-ralph.sennhauser@gmail.com>
 <20170523121514.GS13759@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170523121514.GS13759@lunn.ch>
Sender: linux-clk-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 23 May 2017 14:15:14 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Sun, May 21, 2017 at 02:49:01PM +0200, Ralph Sennhauser wrote:
> > The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to
> > the list of supported CPU frequencies.
> > 
> > Noticed by the following warning:
> > [    0.000000] Selected CPU frequency (16) unsupported  
> 
> Are the L2 and DDR clocks using sensible values?
>

Hi Andrew

As you expected more changes are needed to fully support the new
CPU frequency. Will send out a V2 later.

Thanks for catching this.
Ralph
