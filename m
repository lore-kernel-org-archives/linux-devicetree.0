From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: Re: [PATCH][resend] rc: gpio-ir-recv: allow flush space on idle
Date: Mon, 14 Sep 2015 11:00:44 +0100
Message-ID: <20150914100044.GA21149@gofer.mess.org>
References: <1441980024-1944-1-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441980024-1944-1-git-send-email-eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 11, 2015 at 07:00:24AM -0700, Eric Nelson wrote:
> Many decoders require a trailing space (period without IR illumination)
> to be delivered before completing a decode.
> 
> Since the gpio-ir-recv driver only delivers events on gpio transitions,
> a single IR symbol (caused by a quick touch on an IR remote) will not
> be properly decoded without the use of a timer to flush the tail end
> state of the IR receiver.

This is a problem other IR drivers suffer from too. It might be better
to send a IR timeout event like st_rc_send_lirc_timeout() in st_rc.c,
with the duration set to what the timeout was. That is what irraw 
timeouts are for; much better than fake transitions.

> This patch adds an optional device tree node "flush-ms" which, if
> present, will use a jiffie-based timer to complete the last pulse
> stream and allow decode.

A common value for this is 100ms, I'm not sure what use it has to have
it configurable. It's nice to have it exposed in rc_dev->timeout.


Sean
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
