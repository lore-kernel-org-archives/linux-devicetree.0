From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: si5351: make clk-si5351 depend on CONFIG_OF
Date: Mon, 15 Apr 2013 21:45:14 -0700
Message-ID: <20130416044514.19887.93969@quantum>
References: <1366009214-32234-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <20130416105513.913219ac889b1db952876197@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130416105513.913219ac889b1db952876197@canb.auug.org.au>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, Guenter Roeck <linux@roeck-us.net>, Michal Bachraty <michal.bachraty@streamunlimited.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Stephen Rothwell (2013-04-15 17:55:13)
> Hi Sebastian,
> 
> On Mon, 15 Apr 2013 09:00:14 +0200 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
> >
> > Calling clk-si5351 driver non-OF ready was too early. This patch
> > makes clk-si5351 depend on CONFIG_OF again, until things get sorted out.
> > 
> > Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > Reported-by: Stephen Rottweil <sfr@canb.auug.org.au>
> 
> My name is spelt "Rothwell" (as in the Cc: line below) :-(
> 

It's fixed in the merged version.

Regards,
Mike

> > ---
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
