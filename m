From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v5 7/8] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 21 Dec 2018 15:28:55 +0000
Message-ID: <20181221152855.GI16508@imbe.wolfsonmicro.main>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-7-ckeepax@opensource.cirrus.com>
 <154356443157.88331.15749597863624143993@swboyd.mtv.corp.google.com>
 <20181221135037.GH16508@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221135037.GH16508@imbe.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2018 at 01:50:37PM +0000, Charles Keepax wrote:
> On Thu, Nov 29, 2018 at 11:53:51PM -0800, Stephen Boyd wrote:
> > Quoting Charles Keepax (2018-11-20 06:16:30)
> > > +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> > > +MODULE_DESCRIPTION("Clock driver for Cirrus Logic Lochnagar Board");
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_ALIAS("platform:lochnagar-clk");
> > 
> > I think MODULE_ALIAS is not needed if it's this simple?
> > 
> 
> Not actually sure on this one, to be honest its mostly cargo
> culted from other drivers. I will investigate and see what I dig
> up but if has any pointers I would greatly appreciate it.
> 

>From what I can find out it looks like MODULE_ALIAS is indeed
redundant on DT only drivers, which these are at the moment so
will remove and give it a test.

Thanks,
Charles
