From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Sat, 8 Dec 2018 23:40:46 +0100
Message-ID: <CACRpkdbVdVyOBMDsqHxFuONVo6qD20OGecVjpAv_LtnX1QOqPA@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <CAL_JsqKK4F7QX=B-CcQkMsgN--r3xv6PS4JabzOb4kqfATwtsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKK4F7QX=B-CcQkMsgN--r3xv6PS4JabzOb4kqfATwtsQ@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, ext Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afae>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 7, 2018 at 11:33 PM Rob Herring <robh@kernel.org> wrote:

> Here's an updated mapping filled out with the rest of the platforms
> and using SoC family names in some cases as discussed.

This looks really good to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

>The move is
> completely scripted now including include fixups (though any new
> includes could break things). So mainly just need to bikeshed the
> directory mapping.

I did have a serious minute to think over whether this was a
bikeshedding type discussion and the outcome is as unimportant
as the color of some bikeshed. Went as far as to re-read Parsons
(hilarious!) original essay and the first chapter of Wittgensteins
Tractatus. I concluded it was more profound than that for several
reasons.

Yours,
Linus Walleij
