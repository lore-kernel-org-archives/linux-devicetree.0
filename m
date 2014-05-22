From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v13 0/5] MPC512x DMA slave s/g support, OF DMA
 lookup
Date: Thu, 22 May 2014 10:40:23 +0530
Message-ID: <20140522051023.GV21128@intel.com>
References: <1400163335-29853-1-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400163335-29853-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 06:15:30PM +0400, Alexander Popov wrote:
> 2013/7/14 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> > this series
> > - introduces slave s/g support (that's support for DMA transfers which
> >    involve peripherals in contrast to mem-to-mem transfers)
> > - adds device tree based lookup support for DMA channels
> > - combines floating patches and related feedback which already covered
> >    several aspects of what the suggested LPB driver needs, to demonstrate
> >    how integration might be done
> 
> ...
> 
> Changes in v12:
>  A new patch (part 2/7) is added to this series.
>  Part 6/7:
>  - change the description of 'compatible' property according part 2/7;
>  - improve the document according Gerhard's feedback;
> 
> Parts 1/7, 2/7 and 4/7 have been applied by Vinod Koul and
> are excluded from v13.
> 
> Changes in v13:
>  A new patch (part 1/5) is added to this series.
>  Part 2/5:
>  - fix style issue;
>  - improve comments;

You need to cc DT- list for 3 to 5 patches. Need ack before we can apply.
I suspect 4/5 should come first out of these 3.

Also in future pls use right subsystem name "dmaengine". Also why are these
tagged as RFC still?

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
