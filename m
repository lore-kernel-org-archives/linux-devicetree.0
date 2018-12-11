From: Olof Johansson <olof@lixom.net>
Subject: Re: Moving ARM dts files
Date: Tue, 11 Dec 2018 07:58:49 -0800
Message-ID: <20181211155849.5t4wwmboirf2iaew@localhost>
References: <20181204183649.GA5716@bogus>
 <CAL_JsqKK4F7QX=B-CcQkMsgN--r3xv6PS4JabzOb4kqfATwtsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Andreas
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 04:33:41PM -0600, Rob Herring wrote:
> On Tue, Dec 4, 2018 at 12:36 PM Rob Herring <robh@kernel.org> wrote:
> >
> > Olof, Arnd,
> >
> > I've put together a script to move the dts files and update the
> > makefiles. It doesn't handle files not following a common prefix which
> > isn't many and some includes within the dts files will need some fixups
> > by hand.
> >
> > MAINTAINERS will also need updating.
> >
> > A few questions:
> >
> > Do we want to move absolutely everything to subdirs? There's quite a
> > few platforms with only 1-2 platforms. I haven't added these to the
> > list yet, but can.
> >
> > Do any vendors need another level of directories? davinci, omap, nspire,
> > etc. for TI for example.
> >
> > What to do with armv7m.dtsi? I guess it should remain and we just fixup
> > the include. There may be a few other cross vendor things.
> >
> >
> > Sub-arch maintainers,
> > 'vendor_map' below is the mapping of file prefix to new subdirectory
> > (the SoC vendor prefix). Please comment if there are any issues.
> 
> Here's an updated mapping filled out with the rest of the platforms
> and using SoC family names in some cases as discussed. The move is
> completely scripted now including include fixups (though any new
> includes could break things). So mainly just need to bikeshed the
> directory mapping. Not sure if marvell should be split up more or not.
> I split out pxa2xx and pxa3xx, but then there's other pxa chips I
> think aren't really related. TI is still all one directory except
> nspire. I was going to split out davinci too, but it's only a couple
> of files. Sub-arch maintainers need to chime in with what they want.

I think we can debate this forever if we want to, and of course when product
families change owners (or when companies merge or change names) it will be
tempting to rename or move files. But I think we'll treat this the same way as
we do with bindings and other aspects of the kernel: some platforms will have
legacy names that might not describe their current state but documents the
lineage of the product. For that, it might be slightly easier to use product
family names instead of company ditto, but I really don't care enough to
request changes.

Also, since the subdirectory doesn't influence install path on 32-bit,
renames shouldn't be the end of the world (but I'm likely to turn down
those requests beyond the possible initial "we miscategorized this
platform" kind).


-Olof
