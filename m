From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 1/8] perf: Export perf_event_update_userpage
Date: Fri, 3 Nov 2017 11:16:10 +0000
Message-ID: <20171103111610.zksofse7w55qu34u@lakrids.cambridge.arm.com>
References: <20171031172318.11823-1-suzuki.poulose@arm.com>
 <20171031172318.11823-2-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171031172318.11823-2-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[+ Ingo]

On Tue, Oct 31, 2017 at 05:23:11PM +0000, Suzuki K Poulose wrote:
> Export perf_event_update_userpage() so that PMU driver using them,
> can be built as modules.

Peter, Ingo, are you happy with this?

It would be useful if we could take this via the arm64 tree with the
rest of the series.

Thanks,
Mark.

> Cc: Peter Zilstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
> ---
>  kernel/events/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 9d93db81fa36..550015829db8 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -4982,6 +4982,7 @@ void perf_event_update_userpage(struct perf_event *event)
>  unlock:
>  	rcu_read_unlock();
>  }
> +EXPORT_SYMBOL_GPL(perf_event_update_userpage);
>  
>  static int perf_mmap_fault(struct vm_fault *vmf)
>  {
> -- 
> 2.13.6
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
