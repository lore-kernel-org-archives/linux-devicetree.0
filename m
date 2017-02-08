From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Date: Wed, 08 Feb 2017 11:52:59 +0100
Message-ID: <9294933.cXSW0amFbE@wuerfel>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <5a974d9d7260432087619486bf5d79ed@svr-chch-ex1.atlnz.lc>
 <6149d4126a214ac8b0b0184bd818bea6@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6149d4126a214ac8b0b0184bd818bea6@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, February 7, 2017 3:07:37 AM CET Chris Packham wrote:
> >
> > Actually I wonder if I can try a bit harder to keep a system booting.
> > The following might work
> > 1) add the compatible strings to the existing armada clock drivers.
> > 2) update the dts to use the new compatible strings.
> > 3) add the new driver and remove the compatible strings from the armada
> > drivers.
> >
> > #1 would still upset checkpatch.pl because the documentation would only
> > arrive in #2.
> 
> Actually upon testing #1 is unnecessary. I lose some of the gated clocks 
> but nothing that prevents booting.

Just to be sure: this means we can merge 2) and 3) independently and
having just one of them will not cause regressions over what we have
today?

	Arnd
