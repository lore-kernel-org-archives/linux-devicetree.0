From: Rob Herring <robh@kernel.org>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 09:01:59 -0600
Message-ID: <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?A
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 2:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Dec 5, 2018 at 7:02 AM Jisheng Zhang
> <Jisheng.Zhang@synaptics.com> wrote:
> > Rob Herring <robh@kernel.org> wrote:
>
> > >     'armada' : 'marvell',
> > >     'berlin' : 'marvell',
> >
> > Now, berlin SoC is synaptics' SoC ;)

But we're not changing the names of existing SoCs and at least so far
there aren't new 32-bit berlin SoCs.

> This illustrates perfectly the artificial nature of using vendor names
> as prefixes with DT properties, prefix names, directories etc.
>
> Companies start out purporting to be some eternal entity and the
> next day they buy each other left and right and license their
> hardware IP to whoever wants it.
>
> It actually makes much more sense to organize these files by
> the SoC family name, because that doesn't change when the
> SoC is sold to another company.

Uh, no. i.MX23 is a Sigmatel chip STMP?? which shared absolutely
nothing with other i.MX chips except for the derivatives that
followed. IIRC, STMP chips were even partially upstream.

Marketing names change at the whim of marketing and don't even require
a sale of a company.

> omap/* containing all OMAP platforms, msm/* for all Qualcomm
> SoCs etc. SoC names/codenames are at least eternal once they
> have been manufactured and we can keep them together
> no matter what vendor currently controls it.

Where do TI amXXXX chips go? Not all QC chips are 'msm' and I think
that name is abandoned now. No solution is going to be perfect.

We are already use vendors for arm64 (except for the oddball exynos),
so if we change arm, we shouldn't do something different. EBBR is also
going with vendor for firmware directories in the EFI system
partition. Speak up if you want to change that before 1.0.

> However I think there was a fork in the road ages ago when
> someone or something decided to use vendor prefixes for
> DT properties leading to this situation that we can no longer
> back out of.

It was simpler times...

> It has the side effect of splitting DTS files with the same SoC
> in two different folders marvell/* and synaptics/*
> it's a bit meh.

All I really care about here is things are organized by maintainers.
Someone care to write a script to ensure all 1800 files have a
maintainer attached to them (that is not me)?

Rob
