From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 14/18] ARM: mvebu: add support for the Armada 395 SoC
 family
Date: Mon, 25 Jul 2016 20:22:09 +0200
Message-ID: <20160725202209.5fae4d98@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-16-git-send-email-jaz@semihalf.com>
	<20160721221605.GA21883@rob-hp-laptop>
	<CAH76GKOidxFZ7R1pQZ2W9BRBCxEnLXNHQGrXbAUmouozBUj51Q@mail.gmail.com>
	<CAL_JsqJeObuS8OWeErRA5MX-SrMtu_254A-LtP9-A=xdPO7p1Q@mail.gmail.com>
	<20160725155050.3aee974e@free-electrons.com>
	<CAL_JsqL=bkzhjOTcOCeGNvKsAfYg0D=CypZs4sCsQ01pnbitoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL=bkzhjOTcOCeGNvKsAfYg0D=CypZs4sCsQ01pnbitoQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Grzegorz Jaszczyk <jaz@semihalf.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Marcin Wojtas <mw@semihalf.com>, Lior Amsalem <alior@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 25 Jul 2016 10:12:43 -0500, Rob Herring wrote:

> Yes, I get that, but that is only meaningful if you want to run an OS
> that is only aware of 395 on a 398 SoC/board (though I'd guess the 390
> compat is enough for that). Otherwise, that property is not really
> meaningful as the additional nodes are enough to handle what is the
> superset.
> 
> I would agree both are fine if both chips are in fact the same die,
> just fused or packaged differently. I've seen a lot of chips that are
> supposed to be sub/supersets of each other, but have different errata
> lists because they are different die.

Unfortunately HW vendors are rarely willing to publicly indicate whether
the different chips in their families are actually the same die fused
differently, or really different dies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
