From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 1/8] regulator: bd71837: Disable voltage monitoring for
 LDO3/4
Date: Wed, 12 Sep 2018 11:53:15 +0300
Message-ID: <20180912085315.GE2381@localhost.localdomain>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <cad2e7baeb7af2d6efbc6afba831b0513087d832.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <20180911124029.GO4185@dell>
 <20180912074745.GD2381@localhost.localdomain>
 <20180912084251.GO4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180912084251.GO4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 09:42:51AM +0100, Lee Jones wrote:
> On Wed, 12 Sep 2018, Matti Vaittinen wrote:
> 
> > On Tue, Sep 11, 2018 at 01:40:29PM +0100, Lee Jones wrote:
> > > On Wed, 29 Aug 2018, Matti Vaittinen wrote:
> > > 
> > > > There is a HW quirk in BD71837. The shutdown sequence timings for
> > > > bucks/LDOs which are enabled via register interface are changed.
> > > > At PMIC poweroff the voltage for BUCK6/7 is cut immediately at the
> > > > beginning of shut-down sequence. This causes LDO5/6 voltage
> > > > monitoring to detect under voltage and force PMIC to emergency
> > > > state instead of poweroff. Disable voltage monitoring for LDO5 and
> > > > LDO6 at probe to avoid this.
> > > > 
> > > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > > ---
> > > >  drivers/regulator/bd71837-regulator.c | 19 +++++++++++++++++++
> > > 
> > > >  include/linux/mfd/rohm-bd718x7.h      | 33 ++++++++++++++++++++++++++++++---
> > > 
> > > For my own reference:
> > >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > 
> > I m not sure if it is relevant but I think this was already applied to
> > Mark's regulator tree.
> 
> Where is Mark's acceptance email?

https://lkml.org/lkml/2018/8/29/644


> 
> -- 
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
