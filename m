From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Tue, 17 Jul 2012 14:30:01 +0100
Message-ID: <500568D9.10805@linaro.org>
References: <5003FB7C.4030509@linaro.org> <20120717130650.GB27595@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20120717130650.GB27595@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 17/07/12 14:06, Mark Brown wrote:
> On Mon, Jul 16, 2012 at 12:31:08PM +0100, Lee Jones wrote:
>
>> I agree with what you say to some extent, but I believe that it is
>> more important to have a working solution now than to ensure that
>> each bindings are as unique as possible. After any suggestion of
>> consolidation, a move from vendor specific to generically defined
>> Device Tree bindings is trivial. Especially in the current stage
>> where adaptions and definitions are still fluid.
>
>> Obviously some care is taken to ensure the bindings are as generic
>> as possible, but not to the extent that will put the project back
>> some months. Over past few months I have enabled many sub-systems;
>
> It's not just about having generic bindings, it's also about having
> bindings which have some abstraction and hope of reusability. An awfu=
l
> lot of bindings are just straight dumps of Linux data structures into
> the device tree which don't make a terribly great deal of sense as
> bindings.

The Device Tree should supply any platform configuration which the=20
driver needs in order to correctly setup for a particular machine. This=
=20
is exactly what the platform_data structure did before, hence is is=20
reasonable to assume that whatever information resides in that structur=
e=20
would be required in the Device Tree.

>> however, I think it would have been a fraction of that if we'd gone
>> through the laborious process of immediate forced consolidation. I
>> think it's fine to have platform/vendor specific bindings that work,
>> then come back to unify them once the dust settles.
>
> In many of these cases we'd be better off just not putting things int=
o
> the device tree in the first place, leaving things at the basic "is t=
he
> device there" stuff.

Then what do you do with the platform data?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
