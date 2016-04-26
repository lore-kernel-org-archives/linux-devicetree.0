From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V17 1/3] dmaengine: qcom_hidma: implement lower level
 hardware interface
Date: Tue, 26 Apr 2016 21:54:41 +0530
Message-ID: <20160426162441.GJ2274@localhost>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-2-git-send-email-okaya@codeaurora.org>
 <20160426032805.GA2274@localhost>
 <571F8397.5000803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571F8397.5000803-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 26, 2016 at 11:04:55AM -0400, Sinan Kaya wrote:
> On 4/25/2016 11:28 PM, Vinod Koul wrote:
> >> +
> >> +			/* reset the channel for recovery */
> >> +			if (hidma_ll_setup(lldev)) {
> > 
> > should this be done in ISR?
> 
> I created a new tasklet called rst_task and posted the code there. 

sounds better

> 
>  /*
> + * Abort all transactions and perform a reset.
> + */
> +static void hidma_ll_abort(unsigned long arg)
> +{
> +       u8 err_code = HIDMA_EVRE_STATUS_ERROR;
> +       u8 err_info = 0xFF;
> +
> +       dev_err(lldev->dev, "error 0x%x, resetting...\n",
> +               cause);

right justify this and others as well please

> >> +int hidma_ll_resume(struct hidma_lldev *lldev)
> >> +{
> >> +	return hidma_ll_enable(lldev);
> >> +}
> > 
> > why do we need this empty function, use hidma_ll_enable.
> 
> hidma_ll_enable is a common function that gets called from multiple places. 
> hidma_ll_resume and hidma_ll_pause is used by the OS interface for pausing
> and resuming the DMA channel. 

is there a reason why we can't have the code in resume and that being called
internally as well as externally?

> >> +/*
> >> + * Note that even though we stop this channel
> >> + * if there is a pending transaction in flight
> >> + * it will complete and follow the callback.
> >> + * This request will prevent further requests
> >> + * to be made.
> > 
> > Why the odd formating?
> 
> aligned to 75 characters.

This seems to be 50 chars!

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
