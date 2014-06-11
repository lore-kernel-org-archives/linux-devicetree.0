From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 00/24] PM / Domains: Generic OF-based support and cleanups
Date: Wed, 11 Jun 2014 11:23:07 -0700
Message-ID: <7hlht3gvas.fsf@paris.lan>
References: <1402397497-26737-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1402397497-26737-1-git-send-email-ulf.hansson@linaro.org> (Ulf
	Hansson's message of "Tue, 10 Jun 2014 12:51:13 +0200")
Sender: linux-pm-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Ulf Hansson <ulf.hansson@linaro.org> writes:

> Parts of this patchset has been posted earlier. To be able to smoothly continue
> my work in re-factoring genpd I have collected patches into this patchset.
>
> The complete patchset is available at the linux-pm_linux-next_genpd branch at:
> git.linaro.org/people/ulf.hansson/linux-2.6.git
> This branch is based upon Rafael's linux-pm tree's linux-next branch.
>
> And important note. There are dependencies througout this patchset, which means
> the all need to go together. I suggest we use Rafael's tree, thus I seek for
> acks from the affected ARM SoC maintainers.

At least on the surface, there are at least 3 separate series going on
here

1) DT support for genpd
2) various genpd cleanups
3) ux500 support

Clearly they are related, but it would be easier to review if a large
series like this is broken up into smaller series where the cover
letters describe the dependencies between them

Kevin
