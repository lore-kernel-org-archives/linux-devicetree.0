From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Fri, 12 Feb 2016 10:40:30 +0100
Message-ID: <1455270030.3201.71.camel@pengutronix.de>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
	 <56B4E2FB.3050703@arm.com> <56BB2D79.6090402@arm.com>
	 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
	 <20160210143755.GE31506@lukather> <20160210163001.GG2632@leverpostej>
	 <20160211100048.GK31506@lukather> <20160211114410.GA32535@leverpostej>
	 <20160211170820.GP31506@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160211170820.GP31506@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <rob.herring@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jens Kuske <jenskuske@gmail.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 11.02.2016, 18:08 +0100 schrieb Maxime Ripard:
[...]
> > > > Having code in mainline comes with responsibilities. One of those is to
> > > > keep said code working for existing users. Otherwise, why bother having
> > > > it in mainline at all?
> > > 
> > > None of our existing users ever complained.
> > 
> > I believe that in this case, Andre was complaining about this particular
> > breakage, unless I have misunderstood.
> > 
> > To be clear, I'm arguing for the strategy going forward. If no-one has
> > complained about the stuff broken up to this point, let's not waste time
> > restoring that.
> > 
> > Going forward we need to keep old DTBs supported.
> 
> I find that stand a bit dishonest.
> 
> You, DT maintainers, admit that you're not doing your job properly,
> and that burden relies on the platform maintainers? Or should I take
> it as you volunteering to maintain that code?
> 
> But ok. Let's do that. Make sure that the other platform maintainers
> are aware that this is the rule too though. I surely don't want to be
> alone in that boat.

FWIW: I always thought it's the platform maintainers job to enforce a
reasonable level of DT stability. I don't see how the DT maintainers
could provide the necessary in-depth review with every platform being
different in many subtle ways.

For the i.MX platform we actually enforced a baseline of DT stability by
shooting down patches that break DT stability for the sake of adding new
features, or when trying to put "fixes" into the DT, that could be
solved entirely inside the kernel.

Yes, mistakes happen and and we can not really prevent all breakage,
especially when the bindings were not strictly enough defined and board
DT writers may have interpreted them differently, but it is definitely
possible to keep DTs reasonably stable if the platform maintainers care
about that.

I strongly disagree with platform maintainers denying that duty, by
claiming that DTs won't be completely stable ever, so there is no reason
to even care.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

