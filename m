Return-Path: <SRS0=gAuK=MI=pengutronix.de=mfe@kernel.org>
Date: Wed, 26 Sep 2018 10:15:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 0/3] Add GPIO brownout detection support
Message-ID: <20180926081544.z6hg5ap275cp6dh7@pengutronix.de>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
 <20180925170915.GP20825@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180925170915.GP20825@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 18-09-25 10:09, Mark Brown wrote:
> On Tue, Sep 25, 2018 at 11:42:27AM +0200, Marco Felsch wrote:
> 
> > Marco Felsch (3):
> >   spi: switch to SPDX license identifier
> 
> This seems like a completely unrelated change, why is it part of this
> series?

You're right. I saw the old header during my work on this topic. I can
exclude it as a own patch.

Regards,
Marco

> 
> >   spi: make OF helper available for others
> >   Input: add generic gpio brownout driver
> > 
> >  .../bindings/input/gpio-brownout.txt          |  36 ++++
> >  drivers/input/misc/Kconfig                    |  12 ++
> >  drivers/input/misc/Makefile                   |   1 +
> >  drivers/input/misc/gpio-brownout.c            | 166 ++++++++++++++++++
> >  drivers/spi/spi.c                             |  18 +-
> >  include/linux/spi/spi.h                       |  30 ++--
> >  6 files changed, 239 insertions(+), 24 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/gpio-brownout.txt
> >  create mode 100644 drivers/input/misc/gpio-brownout.c
> > 
> > -- 
> > 2.19.0
> > 
