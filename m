From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v9 5/9] media: platform: Add Cedrus VPU
 decoder driver
Date: Fri, 7 Sep 2018 15:52:00 +0200
Message-ID: <2c9689b2-c5a6-58b7-b467-fc53208ecd2d@xs4all.nl>
References: <20180906222442.14825-1-contact@paulk.fr>
 <20180906222442.14825-6-contact@paulk.fr>
 <4b30c0bf-e525-1868-f625-569d4a104aa0@xs4all.nl>
 <20180907132620.lmsvlwpa3rzioj2h@flea>
Reply-To: hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC3MVVMX3ELBBBEFZLOAKGQEUZ23MXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180907132620.lmsvlwpa3rzioj2h@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/07/2018 03:26 PM, Maxime Ripard wrote:
> Hi Hans,
> 
> On Fri, Sep 07, 2018 at 03:13:19PM +0200, Hans Verkuil wrote:
>> On 09/07/2018 12:24 AM, Paul Kocialkowski wrote:
>>> From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>>
>>> This introduces the Cedrus VPU driver that supports the VPU found in
>>> Allwinner SoCs, also known as Video Engine. It is implemented through
>>> a V4L2 M2M decoder device and a media device (used for media requests).
>>> So far, it only supports MPEG-2 decoding.
>>>
>>> Since this VPU is stateless, synchronization with media requests is
>>> required in order to ensure consistency between frame headers that
>>> contain metadata about the frame to process and the raw slice data that
>>> is used to generate the frame.
>>>
>>> This driver was made possible thanks to the long-standing effort
>>> carried out by the linux-sunxi community in the interest of reverse
>>> engineering, documenting and implementing support for the Allwinner VPU.
>>>
>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>> Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>
>> One high-level comment:
>>
>> Can you add a TODO file for this staging driver? This can be done in
>> a follow-up patch.
>>
>> It should contain what needs to be done to get this out of staging:
>>
>> - Request API needs to stabilize
>> - Userspace support for stateless codecs must be created
> 
> On that particular note, as part of the effort to develop the driver,
> we've also developped two userspace components:
> 
>   - v4l2-request-test, that has a bunch of sample frames for various
>     codecs and will rely solely on the kernel request api (and DRM for
>     the display part) to test and bringup a particular driver
>     https://github.com/bootlin/v4l2-request-test
> 
>   - libva-v4l2-request, that is a libva implementation using the
>     request API
>     https://github.com/bootlin/libva-v4l2-request
> 
> Did you have something else in mind?

Reviewing this will be the next step. I haven't looked at the userspace components
at all yet, so I don't know yet whether it is what we expect/want/need.

I think this might be a very good topic for the media summit in October if we
can get all the stakeholders together.

Regards,

	Hans
