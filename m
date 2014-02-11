From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Tue, 11 Feb 2014 18:22:34 +0100
Message-ID: <52FA5C5A.1090008@samsung.com>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de>
 <CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com>
 <20140211145248.GI26684@n2100.arm.linux.org.uk> <8648675.AIXYyYlgXy@avalon>
 <1392136617.6943.33.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1392136617.6943.33.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(adding Guennadi to Cc)

On 11/02/14 17:36, Philipp Zabel wrote:
> Am Dienstag, den 11.02.2014, 16:23 +0100 schrieb Laurent Pinchart:
>> Hi Russell,
>>
>> On Tuesday 11 February 2014 14:52:48 Russell King - ARM Linux wrote:
>>> On Tue, Feb 11, 2014 at 07:56:33AM -0600, Rob Herring wrote:
>>>> On Tue, Feb 11, 2014 at 5:45 AM, Philipp Zabel wrote:
>>>>> This allows to reuse the same parser code from outside the V4L2
>>>>> framework, most importantly from display drivers. There have been
>>>>> patches that duplicate the code (and I am going to send one of my own),
>>>>> such as
>>>>> http://lists.freedesktop.org/archives/dri-devel/2013-August/043308.html
>>>>> and others that parse the same binding in a different way:
>>>>> https://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg100761.html
>>>>>
>>>>> I think that all common video interface parsing helpers should be moved
>>>>> to a single place, outside of the specific subsystems, so that it can
>>>>> be reused by all drivers.
>>>>
>>>> Perhaps that should be done rather than moving to drivers/of now and
>>>> then again to somewhere else.
>>>
>>> Do you have a better suggestion where it should move to?
>>>
>>> drivers/gpu/drm - no, because v4l2 wants to use it
>>> drivers/media/video - no, because DRM drivers want to use it
>>> drivers/video - no, because v4l2 and drm drivers want to use it
>>
>> Just pointing out a missing location (which might be rejected due to similar 
>> concerns), there's also drivers/media, which isn't V4L-specific.
> 
> Since drivers/Makefile has media/ in obj-y, moving the graph helpers to
> drivers/media should technically work.
> 
>>> Maybe drivers/of-graph/ ?  Or maybe it's just as good a place to move it
>>> into drivers/of ?
> 
> include/media/of_graph.h,
> drivers/media/of_graph.c?

drivers/media sounds like a good alternative to me.

I would just remove also v4l2_of_{parse/get}* and update the users
to call of_graph_* directly, there should not be many of them.

--
Thanks,
Sylwester

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
