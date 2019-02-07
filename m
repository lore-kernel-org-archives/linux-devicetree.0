Return-Path: <SRS0=rfZI=QO=opensource.cirrus.com=ckeepax@kernel.org>
Date: Thu, 7 Feb 2019 10:45:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v7 4/6] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Message-ID: <20190207104536.GA6336@imbe.wolfsonmicro.main>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
 <20190130114128.21083-4-ckeepax@opensource.cirrus.com>
 <20190207075011.GC4672@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190207075011.GC4672@dell>
To: Lee Jones <lee.jones@linaro.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 07, 2019 at 07:50:11AM +0000, Lee Jones wrote:
> On Wed, 30 Jan 2019, Charles Keepax wrote:
> >  MAINTAINERS                         |  17 ++
> >  drivers/mfd/Kconfig                 |   8 +
> >  drivers/mfd/Makefile                |   2 +
> >  drivers/mfd/lochnagar-i2c.c         | 398 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/lochnagar.h       |  55 +++++
> >  include/linux/mfd/lochnagar1_regs.h | 157 ++++++++++++++
> >  include/linux/mfd/lochnagar2_regs.h | 291 ++++++++++++++++++++++++++
> >  7 files changed, 928 insertions(+)
> >  create mode 100644 drivers/mfd/lochnagar-i2c.c
> >  create mode 100644 include/linux/mfd/lochnagar.h
> >  create mode 100644 include/linux/mfd/lochnagar1_regs.h
> >  create mode 100644 include/linux/mfd/lochnagar2_regs.h
> 
> Looks quite suitable now.  Thanks for sticking with it.
> 

No problem, we got there.

> Applied, thanks.
> 

Thanks,
Charles
