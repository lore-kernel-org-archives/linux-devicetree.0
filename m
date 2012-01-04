From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC 1/8] gpio/microblaze: Eliminate duplication of
 of_get_named_gpio_flags()
Date: Wed, 4 Jan 2012 11:30:57 -0700
Message-ID: <20120104183057.GU15503@ponder.secretlab.ca>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-2-git-send-email-grant.likely@secretlab.ca>
 <4EF1B36A.8050304@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EF1B36A.8050304@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 11:22:34AM +0100, Michal Simek wrote:
> Grant Likely wrote:
> >of_reset_gpio_handle() is largely a cut-and-paste copy of
> >of_get_named_gpio_flags(). There really isn't any reason for the
> >split, so this patch deletes the duplicate function
> >
> >Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> >Cc: Michal Simek <monstr@monstr.eu>
> >---
> > arch/microblaze/kernel/reset.c |   43 +--------------------------------------
> > 1 files changed, 2 insertions(+), 41 deletions(-)
> 
> Sorry for taking to long.
> 
> Tested and applied to microblaze tree.

I'd rather take this one through the gpio tree if that is okay.

g.

> 
> Thanks,
> Michal
> 
> -- 
> Michal Simek, Ing. (M.Eng)
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
> Microblaze U-BOOT custodian
