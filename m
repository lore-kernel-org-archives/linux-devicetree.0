From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: Re: [PATCH V3 2/2] rc: gpio-ir-recv: add timeout on idle
Date: Wed, 23 Sep 2015 15:26:19 +0100
Message-ID: <20150923142619.GA10653@gofer.mess.org>
References: <5602AE95.9000505@nelint.com>
 <1443017228-16499-1-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443017228-16499-1-git-send-email-eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 07:07:08AM -0700, Eric Nelson wrote:
> Many decoders require a trailing space (period without IR illumination)
> to be delivered before completing a decode.
> 
> Since the gpio-ir-recv driver only delivers events on gpio transitions,
> a single IR symbol (caused by a quick touch on an IR remote) will not
> be properly decoded without the use of a timer to flush the tail end
> state of the IR receiver.
> 
> This patch initializes and uses a timer and the timeout field of rcdev
> to complete the stream and allow decode.
> 
> The timeout can be overridden through the use of the LIRC_SET_REC_TIMEOUT
> ioctl.
> 
> Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>

Acked-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
