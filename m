From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] regulator: Add regulator driver for ATC260x PMICs
Date: Mon, 17 Jun 2019 22:30:08 +0200
Message-ID: <20190617203008.GB8381@kroah.com>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
 <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
 <20190617163015.GD5316@sirena.org.uk>
 <20190617163413.GA16152@Mani-XPS-13-9360>
 <a38d26d1-213c-31ef-9cc7-1d4bdda4ceab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a38d26d1-213c-31ef-9cc7-1d4bdda4ceab@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mark Brown <broonie@kernel.org>, lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 06:38:53PM +0200, Andreas Färber wrote:
> Hi,
> 
> Am 17.06.19 um 18:34 schrieb Manivannan Sadhasivam:
> > On Mon, Jun 17, 2019 at 05:30:15PM +0100, Mark Brown wrote:
> >> On Mon, Jun 17, 2019 at 09:20:10PM +0530, Manivannan Sadhasivam wrote:
> >>
> >>> +++ b/drivers/regulator/atc260x-regulator.c
> >>> @@ -0,0 +1,389 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Regulator driver for ATC260x PMICs
> >>
> >> Please make the entire comment a C++ one so this looks more intentional.
> 
> No, this is intentional and the official style requested by GregKH.

Mark likes them all to be // at the top of the file.

I only required that the SPDX line be that way.

Mark can ask for more if he wants to :)

thanks,

greg k-h
