From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v3 6/6] regulator: bd71837: BD71837 PMIC regulator driver
Date: Wed, 6 Jun 2018 10:44:34 +0300
Message-ID: <20180606074434.GE20078@localhost.localdomain>
References: <cover.1527587295.git.matti.vaittinen@fi.rohmeurope.com>
 <68b0cf2c7ab5578eef2f71a33315bc8ab9a68a39.1527587295.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeVSbZd12vXew9f0z2m1=BFz+cOKomga3SZEzg=kx9CFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VeVSbZd12vXew9f0z2m1=BFz+cOKomga3SZEzg=kx9CFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org


On Tue, Jun 05, 2018 at 04:58:43PM +0300, Andy Shevchenko wrote:
> On Tue, May 29, 2018 at 1:02 PM, Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > Support for controlling the 8 bucks and 7 LDOs the PMIC contains.
> 

Thanks for the comments Andy. The regulator part of patch set v4 was
already applied by Mark but I am going to do some further work on this
afer I get the MFD and clk portions done. I'll store these comments and
address issues in next set of patches.

Br,
	Matti Vaittinen
