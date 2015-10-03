From: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH V2 1/2] rc-core: define a default timeout for drivers
Date: Sat, 3 Oct 2015 11:25:10 -0300
Message-ID: <20151003112510.54fe2a25@recife.lan>
References: <1441980024-1944-1-git-send-email-eric@nelint.com>
	<1442862524-3694-1-git-send-email-eric@nelint.com>
	<1442862524-3694-2-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442862524-3694-2-git-send-email-eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Em Mon, 21 Sep 2015 12:08:43 -0700
Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org> escreveu:

> A default timeout value of 100ms is workable for most decoders.
> Declare a constant to help standardize its' use.

I guess the worse case scenario is the NEC protocol:
	http://www.sbprojects.com/knowledge/ir/nec.php

with allows a repeat message to be sent on every 110ms. As the
repeat message is 11.25 ms, that would mean a maximum time without
data for 98.75 ms. So, in thesis, 100 ms would be ok. However, IR
timings are not always precise and may affected by the battery charge.

So, I think that a timeout of 100ms is too close to 98.75 and may
cause troubles.

S, IMHO, it is safer to define the default timeout as 125ms.

Regards,
Mauro


> 
> Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
> ---
>  include/media/rc-core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/rc-core.h b/include/media/rc-core.h
> index ec921f6..62c64bd 100644
> --- a/include/media/rc-core.h
> +++ b/include/media/rc-core.h
> @@ -239,6 +239,7 @@ static inline void init_ir_raw_event(struct ir_raw_event *ev)
>  	memset(ev, 0, sizeof(*ev));
>  }
>  
> +#define IR_DEFAULT_TIMEOUT	MS_TO_NS(100)
>  #define IR_MAX_DURATION         500000000	/* 500 ms */
>  #define US_TO_NS(usec)		((usec) * 1000)
>  #define MS_TO_US(msec)		((msec) * 1000)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
