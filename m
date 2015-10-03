From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] rc-core: define a default timeout for drivers
Date: Sat, 3 Oct 2015 07:52:18 -0700
Message-ID: <560FEBA2.6040504@nelint.com>
References: <1441980024-1944-1-git-send-email-eric@nelint.com>
 <1442862524-3694-1-git-send-email-eric@nelint.com>
 <1442862524-3694-2-git-send-email-eric@nelint.com>
 <20151003112510.54fe2a25@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151003112510.54fe2a25-+RedX5hVuTR+urZeOPWqwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Mauro,

On 10/03/2015 07:25 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 21 Sep 2015 12:08:43 -0700
> Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org> escreveu:
> 
>> A default timeout value of 100ms is workable for most decoders.
>> Declare a constant to help standardize its' use.
> 
> I guess the worse case scenario is the NEC protocol:
> 	http://www.sbprojects.com/knowledge/ir/nec.php
> 
> with allows a repeat message to be sent on every 110ms. As the
> repeat message is 11.25 ms, that would mean a maximum time without
> data for 98.75 ms. So, in thesis, 100 ms would be ok. However, IR
> timings are not always precise and may affected by the battery charge.
> 
> So, I think that a timeout of 100ms is too close to 98.75 and may
> cause troubles.
> 
> S, IMHO, it is safer to define the default timeout as 125ms.
> 

Sounds good. I'll submit V3 shortly.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
