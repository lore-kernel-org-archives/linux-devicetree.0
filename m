From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert "[media] tvp5150: document input connectors DT
 bindings"
Date: Tue, 23 Feb 2016 13:50:32 -0600
Message-ID: <20160223195032.GA21259@rob-hp-laptop>
References: <1456253288-397-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456253288-397-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 03:48:08PM -0300, Javier Martinez Canillas wrote:
> This reverts commit 82c2ffeb217a ("[media] tvp5150: document input
> connectors DT bindings") since the DT binding is too device driver
> specific and should instead be more generic and use the bindings
> in Documentation/devicetree/bindings/display/connector/ and linked
> to the tvp5150 using the OF graph port and endpoints.
> 
> There are still ongoing discussions about how the input connectors
> will be supported by the Media Controller framework so until that
> is settled, it is better to revert the connectors portion of the
> bindings to avoid known to be broken bindings docs to hit mainline.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> 
> ---
> 
>  .../devicetree/bindings/media/i2c/tvp5150.txt      | 43 ----------------------
>  1 file changed, 43 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
