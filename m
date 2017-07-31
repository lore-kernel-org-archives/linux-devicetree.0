From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v4 2/6] [media] extended-controls.rst: add PorterDuff mode
 control
Date: Mon, 31 Jul 2017 18:07:17 +0200
Message-ID: <d5bc50d0-f468-f1b4-b52a-4f1c10d7d9af@xs4all.nl>
References: <1501515182-26705-1-git-send-email-jacob-chen@iotwrt.com>
 <1501515182-26705-3-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501515182-26705-3-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/31/2017 05:32 PM, Jacob Chen wrote:
> PorterDuff mode control are used to determine
> how two images are combined.
> 
> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/media/uapi/v4l/extended-controls.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
> index abb1057..f9c93bb 100644
> --- a/Documentation/media/uapi/v4l/extended-controls.rst
> +++ b/Documentation/media/uapi/v4l/extended-controls.rst
> @@ -3021,6 +3021,10 @@ Image Process Control IDs
>      The video deinterlacing mode (such as Bob, Weave, ...). The menu items are
>      driver specific and are documented in :ref:`v4l-drivers`.
>  
> +``V4L2_CID_PORTER_DUFF_MODE (menu)``
> +    The PorterDuff blend modes. PorterDuff is way to overlay, combine and
> +    trim images as if they were pieces of cardboard, device could use to
> +    determine how two images are combined.

A little rewrite:

    The PorterDuff blend modes. PorterDuff is a method to overlay, combine and
    trim images as if they were pieces of cardboard. The device uses this to
    determine how two images are combined.

Also add a link to the same android article that you pointed to in the header.

Regards,

	Hans

>  
>  .. _dv-controls:
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
