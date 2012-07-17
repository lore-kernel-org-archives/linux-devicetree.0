From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Tue, 17 Jul 2012 15:52:10 +0100
Message-ID: <50057C1A.80606@linaro.org>
References: <5003FB7C.4030509@linaro.org> <20120717130650.GB27595@sirena.org.uk> <500568D9.10805@linaro.org> <20120717133550.GC4477@opensource.wolfsonmicro.com> <50057058.2060002@linaro.org> <20120717142222.GE4477@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20120717142222.GE4477@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 17/07/12 15:22, Mark Brown wrote:
> On Tue, Jul 17, 2012 at 03:02:00PM +0100, Lee Jones wrote:
>
>> I'm sure sure this is relevant in the current case though, as the
>> i2c properties proposed here are platform specific. What we're
>
> I've not seen the specific example (though fankly it seems quite
> surprising that there's anything other than bus speed that the platfo=
rm
> might want to configure for I2C...).
>
>> discussing is some consolidation of property names, which I do
>> support in theory. What I fear is that this driver will lack Device
>> Tree functionality for yet another kernel version if it isn't
>> resolved quickly.
>
> Well, if checking the DT checky box is the important thing then just
> adding an of_match_table ought to be enough?  It's fairly common for
> platform data to have lots of stuff that's not used by most systems
> so you can often cover 90% of systems with a very small subset of the
> configurability.

We could do that, but I'd rather do it in full.

I think it would be okay to take the 3 patches due for the v3.6 merge=20
window, which target the nmk-i2c driver. If any consolidation happens i=
n=20
the mean-time/future I will personally do the work to bring the nmk-i2c=
=20
into line to use any generic bindings which result.

No one else is ever going to use these vendor specific bindings, so I'm=
=20
sure no issues will arise. It also means that we have a fully enabled=20
driver which is capable of receiving a new configuration via minor=20
changes to the dts, which is important for the current (only) user of=20
this driver for an upcoming project.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
