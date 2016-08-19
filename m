From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v3 3/4] media: Add Mediatek MDP Driver
Date: Fri, 19 Aug 2016 08:03:29 +0200
Message-ID: <2d18a4ee-69e6-e400-22b6-b3867b91b5c0@xs4all.nl>
References: <1470751137-12403-1-git-send-email-minghsiu.tsai@mediatek.com>
 <1470751137-12403-4-git-send-email-minghsiu.tsai@mediatek.com>
 <861e5c51-1333-fdc7-2793-d4741a48c72f@xs4all.nl>
 <1471586051.1540.11.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471586051.1540.11.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/19/2016 07:54 AM, Minghsiu Tsai wrote:
> On Mon, 2016-08-15 at 14:55 +0200, Hans Verkuil wrote:
>> On 08/09/2016 03:58 PM, Minghsiu Tsai wrote:
>> This isn't right. For VIDEO_CAPTURE you support the COMPOSE targets, and for
>> the VIDEO_OUTPUT you support the CROP targets. Right now I can use e.g. TGT_CROP
>> with VIDEO_CAPTURE, which isn't correct.
>>
>> s_selection has the same problem.
>>
> 
> So my understanding is
> VIDEO_OUTPUT -> only allow to use target XXX_CROP_XXX
> VIDEO_CAPTURE -> only allow to use target XXX_COMPOSE_XXX
> 
> Am I right?

Correct.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
