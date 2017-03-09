From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv3 03/15] ov7670: fix g/s_parm
Date: Thu, 9 Mar 2017 20:19:38 +0200
Message-ID: <20170309181938.GP3220@valkosipuli.retiisi.org.uk>
References: <20170306145616.38485-1-hverkuil@xs4all.nl>
 <20170306145616.38485-4-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170306145616.38485-4-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, Mar 06, 2017 at 03:56:04PM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> Drop unnecesary memset. Drop the unnecessary extendedmode check and
> set the V4L2_CAP_TIMEPERFRAME capability.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/media/i2c/ov7670.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index 9af8d3b8f848..50e4466a2b37 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -1046,7 +1046,6 @@ static int ov7670_g_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *parms)
>  	if (parms->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		return -EINVAL;
>  
> -	memset(cp, 0, sizeof(struct v4l2_captureparm));
>  	cp->capability = V4L2_CAP_TIMEPERFRAME;
>  	info->devtype->get_framerate(sd, &cp->timeperframe);
>  
> @@ -1061,9 +1060,8 @@ static int ov7670_s_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *parms)
>  
>  	if (parms->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		return -EINVAL;
> -	if (cp->extendedmode != 0)
> -		return -EINVAL;
>  
> +	cp->capability = V4L2_CAP_TIMEPERFRAME;
>  	return info->devtype->set_framerate(sd, tpf);
>  }
>  

We seem to have two ways to specify the frame interval for sub-devices,
with roughly roughly similar number of users. s_parm() originates from
drivers that typically work on plain V4L2 interfaces whereas
s_frame_interval() is from native sub-device drivers.

Anyway,

Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
