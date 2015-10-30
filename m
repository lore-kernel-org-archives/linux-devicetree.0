From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management driver
Date: Fri, 30 Oct 2015 22:15:09 +0200
Message-ID: <CAHp75VcQ6r2FGqsP2mtnv95etCGJmeQ=T7aKSB5H3cvwhdSbDw@mail.gmail.com>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
	<20151030150025.GF31073@leverpostej>
	<CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
	<5633B207.5030505@codeaurora.org>
	<CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
	<20151030182537.GB30791@leverpostej>
	<CAHp75Vd-z22XJboxQ=CMxDQ9UaTatbCmpAPLO0jPM0FwJadBOg@mail.gmail.com>
	<5633BB66.3070505@codeaurora.org>
	<20151030190106.GC30791@leverpostej>
	<5633CE23.7060303@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5633CE23.7060303-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 10:08 PM, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 10/30/2015 01:01 PM, Mark Rutland wrote:
>> On Fri, Oct 30, 2015 at 02:48:06PM -0400, Sinan Kaya wrote:

>> The CSRT is listed under "Want", not "Never" or "Don't Care", so Linaro
>> have certainly not said that CSRT will not be supported. If anything,
>> they have stated that the table should be supported.
>
> "Want" means interesting, and probably useful, but no clear indication that
> anyone actually needs it.  At one point, we thought we might use the CSRT
> for describing DMA, but it turns out we have not needed to.

Then you are going to have either 1 or 0 DMAC for slave devices, right?

The CSRT, unfortunately, the only way how to enumerate DMAC to be used
by slave devices.
You may look into drivers/dma/acpi-dma.c for usage in Linux.

Yes, I know about _DSD, but I don't think it will provide soon any
other official mechanisms to what we have now. Better to ask Rafael
and Mika.

> However, let's make sure we're saying the same thing: the CSRT table is
> properly defined in the kernel include/acpi/actbl2.h file so one can read
> such a table and use it if they so choose.  Nothing that we have done at
> Linaro in the arm64 part of the kernel relies on any of the content from
> the CSRT, nor does it preclude someone relying on that content.  So, the
> CSRT is defined, and is usable, but is just not being used -- by Linaro --
> at present.

This sounds clear.

> If that needs to change, let me know; no one has asked us to use the CSRT
> for a DMA engine, and we have not been provided any hardware that requires
> it.

See above.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
