From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 10:04:07 +0100
Message-ID: <CACRpkdbo2rQOPyY5UWfyKA=K9PGnXXt1=EL-VVp=NKoGjHqn5Q@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <20181205162941.2d8bbfaf@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181205162941.2d8bbfaf@xhacker.debian>
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

On Wed, Dec 5, 2018 at 9:34 AM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
> [Me]
> > It actually makes much more sense to organize these files by
> > the SoC family name, because that doesn't change when the
> > SoC is sold to another company.
>
> If the SoC is sold to another company, then
>
> case1: The original SoC family is renamed to another family.
>
> case2: Based on the original SoC, a newer SoC family comes out.
>
> I'm not sure it's still fine to put the new or renamed SoCs' files into the
> original SoC directory.
>
> Another issue is: who will be the maintainer of new or renamed SoC family?

Of course marketing prefer to associate the acquired
company's SoC with itself and rename it.

But that doesn't account for the case where the same SoC
is produced by the new owner under the old name.

Example:
The Gemini SoC arch/arm/boot/dts/gemini-*
https://dflund.se/~triad/krad/gemini/

This SoC was produced by StorLink Semiconductor in Taiwan
early 2000s.

At some point between 2000 and 2008 the company changed
its name and/or got restructured and was renamed
Storm Semiconductor. The masks for the packaging was retained
so the chips still said "StorLink".

Then in 2008 Cortina Systems acquired Storm Semiconductor
eventually changed the masks and and renamed the identical
chips from "SLnnnn" to "CSnnnn" but the chip inside the package
was still the same.

The SoC is still codenamed "Gemini", that is the only constant.

And now we will put these devicetrees into folder...?

storlink/
storm/
cortina/

If we look at the chip packageing, it should be different
folders depending on what supplier was used when the device
was manufactured.

This is why the Vendor scheme is not really working.

Another issue is illustrated again with the Synaptics device:
an SoC produced exclusively for Synaptics (IIUC) but
with a intimate relationship to a very easily identifed SoC.

This naming nomenclature is a half-measure and a can
of worms, that is my only point.

Yours,
Linus Walleij
