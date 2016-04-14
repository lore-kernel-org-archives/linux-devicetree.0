From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: arm: add DT binding for Marvell
 CP110 system controller
Date: Thu, 14 Apr 2016 09:49:18 +0200
Message-ID: <20160414094918.6f65e5cf@free-electrons.com>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1459070777-18049-5-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160328194756.GA28967@rob-hp-laptop>
	<20160413180122.4f997a9a@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160413180122.4f997a9a@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 13 Apr 2016 18:01:22 +0200, Thomas Petazzoni wrote:

> In fact, the more I think of it, the less I find encoding the clock
> output names in the DT to be useful for such a driver. For generic
> clock drivers, it makes complete sense, but here the driver is really
> tied to the specific system controller of that SoC, so the clock names
> will not change.

My bad: there will be two instances of the CP110 system controller, one
for the master CP110 and one for the slave CP110. So having the
possibility of setting the clock names in the DT is actually a good
thing, so I'll keep it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
