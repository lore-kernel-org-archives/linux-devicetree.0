From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: FW: [PATCH v5 0/8] Add MT8173 Video Encoder Driver and VPU Driver
Date: Mon, 14 Mar 2016 08:21:22 +0100
Message-ID: <56E66672.9030307@xs4all.nl>
References: <D706F7FE148A8A429434F78C46336826048E7053@mtkmbs02n1>
 <1457939579.32502.10.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457939579.32502.10.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/14/2016 08:12 AM, tiffany lin wrote:
> Hi Hans,
> 
> After change to use "v4l-utils.git master branch", "V4l2-compliance
> -d /dev/video1" fail on "fail: v4l2-test-buffers.cpp(555):
> check_0(crbufs.reserved, sizeof(crbufs.reserved))".
> 
> Check the source code and found
> 
> 	memset(&crbufs, 0xff, sizeof(crbufs));   -> crbufs to 0xff
>         node->g_fmt(crbufs.format, i);
>         crbufs.count = 0;
>         crbufs.memory = m;
>         fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));   
>         fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
>         fail_on_test(crbufs.index != q.g_buffers());
> 
> crbufs is initialized to fill with 0xff and after VIDIOC_CREATE_BUFS,
> crbufs.reserved field should be 0x0. But v4l2_m2m_create_bufs and
> vb2_create_bufs do not process reserved filed.
> Do we really need to check reserved filed filled with 0x0? Or we need to
> change vb2_create_bufs to fix this issue?

The reserved field is zeroed in v4l_create_bufs() in v4l2-ioctl.c, so even before
vb2_create_bufs et al is called.

The fact that it is no longer zeroed afterwards suggests that someone is messing
with the reserved field.

You'll have to do a bit more digging, I'm afraid.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
