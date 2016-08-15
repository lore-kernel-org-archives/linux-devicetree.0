From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Add MT8173 Video Decoder Driver
Date: Mon, 15 Aug 2016 17:10:47 +0800
Message-ID: <1471252247.28498.8.camel@mtksdaap41>
References: <1464611363-14936-1-git-send-email-tiffany.lin@mediatek.com>
	 <bdac7fe1-6425-2a3d-777f-86cfd1ee26e0@xs4all.nl>
	 <1471251821.28498.7.camel@mtksdaap41>
	 <74aa2d31-97dd-d274-e07d-b4532c0f4fa5@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74aa2d31-97dd-d274-e07d-b4532c0f4fa5-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,


On Mon, 2016-08-15 at 11:07 +0200, Hans Verkuil wrote:
> On 08/15/2016 11:03 AM, Tiffany Lin wrote:
> > Hi Hans,
> > 
> > I upstream v4 on 8/10, I don't know why this version is not shown in
> > https://patchwork.kernel.org.
> > But I could see it in other link.
> > http://www.spinics.net/lists/arm-kernel/msg523095.html
> > I refine DocBook and vb2 queue_setup function in v4.
> > 
> > For the MT21 format, if I put MT21 into separate patch, this patch
> > series will build fail, I was confused how to fix this issue?
> 
> Just don't implement that pixelformat yet. I.e. everything else can be
> implemented, just don't add MT21 to the list of pixelformats. Do that in
> a separate patch at the end.
> 
> If that pixelformat isn't exposed, then nobody will use it either :-)
> 
Got it now.
Thanks a lot.


best regards,
Tiffany

> Regards,
> 
> 	Hans


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
