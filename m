From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 09:19:49 +0100
Message-ID: <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181205135726.70badac7@xhacker.debian>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, ext Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 7:02 AM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
> Rob Herring <robh@kernel.org> wrote:

> >     'armada' : 'marvell',
> >     'berlin' : 'marvell',
>
> Now, berlin SoC is synaptics' SoC ;)

This illustrates perfectly the artificial nature of using vendor names
as prefixes with DT properties, prefix names, directories etc.

Companies start out purporting to be some eternal entity and the
next day they buy each other left and right and license their
hardware IP to whoever wants it.

It actually makes much more sense to organize these files by
the SoC family name, because that doesn't change when the
SoC is sold to another company.

omap/* containing all OMAP platforms, msm/* for all Qualcomm
SoCs etc. SoC names/codenames are at least eternal once they
have been manufactured and we can keep them together
no matter what vendor currently controls it.

However I think there was a fork in the road ages ago when
someone or something decided to use vendor prefixes for
DT properties leading to this situation that we can no longer
back out of.

It has the side effect of splitting DTS files with the same SoC
in two different folders marvell/* and synaptics/*
it's a bit meh.

Yours,
Linus Walleij
