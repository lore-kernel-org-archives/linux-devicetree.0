From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: Add optional 'mode' property
 to TCON
Date: Mon, 13 Feb 2017 09:14:47 +0100
Message-ID: <20170213081447.r2jhkcx3ex5tsspi@lukather>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-5-plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tr7rxvx6c4gh5lyu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6GVQXCQKGQENB655SY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170211174405.28395-5-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tr7rxvx6c4gh5lyu
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Feb 11, 2017 at 07:44:01PM +0200, Priit Laes wrote:
> Add variable to enable either 'rgb' or 'lvds' output.
> 
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index b82c004..c367ede 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -43,6 +43,9 @@ Required properties:
>   - reset-names: the reset names mentioned above
>   - clock-output-names: Name of the pixel clock created
>  
> +- mode: Defines which encoder will be enabled. Values are 'rgb', 'lvds'.
> +  Defaults to 'rgb' if not set.
> +

Unfortunately, this won't really work. You could very well have two
panels and switch from one to another by changing the pin muxing, so
we have to use an enpoint for that.

This is pretty much the same case that we have with the A10s where we
need to have two output endpoints for the TV Encoder and HDMI,
something we cannot support right now in our binding, since we assume
that we have the two channels that only have one user, which turned
out to be wrong.

I guess an easy way would be to have an extra property defining which
channel the endpoint is attached to.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--tr7rxvx6c4gh5lyu--
