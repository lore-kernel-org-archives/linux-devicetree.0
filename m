From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Date: Wed, 10 Feb 2016 18:41:12 +0000
Message-ID: <20160210184112.GC28728@leverpostej>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <20160210125936.GD31506@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160210125936.GD31506@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 10, 2016 at 01:59:36PM +0100, Maxime Ripard wrote:
> > Also this totally ignores any other DT user (U-Boot, FreeBSD, you
> > name it).
> 
> Which all have their own DT copies, with their own bindings, that we
> (ie Linux) never agreed on.

The FreeBSD guys are actually trying to align with the Linux DTs, which
they periodically import (at least for arm64). From everything I've seen
the U-Boot guys generally want to align with Linux, and have been
attempting to some extent to do so (e.g. submitting bindings).

So if anything, Linux DTs are being used by others who didn't have much
say on them, rather than the other way around.

Regardless, the existece of fragmentation is not a good argument for
more fragmentation.

Thanks,
Mark.
