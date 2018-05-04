From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 02/10] media-request: Add a request
 complete operation to allow m2m scheduling
Date: Fri, 04 May 2018 10:03:05 +0200
Message-ID: <ddab13eb3dbc179d4a366248b5f510f147b02556.camel@bootlin.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
	 <20180419154124.17512-3-paul.kocialkowski@bootlin.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7ElAg6Ux7kGsIjD5tVrd"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBE5IWDLQKGQEKK32ONY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180419154124.17512-3-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-7ElAg6Ux7kGsIjD5tVrd
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 2018-04-19 at 17:41 +0200, Paul Kocialkowski wrote:
> When using the request API in the context of a m2m driver, the
> operations that come with a m2m run scheduling call in their
> (m2m-specific) ioctl handler are delayed until the request is queued
> (for instance, this includes queuing buffers and streamon).
> 
> Thus, the m2m run scheduling calls are not called in due time since
> the
> request AP's internal plumbing will (rightfully) use the relevant core
> functions directly instead of the ioctl handler.
> 
> This ends up in a situation where nothing happens if there is no
> run-scheduling ioctl called after queuing the request.
> 
> In order to circumvent the issue, a new media operation is introduced,
> called at the time of handling the media request queue ioctl. It gives
> m2m drivers a chance to schedule a m2m device run at that time.
> 
> The existing req_queue operation cannot be used for this purpose,
> since
> it is called with the request queue mutex held, that is eventually
> needed
> in the device_run call to apply relevant controls.

This patch will be dropped since it's no longer useful with the latest
version of the request API.

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/media/media-request.c | 3 +++
>  include/media/media-device.h  | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/media/media-request.c b/drivers/media/media-
> request.c
> index 415f7e31019d..28ac5ccfe6a2 100644
> --- a/drivers/media/media-request.c
> +++ b/drivers/media/media-request.c
> @@ -157,6 +157,9 @@ static long media_request_ioctl_queue(struct
> media_request *req)
>  		media_request_get(req);
>  	}
>  
> +	if (mdev->ops->req_complete)
> +		mdev->ops->req_complete(req);
> +
>  	return ret;
>  }
>  
> diff --git a/include/media/media-device.h b/include/media/media-
> device.h
> index 07e323c57202..c7dcf2079cc9 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -55,6 +55,7 @@ struct media_entity_notify {
>   * @req_alloc: Allocate a request
>   * @req_free: Free a request
>   * @req_queue: Queue a request
> + * @req_complete: Complete a request
>   */
>  struct media_device_ops {
>  	int (*link_notify)(struct media_link *link, u32 flags,
> @@ -62,6 +63,7 @@ struct media_device_ops {
>  	struct media_request *(*req_alloc)(struct media_device
> *mdev);
>  	void (*req_free)(struct media_request *req);
>  	int (*req_queue)(struct media_request *req);
> +	void (*req_complete)(struct media_request *req);
>  };
>  
>  /**
-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-7ElAg6Ux7kGsIjD5tVrd--
