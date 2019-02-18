From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 06/11] drm/sun4i: rgb: Add DT property to
 disable strict clock rate check
Date: Mon, 18 Feb 2019 12:26:29 -0600
Message-ID: <20190218182629.GA14714@bogus>
References: <20190215050957.20755-1-anarsoul@gmail.com>
 <20190215050957.20755-7-anarsoul@gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBV7RVPRQKGQEWV762IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190215050957.20755-7-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 09:09:52PM -0800, Vasily Khoruzhick wrote:
> Clock rate check that was added in commit bb43d40d7c83 ("drm/sun4i: rgb:
> Validate the clock rate") prevents some panel and bridges from working with
> sun4i driver.

Sounds lile a regression that should be reverted. The fix is not a 
backwards compatible change either.

> 
> Unfortunately, dotclock frequency for some modes are not achievable on
> sunxi hardware, and there's a slight deviation in rate returned by
> clk_round_rate(), so they fail this check.
> 
> Experiments show that panels and bridges work fine with this slight
> deviation, e.g. Pinebook that uses ANX6345 bridge with 768p eDP panel
> requests 73 MHz, gets 72.296MHz instead (0.96% difference) and works just
> fine.
> 
> This patch adds DT property to disable strict clock rate check
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 2 ++
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                            | 5 +++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                           | 3 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h                           | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index f426bdb42f18..18c8b053a28d 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -63,6 +63,8 @@ Required properties:
>      Documentation/devicetree/bindings/media/video-interfaces.txt. The
>      first port should be the input endpoint. The second should be the
>      output, usually to an HDMI connector.
> +  - no-strict-clock-check: don't reject timings if exact dot clock can't be
> +    reached.

This should be the default IMO. Most panels are a single timing, so if 
we reject it the fallback no display? 

I thought we had some mechanism already to allow some range of 
frequencies. I think the chromeos guys needed something IIRC.

Rob
