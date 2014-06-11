From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 07/24] ARM: shmobile: Drop dev_irq_safe from r8a7779 genpd config
Date: Wed, 11 Jun 2014 22:34:48 +0200
Message-ID: <CAPDyKFq7hdK=3jtni=nr4R6LVXubZZH3xc7=VkP5_CLQ4xaRQQ@mail.gmail.com>
References: <1402397497-26737-1-git-send-email-ulf.hansson@linaro.org>
	<1402397497-26737-8-git-send-email-ulf.hansson@linaro.org>
	<7ha99jiabs.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <7ha99jiabs.fsf@paris.lan>
Sender: linux-pm-owner@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 11 June 2014 20:13, Kevin Hilman <khilman@linaro.org> wrote:
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
>> The dev_irq_safe configuration is redundant, genpd don't have any
>> special treatmeant for handling it.  Let's remove it.
>
> Why?
>
> The genpd core needs to handle irq_safe properly eventully (right now it
> just doesn't call power_off/power_on callbacks, but that needs to be
> implmenented.  c.f commit 0aa2a22169)
>
> If we remove these flags from platforms, we're taking away information
> that the platform maintainers have specified tha will be useful when
> full support is avialble.

For sure this is needed in _some_ form. But before we even figured out
how to support irq_safe genpd's, why even bother to support a
configuration for it?

Currently I think it good enough to use the per device irq_safe
option, and then let's see how handling of these devices evolves.

Kind regards
Uffe
