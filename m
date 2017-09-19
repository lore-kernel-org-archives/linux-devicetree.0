From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v13 01/25] v4l: fwnode: Move KernelDoc documentation to
 the header
Date: Tue, 19 Sep 2017 13:04:36 +0200
Message-ID: <29354478-ec46-278b-c457-4e6f3cc6848c@xs4all.nl>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
 <20170915141724.23124-2-sakari.ailus@linux.intel.com>
 <9077921.hsjkiRftLf@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9077921.hsjkiRftLf@avalon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/17 12:48, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Friday, 15 September 2017 17:17:00 EEST Sakari Ailus wrote:
>> In V4L2 the practice is to have the KernelDoc documentation in the header
>> and not in .c source code files. This consequently makes the V4L2 fwnode
>> function documentation part of the Media documentation build.
>>
>> Also correct the link related function and argument naming in
>> documentation.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
>> Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> I'm still very opposed to this. In addition to increasing the risk of 
> documentation becoming stale, it also makes review more difficult. I'm 
> reviewing patch 05/25 of this series and I have to jump around the patch to 
> verify that the documentation matches the implementation, it's really 
> annoying.
> 
> We should instead move all function documentation from header files to source 
> files.

I disagree with this. Yes, it makes reviewing harder, but when you have to
*use* these functions as e.g. a driver developer, then having it in the
header is much more convenient.

Regards,

	Hans

> 
>> ---
>>  drivers/media/v4l2-core/v4l2-fwnode.c | 75 --------------------------------
>> include/media/v4l2-fwnode.h            | 81 +++++++++++++++++++++++++++++++-
>> 2 files changed, 80 insertions(+), 76 deletions(-)
> 
> [snip]
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
