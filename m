From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/5] mfd: arizona: Add DT binding for the DMIC
	references
Date: Mon, 2 Mar 2015 09:32:44 +0000
Message-ID: <20150302093244.GB2042@opensource.wolfsonmicro.com>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1425135268-32340-3-git-send-email-ckeepax@opensource.wolfsonmicro.com> <20150302075341.GA31325@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150302075341.GA31325@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 02, 2015 at 07:53:41AM +0000, Lee Jones wrote:
> On Sat, 28 Feb 2015, Charles Keepax wrote:
> 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  drivers/mfd/arizona-core.c |   10 ++++++++++
> >  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> Same here.  Requires DT/Clk Ack.

This specifies the reference voltage rather than clock so
probably a clk ack is not appropriate, I guess that means I
should perhaps add some clarification to the commit message
though.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
