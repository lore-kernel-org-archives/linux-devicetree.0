From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 4/5] regulator: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Fri, 19 Oct 2018 13:19:20 +0100
Message-ID: <20181019121920.GL1653@imbe.wolfsonmicro.main>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
 <20181019095003.26046-4-ckeepax@opensource.cirrus.com>
 <20181019112622.GB5895@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181019112622.GB5895@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 12:26:22PM +0100, Mark Brown wrote:
> On Fri, Oct 19, 2018 at 10:50:02AM +0100, Charles Keepax wrote:
> 
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.
> 

I don't think any of this has been applied anywhere yet.

> > +++ b/drivers/regulator/lochnagar-regulator.c
> > @@ -0,0 +1,255 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Lochnagar regulator driver
> 
> Please don't mix C and C++ comments like this in the same block, just
> have it be a C++ block so it looks consistent.

Can do.

Thanks,
Charles
