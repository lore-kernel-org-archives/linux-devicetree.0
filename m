From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2
 mixers and display engines
Date: Thu, 23 Feb 2017 09:27:38 -0500
Message-ID: <jwvwpchgez7.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
	<20170222151854.3280-5-icenowy@aosc.xyz>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDMKFH665MBBB4HCXPCQKGQEFCSCDNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

>  drivers/gpu/drm/sun4i/Kconfig       |   8 +
>  drivers/gpu/drm/sun4i/Makefile      |   1 +
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
>  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
>  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++

Should the drm/sun4i directory be renamed to drm/sunxi then?


        Stefan
