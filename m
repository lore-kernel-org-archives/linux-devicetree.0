From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the
 'interesting' ones.
Date: Tue, 17 Sep 2013 12:24:33 +0100
Message-ID: <20130917112433.GB26737@e106331-lin.cambridge.arm.com>
References: <52345182.1080609@kernel.org>
 <52372F2B.3030504@gmail.com>
 <20130917081003.GU16984@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130917081003.GU16984@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 09:10:03AM +0100, Lee Jones wrote:
> > > http://marc.info/?l=linux-iio&m=137881790217809&w=2
> > 
> > Looks reasonable. My only comment is '-' is preferred over '_'.
> 
> Ah, in the node name you mean. Yes, I can change that.
> 
> The compatible string has to stay the same however, as it has to match
> the device name which can't be changed due to possible userspace
> breakage.

I'm not sure I follow why the compatible string must be identical to the
name appearing to userspace.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
