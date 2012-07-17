From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Tue, 17 Jul 2012 14:06:50 +0100
Message-ID: <20120717130650.GB27595@sirena.org.uk>
References: <5003FB7C.4030509@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5003FB7C.4030509@linaro.org>
Sender: linux-next-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2012 at 12:31:08PM +0100, Lee Jones wrote:

> I agree with what you say to some extent, but I believe that it is
> more important to have a working solution now than to ensure that
> each bindings are as unique as possible. After any suggestion of
> consolidation, a move from vendor specific to generically defined
> Device Tree bindings is trivial. Especially in the current stage
> where adaptions and definitions are still fluid.

> Obviously some care is taken to ensure the bindings are as generic
> as possible, but not to the extent that will put the project back
> some months. Over past few months I have enabled many sub-systems;

It's not just about having generic bindings, it's also about having
bindings which have some abstraction and hope of reusability. An awful
lot of bindings are just straight dumps of Linux data structures into
the device tree which don't make a terribly great deal of sense as
bindings.

> however, I think it would have been a fraction of that if we'd gone
> through the laborious process of immediate forced consolidation. I
> think it's fine to have platform/vendor specific bindings that work,
> then come back to unify them once the dust settles.

In many of these cases we'd be better off just not putting things into
the device tree in the first place, leaving things at the basic "is the
device there" stuff.
