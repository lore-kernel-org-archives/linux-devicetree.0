From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 23:12:11 +0100
Message-ID: <CACRpkdZ3X1BZtkjofftX2j4Z1FUdwGeU0swxLCyCQ844_h_-Nw@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
 <20181206133922.4y4qnrqcjtog3ukt@pengutronix.de>
 <CAL_Jsq+PB3Pmg1RmNqj0whapbcqRBXDNWi4LpjPqqCKeLHbR=A@mail.gmail.com>
 <20181206140531.GX8952@piout.net>
 <CACRpkdbzyZD23JapAxEKc24jSwmZws5LqWS8O2Y4-VA3smgYyQ@mail.gmail.com>
 <CAL_JsqL7Rnb5Tt5ZAm9TDqgcenkkMEzM6STfwKXMDMKkkxqQvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqL7Rnb5Tt5ZAm9TDqgcenkkMEzM6STfwKXMDMKkkxqQvg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, ext Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 6, 2018 at 5:57 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Dec 6, 2018 at 8:30 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > We discussed merging all ARM reference design mach-* to one dir
> > if I just name that mach-arm then we get a convergence to the
> > vendor name in some organic way.
>
> TBC, you want .../boot/dts/arm/* for all the ARM, Ltd boards? Just
> making sure as you were arguing against vendor names. :)

I am not against vendor names, but I am also for SoC
names because I think whatever makes most sense should
be the rule, so both/and not either/or. One does not exclude
the other. It's just a name.

In this case what
I meant was that while we (me and Arnd) originally discussed
merging it all into mach-versatile (how would you know)
if I instead merge it all into mach-arm, we get a 1:1 correspondence
between mach-dir and vendor name and DTS dir so everyone
is happy.

Yours,
Linus Walleij
