From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 22:03:44 +0100
Message-ID: <CACRpkdbFnPeDeZyHRP5qOuoafDbE1bW9s_zB3EzXu8tb=kKdVA@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, ext Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kerne>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 4:02 PM Rob Herring <robh@kernel.org> wrote:

> We are already use vendors for arm64 (except for the oddball exynos),
> so if we change arm, we shouldn't do something different. EBBR is also
> going with vendor for firmware directories in the EFI system
> partition. Speak up if you want to change that before 1.0.

I don't think there is a silver bullet for this, except "use vendor
or whatever makes most sense", like if in doubt use vendor but
no need to overspecify. Rough consensus, not perfect consensus.

> All I really care about here is things are organized by maintainers.
> Someone care to write a script to ensure all 1800 files have a
> maintainer attached to them (that is not me)?

OK why not let the maintainers choose the name of the subdir
rather than insist to set it to $vendor? Just consistency?

For the stuff I maintain please use:

    'arm-' : 'arm',
    'integ' : 'arm',
    've' : 'arm',

These are fine.

Drop this

-    'gemini' : 'cortina',

Just use the "gemini" prefix.
Because this was three different vendors so let's stick with the
SoC codename.

And for 'ste' I would use 'st-ericsson' or 'stericsson' (also a valid
vendor) so it is readable.

It's no super-big deal so if you think my view is just annoying I
am not going to persist, I will just get over it.

Thanks,
Linus Walleij
