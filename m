From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 3/4] regulator: Add regulator driver for ATC260x PMICs
Date: Mon, 17 Jun 2019 22:04:13 +0530
Message-ID: <20190617163413.GA16152@Mani-XPS-13-9360>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
 <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
 <20190617163015.GD5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617163015.GD5316@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, afaerber@suse.de, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Mon, Jun 17, 2019 at 05:30:15PM +0100, Mark Brown wrote:
> On Mon, Jun 17, 2019 at 09:20:10PM +0530, Manivannan Sadhasivam wrote:
> 
> > +++ b/drivers/regulator/atc260x-regulator.c
> > @@ -0,0 +1,389 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Regulator driver for ATC260x PMICs
> 
> Please make the entire comment a C++ one so this looks more intentional.
> 

Okay.

> > + * Copyright (C) 2019 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> You definitely didn't assign copyright to your employer?

Yeah, that was intentional. This work is not part of Linaro working hours and
falls into my spare time works where I'm trying to complete the upstream support
for Actions Semi Owl series SoCs and target boards which I'm co-maintaining
(sort of)...

Thanks,
Mani
