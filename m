From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/15] drm/sun4i: Add TCON TOP driver
Date: Wed, 23 May 2018 13:23:11 -0500
Message-ID: <20180523182311.GA8741@rob-hp-laptop>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
 <20180519183127.2718-6-jernej.skrabec@siol.net>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBEXDS3MAKGQETUFJHYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180519183127.2718-6-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 19, 2018 at 08:31:17PM +0200, Jernej Skrabec wrote:
> As already described in DT binding, TCON TOP is responsible for
> configuring display pipeline. In this initial driver focus is on HDMI
> pipeline, so TVE and LCD configuration is not implemented.
> 
> Implemented features:
> - HDMI source selection
> - clock driver (TCON and DSI gating)
> - connecting mixers and TCONS
> 
> Something similar also existed in previous SoCs, except that it was part
> of first TCON.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/Makefile             |   3 +-
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c     | 256 +++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.h     |  20 ++
>  include/dt-bindings/clock/sun8i-tcon-top.h |  11 +

This belongs with the binding doc patch.

>  4 files changed, 289 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.h
>  create mode 100644 include/dt-bindings/clock/sun8i-tcon-top.h
