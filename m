From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Tue, 22 Dec 2015 10:13:53 +0100
Message-ID: <CACRpkdYxBkuRcE6_VvChO=kKHTd0TS1kKAutL=8hFA4-15h3nA@mail.gmail.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
	<20151124162624.GI807@x1>
	<20151204120240.GW26072@sirena.org.uk>
	<5665E4F7.1070707@ti.com>
	<20151208191657.GA5727@sirena.org.uk>
	<CACRpkdZU3RrXmPr1fDzCMumhQ8nWEf126iC1rDu=xiLFj7DU+A@mail.gmail.com>
	<56703CCC.5060608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56703CCC.5060608@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 5:16 PM, Andrew F. Davis <afd@ti.com> wrote:

> Is there anything I can do to help this along? This series
> and the tps65086 series have been blocked for months on
> trivial issues. (Not sure why the tps65086 hasn't been taken,
> it doesn't have this problem, I'd be OK with this getting
> stalled for a bit longer if someone could look at the other
> one)

Lee can you merge the core driver if it's OK? Then we have
includes etc in place to merge subdrivers for the next merge
window.

Yours,
Linus Walleij
