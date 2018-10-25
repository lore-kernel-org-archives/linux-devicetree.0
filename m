From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 25 Oct 2018 11:56:26 +0100
Message-ID: <20181025105626.GE16508@imbe.wolfsonmicro.main>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025101248.GT2103@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025101248.GT2103@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 11:12:48AM +0100, Mark Brown wrote:
> On Thu, Oct 25, 2018 at 10:28:16AM +0100, Richard Fitzgerald wrote:
> > On 25/10/18 09:26, Charles Keepax wrote:
> > > On Thu, Oct 25, 2018 at 08:44:59AM +0100, Lee Jones wrote:
> > > I really feel this isn't the driver you are objecting to as such
> > > but the way regmap operates and also we seem to always have the same
> > > discussions around regmap every time we push a driver. Is there
> > > any way me, you and Mark could hash this out and find out a way to
> > > handle regmaps that is acceptable to you? I don't suppose you are
> > > in Edinburgh at the moment for ELCE?
> 
> > I suppose if Mark was willing to promote the regmap drivers to be a
> > top-level subsystem that could contain the regmap definitions of devices
> > then we could dump our regmap definitions in there, where Mark can review
> > it as he's familiar with regmap and the chips and the reasons why things
> > are done the way they are, rather than Lee having to stress about it every
> > time we need to create an MFD device that uses regmap. Though that would
> > make the initialization of an MFD rather awkward with the code required
> > to init the MFD it not actually being in the MFD tree.
> 
> I'm not totally against dumping the data tables in some other directory
> (we could do ../regmap/tables or whatever) but I fear it's going to
> cause otherwise needless cross tree issues.

I guess there is a question here, if i split the regmap stuff
into a separate file within mfd would that be enough? Is it just
the mixing of these tables and the code you object to Lee or is
it the fact the tables exist at all?

Thanks,
Charles
