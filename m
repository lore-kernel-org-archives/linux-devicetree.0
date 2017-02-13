From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: wm831x: Add basic device tree binding
Date: Mon, 13 Feb 2017 09:19:58 +0000
Message-ID: <20170213091958.GX1754@localhost.localdomain>
References: <1486734800-10141-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170213091603.njdtz43mllwpu6qc@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170213091603.njdtz43mllwpu6qc@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 09:16:03AM +0000, Lee Jones wrote:
> On Fri, 10 Feb 2017, Charles Keepax wrote:
> 
> > Add the basic ability to register the device through device tree, more
> > work is needed to get each individual sub-driver functioning correctly
> > but this is enough to get the device to probe from device tree.
> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  MAINTAINERS                     |  1 +
> 
> Irrelevant change.
> 
> Either submit it with patch that introduces the file or on its own.
> 

Cool I will move it into the binding patch, also will fix up that
warning from the build bot for v2 as well.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
