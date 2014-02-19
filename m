From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v7 0/6] MPC512x DMA slave s/g support, OF DMA lookup
Date: Wed, 19 Feb 2014 17:17:36 +0400
Message-ID: <CAF0T0X5cQcdXU5-XEA2uZAoYSLyk4eONy+Jj6d4GeE-SrBpG2Q@mail.gmail.com>
References: <1392211508-23615-1-git-send-email-a13xp0p0v88@gmail.com>
	<20140213003253.GL4524@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140213003253.GL4524-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello, Gerhard

2014-02-13 4:32 GMT+04:00 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> For some reason you have kept the DMA maintainers, but dropped
> the dmaengine ML from Cc: -- was this intentional, given that the
> series is specifically about DMA and you want to get feedback?
No, it was not done by intention, I'll fix that in the new version of the
series.

> And you may want to help DT people by not sending purely Linux
> implementation related stuff to them (they already are drinking
> from the firehose).  DT reviewers are foremost interested in
> bindings and policy and remaining OS agnostic, and leave
> mechanical .dts file updates to subsystem maintainers.
Do you mean I should better Cc to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
only parts 3, 4 and 5 of this series? How about cover letter?

Thank you.

Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
