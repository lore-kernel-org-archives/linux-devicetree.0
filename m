From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: Moving ARM dts files
Date: Sat, 08 Dec 2018 10:07:29 +0000
Message-ID: <87316941f5cbc2482fcb7faf55e88cb801ddace3.camel@hellion.org.uk>
References: <20181204183649.GA5716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204183649.GA5716@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, arm@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-12-04 at 12:36 -0600, Rob Herring wrote:
> I've put together a script to move the dts files and update the 
> makefiles.

Anything here which the split-devicetree tree[0] needs to care about?

I think this is all just about file movement contained entirely
underneath arch/arm/boot/dts, in which case the answer *should* be
"no".

Ian.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
