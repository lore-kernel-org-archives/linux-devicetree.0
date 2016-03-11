From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V14 5/9] dma: qcom_hidma: implement lower level hardware
 interface
Date: Fri, 11 Mar 2016 22:02:21 +0530
Message-ID: <20160311163221.GC13211@localhost>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <1454646882-24369-6-git-send-email-okaya@codeaurora.org>
 <20160311020650.GG11154@localhost>
 <56E2EC1C.6040107@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E2EC1C.6040107-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 11:02:36AM -0500, Sinan Kaya wrote:
> > These are rest here are not namespace properly...
> 
> If I understood it right, you want me to prefix them with as HIDMA_xyz.
> Correct?

Yes..

> >> +	/* copy the TRE into its location in the TRE ring */
> >> +	spin_lock_irqsave(&lldev->lock, flags);
> >> +	tre->tre_index = lldev->tre_write_offset / TRE_SIZE;
> >> +	lldev->pending_tre_list[tre->tre_index] = tre;
> >> +	memcpy(lldev->tre_ring + lldev->tre_write_offset, &tre->tre_local[0],
> >> +	       TRE_SIZE);

This one

> >> +	lldev->tx_status_list[tre->idx].err_code = 0;
> >> +	lldev->tx_status_list[tre->idx].err_info = 0;
> >> +	tre->queued = 1;
> >> +	lldev->pending_tre_count++;
> 
> Is this the only one without alignment? I couldn't understand what you mean by 
> above one?

quoting Coding Style:

Statements longer than 80 columns will be broken into sensible chunks, unless
exceeding 80 columns significantly increases readability and does not hide
information. Descendants are always substantially shorter than the parent and
are placed substantially to the right.


> 
> >> +	lldev->tre_write_offset = (lldev->tre_write_offset + TRE_SIZE)
> >> +	    % lldev->tre_ring_size;
> > 
> > These and above one should be right justfied per coding style

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
