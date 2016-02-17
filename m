From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 0/3] clk: mvebu: initial support for AP806 clocks
Date: Wed, 17 Feb 2016 15:23:33 +0100
Message-ID: <20160217152333.6718d8fc@free-electrons.com>
References: <1455521698-7905-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160215233102.2278.88855@quark.deferred.io>
	<CAEG3pNCRa_CQx70aPHfQpG+7jEZ_=_-FxBWDkXVYbgH=j=1rmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAEG3pNCRa_CQx70aPHfQpG+7jEZ_=_-FxBWDkXVYbgH=j=1rmA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez
	<emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>, linux-clk
	<linux-clk@vger.kernel.org>, linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Michael,

On Mon, 15 Feb 2016 15:36:49 -0800, Michael Turquette wrote:

> > Yay, new SoC! Just FYI, we worked out an agreement in December[0] that
> > the clk git tree can take DT bindings and headers, and we'll always host
> > them in an immutable branch by default in case arm-soc (or anyone else)
> > needs them. Stephen and I are doing this now.
> 
> Oops, I misunderstood your point (and I should have looked at the
> patches before replying). The patches in this series do indeed have
> the clk DT binding descriptions.
> 
> Pardon the noise, nothing to see here, move along ;-)

Yes, each driver comes with its DT binding documentation in the same
patch. Unfortunately, some maintainers prefer to have the DT binding
documentation as separate patches from the driver itself, while some
other maintainers prefer to have both in the same patch. And I never
remember which maintainer has which preference.

So, let me know if you're fine with having both in the same patches. If
not, I can respin by splitting the DT binding documentation in its own
patches.

Other than that, any comments on the drivers themselves? Since they are
quite trivial, I would ideally like to see them in 4.6, if at all
possible.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
