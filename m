From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] v4l: async: make v4l2 coexist with devicetree nodes in
 a dt overlay
Date: Tue, 06 Dec 2016 12:15:17 +0100
Message-ID: <2ac49275-7762-5ceb-21bd-684862379610@samsung.com>
References: <1480932596-4108-1-git-send-email-javi.merino@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1480932596-4108-1-git-send-email-javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(resending, hopefully now it reaches the mailing lists)

On 12/05/2016 11:09 AM, Javi Merino wrote:

> Each time the overlay is applied, its of_node pointer will be
> different.  We are not interested in matching the pointer, what we
> want to match is that the path is the one we are expecting.  Change to
> use of_node_cmp() so that we continue matching after the overlay has
> been removed and reapplied.
> 
> Signed-off-by: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks, there is clearly a bug in current code as it assumed static
representation of DT in the kernel.

Reviewed-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 5bada20..d33a17c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -42,7 +42,8 @@ static bool match_devname(struct v4l2_subdev *sd,
>  
>  static bool match_of(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> -	return sd->of_node == asd->match.of.node;
> +	return !of_node_cmp(of_node_full_name(sd->of_node),
> +			    of_node_full_name(asd->match.of.node));
>  }
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
