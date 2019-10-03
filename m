From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date: Thu, 3 Oct 2019 17:22:52 +0300
Message-ID: <20191003142252.GI896@valkosipuli.retiisi.org.uk>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
 <20191002103715.GR896@valkosipuli.retiisi.org.uk>
 <20191003053338.GA7868@Mani-XPS-13-9360>
 <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
 <3FAB5E91-9FD2-4052-881B-E4B18D44D33B@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FAB5E91-9FD2-4052-881B-E4B18D44D33B@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Thu, Oct 03, 2019 at 12:56:48PM +0530, Manivannan Sadhasivam wrote:
> >> mentioned in the datasheet. I agree that we are missing the userspace
> >> granularity here but sticking to the device limitation shouldn't be a
> >problem.
> >> As I said, I'll add a comment here to clarify.
> >
> >The comment isn't visible in the uAPI.
> >
> 
> Yes. It would be good to have the units passed onto the userspace somehow
> like it is done in IIO. Then we don't need to fiddle in the driver for
> mismatch. Something consider in future...

Yes, I agree. But that is not trivial to do in any sort of even remotely
generic way.

-- 
Sakari Ailus
