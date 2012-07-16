From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Mon, 16 Jul 2012 12:31:08 +0100
Message-ID: <5003FB7C.4030509@linaro.org>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au> <20120712131231.GH2194@pengutronix.de> <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com> <20120716101706.GB17435@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20120716101706.GB17435@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 16/07/12 11:17, Wolfram Sang wrote:
>
>> Well I think I ACKed that from the point of view that it will work a=
s
>> expected with ux500 with these bindings. What is best from the I2C
>> subsystem point of view is another question ...
>
> Okay, thanks for clarifying.
>
>> Overall I think we have this general problem with a lot of DT
>> conversion happening right now: the tempo is set very high and
>> all chip vendors want DT support RealQuickNowPreferrablyYesterday
>> and that makes it hard for subsystem maintainers to hold back,
>> and I also fear vendor-specific properties are overused for this
>> reason.
>
> Word.
>
>> And about the perpetual nature of device tree bindings it
>> appears to me that the modus operandi right now is to not
>> regard any of these as written in stone until they are removed
>> from the kernel tree. We have plenty of drivers patching
>> trees and drivers in one for the moment.
>
> I don't get this one. Yes, they are of perpetual nature, so how could=
 we
> remove them from the kernel tree?
>
> What I am afraid of is: tentative solutions tend to stay, because the
> need for a proper solution is reduced. Yet, finding proper generic
> bindings might take some time which doesn't meet the high pressure
> around DT at the moment.

I agree with what you say to some extent, but I believe that it is more=
=20
important to have a working solution now than to ensure that each=20
bindings are as unique as possible. After any suggestion of=20
consolidation, a move from vendor specific to generically defined Devic=
e=20
Tree bindings is trivial. Especially in the current stage where=20
adaptions and definitions are still fluid.

Obviously some care is taken to ensure the bindings are as generic as=20
possible, but not to the extent that will put the project back some=20
months. Over past few months I have enabled many sub-systems; however, =
I=20
think it would have been a fraction of that if we'd gone through the=20
laborious process of immediate forced consolidation. I think it's fine=20
to have platform/vendor specific bindings that work, then come back to=20
unify them once the dust settles.

If you know of any bindings which you know are generic, I'm happy to=20
define and swap them out for the ones I've proposed, but due to a chang=
e=20
of project focus I can't afford to spend hours studying all of the=20
drivers to match-up possible unifications.

Kind regards,
Lee

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
