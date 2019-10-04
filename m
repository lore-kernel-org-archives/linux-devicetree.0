From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 2/2] media: i2c: Add IMX290 CMOS image sensor driver
Date: Fri, 4 Oct 2019 13:59:02 +0300
Message-ID: <20191004105902.GM896@valkosipuli.retiisi.org.uk>
References: <20191003095503.12614-1-manivannan.sadhasivam@linaro.org>
 <20191003095503.12614-3-manivannan.sadhasivam@linaro.org>
 <20191004092336.GL896@valkosipuli.retiisi.org.uk>
 <20191004101902.GA19685@mani>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191004101902.GA19685@mani>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Fri, Oct 04, 2019 at 03:49:02PM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> On Fri, Oct 04, 2019 at 12:23:36PM +0300, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > On Thu, Oct 03, 2019 at 03:25:03PM +0530, Manivannan Sadhasivam wrote:
> > > Add driver for Sony IMX290 CMOS image sensor driver. The driver only
> > > supports I2C interface for programming and MIPI CSI-2 for sensor output.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Could you remove the unneeded ret variable from imx290_power_on() and
> > unneeded goto in the same function?
> >
> 
> yep, sure.
>  
> > The MAINTAINERS entry belongs to the first patch adding new files.
> > 
> 
> You mean the bindings patch? If then, sorry no. Usually the devicetree bindings
> belongs to a separate patch and that is what perferred by Rob. I prefer the
> MAINTAINERS entry in a separate patch but I've seen subsystems maintainers
> asking to squash it with the driver patch. But squashing it with bindings
> patch seems weird to me.

This has been an established practice at least in the media tree. The
MAINTAINERS change is small, and bindings come before the driver. And the
MAINTAINERS change needs to come no later than files are being added, or a
checkpatch.pl warning follows --- which is entirely reasonable. You could
put the MAINTAINERS change to a separate patch, yes, but I personally think
it fits fine with the DT binding patch.

-- 
Regards,

Sakari Ailus
