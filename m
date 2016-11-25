From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 2/4] mfd: pv88080: MFD core support
Date: Fri, 25 Nov 2016 08:34:47 +0000
Message-ID: <20161125083447.GY10134@dell.home>
References: <cover.1479429347.git.eric.jeong@diasemi.com>
 <d5a2f377ee9ea7a7b68c9545ada0405b8134a9f4.1479429347.git.eric.jeong@diasemi.com>
 <20161121130919.GB3917@dell>
 <8FA4409277D6E54680546B8811D8541002A088125C@NB-EX-MBX01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8FA4409277D6E54680546B8811D8541002A088125C@NB-EX-MBX01.diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Hyeung Dong Jeong <eric.jeong.opensource@diasemi.com>
Cc: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Fri, 25 Nov 2016, Eric Hyeung Dong Jeong wrote:
> On Monday, November 21, 2016 10:09 PM, Lee Jones Wrote:
> > On Fri, 18 Nov 2016, Eric Jeong wrote:
> > 
> > >
> > > From: Eric Jeong <eric.jeong.opensource@diasemi.com>
> > >
> > > This patch adds supports for PV88080 MFD core device.
> > >
> > > It provides communication through the I2C interface.
> > > It contains the following components:
> > >     - Regulators
> > >     - Configurable GPIOs
> > >
> > > Kconfig and Makefile are updated to reflect support for PV88080 PMIC.
> > >
> > > Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
> > >
> > > ---
> > > This patch applies against linux-next and next-20161117
> > >
> > > Hi,
> > >
> > > This patch adds MFD core driver for PV88080 PMIC.
> > > This is done as part of the existing PV88080 regulator driver by
> > > expending the driver for GPIO function support.
> > >
> > > Change since PATCH V2
> > >  - Make one file insted of usging core and i2c file
> > >  - Use devm_ function to be managed resource automatically
> > >  - Separated mfd_cell and regmap_irq_chip declaration for clarification.
> > >  - Updated Kconfig to use OF and assign yes to I2C
> > >
> > > Change since PATCH V1
> > >  - Patch separated from PATCH V1
> > >
> > > Regards,
> > > Eric Jeong, Dialog Semiconductor Ltd.
> > >
> > >
> > >  drivers/mfd/Kconfig         |   12 ++
> > >  drivers/mfd/Makefile        |    1 +
> > >  drivers/mfd/pv88080.c       |  331 +++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/pv88080.h |  222 +++++++++++++++++++++++++++++
> > >  4 files changed, 566 insertions(+)
> > >  create mode 100644 drivers/mfd/pv88080.c  create mode 100644
> > > include/linux/mfd/pv88080.h

It's a good idea to cut out all of the code/comments that is either
not relevant, or you are not providing comment (besides "will do")
on.

> > > +struct pv88080 {
> > > +	struct device *dev;
> > > +	struct regmap *regmap;
> > > +	unsigned long type;
> > 
> > Does this really need to be in here?
> 
> The *type* member is used for separating silicon type.  
> And, regulator and gpio driver also use the member to check the type 
> for proper configuration without additional code. 
> That is the reason that the member is added in the structure.

I don't see how this is being used, so assuming the other Maintainers
are happy with the implementation it's okay for this to live here.
However, please consider changing to something better than "value" or
"type".  Perhaps "varian"t or "model" or similar would be better?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
