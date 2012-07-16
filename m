From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Mon, 16 Jul 2012 14:55:40 +0100
Message-ID: <50041D5C.7010904@linaro.org>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au> <20120712131231.GH2194@pengutronix.de> <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com> <20120716101706.GB17435@pengutronix.de> <5003FB7C.4030509@linaro.org> <20120716130015.GF17435@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20120716130015.GF17435@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 16/07/12 14:00, Wolfram Sang wrote:
>>> What I am afraid of is: tentative solutions tend to stay, because t=
he
>>> need for a proper solution is reduced. Yet, finding proper generic
>>> bindings might take some time which doesn't meet the high pressure
>>> around DT at the moment.
>>
>> I agree with what you say to some extent, but I believe that it is
>> more important to have a working solution now than to ensure that
>> each bindings are as unique as possible. After any suggestion of
>> consolidation, a move from vendor specific to generically defined
>> Device Tree bindings is trivial. Especially in the current stage
>> where adaptions and definitions are still fluid.
>
> See my response to Linus. I do understand your view and where it come=
s
> from. As a maintainer, I have other priorities. No offence involved,
> it needs some settlement.

I'm certainly not adverse to doing this, although I'd prefer it was=20
completed in the short-term. So should we do it?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
