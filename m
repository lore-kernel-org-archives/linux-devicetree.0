From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] [media] : v4l: add Mediatek compressed video
 block format
Date: Mon, 11 Jul 2016 10:04:42 +0800
Message-ID: <1468202682.3725.0.camel@mtksdaap41>
References: <1463052250-38262-1-git-send-email-tiffany.lin@mediatek.com>
	 <1463052250-38262-2-git-send-email-tiffany.lin@mediatek.com>
	 <1463052250-38262-3-git-send-email-tiffany.lin@mediatek.com>
	 <78c9f4a1-e2b8-69ef-acc5-d24984497b33@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <78c9f4a1-e2b8-69ef-acc5-d24984497b33-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Fri, 2016-07-08 at 12:18 +0200, Hans Verkuil wrote:
> On 05/12/2016 01:24 PM, Tiffany Lin wrote:
> > Add V4L2_PIX_FMT_MT21 format used on MT8173 driver.
> > It is compressed format and need MT8173 MDP driver to transfer to other 
> > standard format.
> > 
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  include/uapi/linux/videodev2.h |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 8f95191..52feea6 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -625,6 +625,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale 8-bit L/R interleaved */
> >  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
> >  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
> > +#define V4L2_PIX_FMT_MT21     v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
> 
> v4l2-ioctl.c should be modified as well so the correct description string is filled in.
> 
Got it. I will fix this.

best regards,
Tiffany

> Regards,
> 
> 	Hans
> 
> >  
> >  /* SDR formats - used only for Software Defined Radio devices */
> >  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
