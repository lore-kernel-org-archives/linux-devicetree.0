From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: All device tree bindings need maintainer ack or just the 'interesting'
 ones.
Date: Mon, 16 Sep 2013 11:17:47 -0500
Message-ID: <52372F2B.3030504@gmail.com>
References: <52345182.1080609@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52345182.1080609-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/14/2013 07:07 AM, Jonathan Cameron wrote:
> Hi All,
> 
> I'm getting a lot of IIO related device tree bindings at the moment.
> Most are pretty trivial e.g.
> 
> http://marc.info/?l=linux-iio&m=137881790217809&w=2

Looks reasonable. My only comment is '-' is preferred over '_'.

> I know you are probably still working out how the device tree maintainership
> is going to work in the long run, but in the meantime do you want me to hold
> these on an Ack from one of the maintainers and/or to ensure that they are all posted
> to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org?

I think if it is something self-contained to a node using existing
binding definitions and typically just a new compatible string like the
above case, then they don't need an ack. The main requirement in this
case is that compatible strings and other properties are documented. For
new or changes to common bindings, then they should be acked. If in
doubt, you can always require an ack on a case by case basis.

> Really the question is do you want to be completely treated like any other subsystem,
> where, if a driver touches it, in how ever trivial a fashion, the assumption is it
> would be unwise to not attempt to get an Ack from the relevant maintainer.
> 
> There are plenty of more 'interesting' IIO binding questions out there and obviously
> those need the input from the list and maintainers!
> 
> In the meantime, we'll send everything to devicetree-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

That should always be the case whether we require an ack or not.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
