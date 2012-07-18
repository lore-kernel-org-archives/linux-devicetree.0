From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Wed, 18 Jul 2012 11:43:45 +0100
Message-ID: <50069361.1080509@linaro.org>
References: <20120717130650.GB27595@sirena.org.uk> <500568D9.10805@linaro.org> <20120717133550.GC4477@opensource.wolfsonmicro.com> <50057058.2060002@linaro.org> <20120717142222.GE4477@opensource.wolfsonmicro.com> <50057C1A.80606@linaro.org> <20120717152001.GF4477@opensource.wolfsonmicro.com> <20120718053341.GA4009@S2100-06.ap.freescale.net> <20120718095937.GB22739@opensource.wolfsonmicro.com> <50069006.8050301@linaro.org> <20120718103311.GG22739@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120718103311.GG22739@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Shawn Guo <shawn.guo@freescale.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@stericsson.com>, devicetree-discuss@lists.ozlabs.org, Wolfram Sang <w.sang@pengutronix.de>, linux-kernel@vger.kernel.org, Deepak Saxena <dsaxena@linaro.org>, linux-next@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 18/07/12 11:33, Mark Brown wrote:
> On Wed, Jul 18, 2012 at 11:29:26AM +0100, Lee Jones wrote:
>> On 18/07/12 10:59, Mark Brown wrote:
>
>>> It's not the using device tree bit that creates concern for me here=
,
>>> it's the fact that the board and silicon aren't being separated.
>
>> What's the difference?
>
>>> +- db8500.dtsi       // silicon
>>> \=09
>>> +-- snowball.dts    // board
>
> I have glanced at some of this stuff in the past, thanks.  Now think =
how
> that's working for people when they put the configuration for the
> silicon in the same DT node as the configuration for the board...

Granted, ideally the configuration and silicon description should be=20
separated. I don't know that is the case for us yet however. That is=20
something I'll enforce when we have a new dts file, which will be comin=
g=20
very soon.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
