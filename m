From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] media: v4l2-compat-ioctl32: fix missing reserved field
 copy in put_v4l2_create32
Date: Mon, 14 Mar 2016 20:22:42 +0800
Message-ID: <1457958162.8737.3.camel@mtksdaap41>
References: <1457952106-38215-1-git-send-email-tiffany.lin@mediatek.com>
	 <20160314082859.31340fb6@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160314082859.31340fb6-+RedX5hVuTR+urZeOPWqwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-03-14 at 08:28 -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 14 Mar 2016 18:41:46 +0800
> Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> escreveu:
> 
> > Change-Id: Idac449fae5059a3ce255340e6da491f8bd83af7a
> 
> We don't need change-id at the Kernel, but we do need a proper patch
> description.
> 
Hi Mauro,

Sorry, I accidentally add change-id in this patch.
I had remove change-id and add patch description in 
[PATCH v2] media: v4l2-compat-ioctl32: fix missing reserved field copy
in put_v4l2_create32

best regards,
Tiffany


> Regards,
> Mauro
> 
> > ---
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > index f38c076..109f687 100644
> > --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > @@ -280,7 +280,8 @@ static int put_v4l2_format32(struct v4l2_format *kp, struct v4l2_format32 __user
> >  static int put_v4l2_create32(struct v4l2_create_buffers *kp, struct v4l2_create_buffers32 __user *up)
> >  {
> >  	if (!access_ok(VERIFY_WRITE, up, sizeof(struct v4l2_create_buffers32)) ||
> > -	    copy_to_user(up, kp, offsetof(struct v4l2_create_buffers32, format)))
> > +	    copy_to_user(up, kp, offsetof(struct v4l2_create_buffers32, format)) ||
> > +	    copy_to_user(up->reserved, kp->reserved, sizeof(kp->reserved)))
> >  		return -EFAULT;
> >  	return __put_v4l2_format32(&kp->format, &up->format);
> >  }


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
