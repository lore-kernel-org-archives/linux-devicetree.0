From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Thu, 21 Jun 2012 17:17:45 +0000
Message-ID: <201206211717.46142.arnd@arndb.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <201206211450.35713.arnd@arndb.de> <20120621161459.GY4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120621161459.GY4037@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 June 2012, Mark Brown wrote:
>   Show Details
>   On Thu, Jun 21, 2012 at 02:50:35PM +0000, Arnd Bergmann wrote:
> 
> > It seems that the drivers that are changed to use this could also try to
> > describe the individual regulators completely, by moving the contents
> > of e.g. ab8500_regulator_info into the device tree, but having the string
> > identifier with an in-kernel table makes sense when there is only one
> > such table.
> 
> I'm not that big a fan of moving all the data into device tree as it
> means that you need even more parsing code and you need to update the
> device trees for every board out there every time you want to add
> support for a new feature which doesn't seem like a win.  Right now with
> the DT kept in the kernel it's not so bad but if we ever do start
> distributing it separately it becomes more of an issue.

Right. It's certainly a trade-off. If a company makes 100 SoCs that
all have similar-but-different regulators, then it should be clear
win to have the driver be very abstract and fed with DT data for
configuragtion.

> I'm also not sure if the tooling works well for allowing people to
> include standard DTs for chips and add new properties to nodes for the
> board specific configuration, though I think I've seen a few things
> which suggested that was dealt with reasonably well.

It should never be necessary to add board-specific properties in the
nodes that describe the SoC specific bits. What I was referring to
is just moving the data that currently resides in the regulator
driver into DT.

	Arnd
