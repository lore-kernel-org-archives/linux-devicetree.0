From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/7] [Media] vcodec: mediatek: Add Mediatek V4L2 Video
 Decoder Driver
Date: Tue, 19 Apr 2016 14:46:17 +0800
Message-ID: <1461048377.32652.19.camel@mtksdaap41>
References: <1460548915-17536-1-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-2-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-3-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-4-git-send-email-tiffany.lin@mediatek.com>
	 <5710FA3A.2030603@xs4all.nl> <1460958046.7861.48.camel@mtksdaap41>
	 <57148D8E.9060601@xs4all.nl> <1460967754.7861.61.camel@mtksdaap41>
	 <1461001697.2719.7.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461001697.2719.7.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Mon, 2016-04-18 at 13:48 -0400, Nicolas Dufresne wrote:
> Le lundi 18 avril 2016 =C3=A0 16:22 +0800, tiffany lin a =C3=A9crit :
> > > > We are plaining to remove m2m framework in th feature, although
> > we think
> > >=20
> > > Remove it for just the decoder driver or both encoder and decoder=
?
> > >=20
> > Remove it from decoder driver.
>=20
> Did you look at how CODA handle it (drivers/media/platform/coda/coda-
> common.c) ? I don't know any detail, but they do have the same issue
> and use both v4l2_m2m_fop_poll and v4l2_m2m_fop_mmap.
>=20
I check coda-common.c, it use v4l2_m2m_set_src_buffered to allow
device_run be triggered without OUTPUT buffer.

Double check the patch "[media] mem2mem: add support for hardware
buffered queue".
This patch make m2m framework could support that
1. out-of-order frames, causing a few mem2mem device runs in the
beginning, that don't produce any decompressed buffer at the v4l2
capture side.
2. the last few frames can be decoded from the bitstream with mem2mem
device runs that don't need a new input buffer at the v4l2 output side.

This is similar our requirement that we want start decode without
CAPTURE buffer.
Is there any restriction that when v4l2_m2m_set_src_buffered can be
used?



best regards,
Tiffany

> cheers,
> Nicolas


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
