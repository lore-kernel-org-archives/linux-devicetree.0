From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Thu, 21 Jun 2012 14:50:35 +0000
Message-ID: <201206211450.35713.arnd@arndb.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <4FE23A1B.2000809@wwwdotorg.org> <20120620233507.GC4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120620233507.GC4037@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 20 June 2012, Mark Brown wrote:
> On Wed, Jun 20, 2012 at 03:01:15PM -0600, Stephen Warren wrote:
> > The problem is that dtc has no named constants. Using raw integers
> > instead of names would make the .dts file rather unreadable. The issue
> > is much more accute for regulators than say GPIOs or IRQs because
> > there's likely no relative order to the set of regulators defined by the
> > documentation, unlike for GPIOs/IRQs where the integer (often) is the
> > object's primary ID.
> 
> Well, there are actually a lot of chips which do provide useful indexes
> - for example the wm831x devices just have a bunch of DCDCs and a bunch
> of LDOs which can usefully be referred to as DCDCn or LDOn.  They will
> hopefully not need to use this interface.  It's just that there's also a
> large class of devices we need to cater for which don't have any such
> regularity in their register map, this biding
> mechanism is for them.

Ok, now it all makes sense. Thanks for bearing with me being a little
slow on this topic.

It seems that the drivers that are changed to use this could also try to
describe the individual regulators completely, by moving the contents
of e.g. ab8500_regulator_info into the device tree, but having the string
identifier with an in-kernel table makes sense when there is only one
such table.

	Arnd

