From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCHv2 2/3] clk: mvebu: adjust clock handling for the CP110
 system controller
Date: Tue, 14 Feb 2017 21:05:37 +0100
Message-ID: <20170214210537.2c0218dd@free-electrons.com>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1482316017-22154-3-git-send-email-thomas.petazzoni@free-electrons.com>
        <20161222001456.GX8288@codeaurora.org>
        <20170214162718.0777d95f@free-electrons.com>
        <20170214185912.GT25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170214185912.GT25384@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 14 Feb 2017 10:59:12 -0800, Stephen Boyd wrote:

> > I don't see my patch in clk-next at
> > https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/drivers/clk/mvebu/cp110-system-controller.c?h=clk-next,
> > nor in linux-next. Am I missing something?
> 
> Odd. I don't know what happened. I've applied it now.

I think you also forgot to apply:

  [PATCHv2 1/3] dt-bindings: arm: update Armada CP110 system controller binding

from the same series. You told me "Applied to clk-next", but I don't
see it in linux-next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
