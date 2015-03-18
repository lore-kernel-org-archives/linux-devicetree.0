From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] Input: sun4i-ts - allow to adjust some
 settings via device-tree properties.
Date: Wed, 18 Mar 2015 11:37:44 +0100
Message-ID: <20150318103744.GR4638@lukather>
References: <1426175150-27005-1-git-send-email-karme@karme.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kJZGYML2m3vFaueA"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBA5MUWUAKGQEOTLEKQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426175150-27005-1-git-send-email-karme-k/3wkfGq5Xs@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--kJZGYML2m3vFaueA
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Mar 12, 2015 at 04:45:50PM +0100, Jens Thiele wrote:
> This commit introduces two new optional device-tree properties:
> "tp-sensitive-adjust": adjust sensitivity of pen down detection
> "filter-type": select median and averaging filter
> 
> The previous fixed defaults, didn't work well for the Olimex
> A13-LCD10TS (I have).
> 
> Signed-off-by: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
> ---
>  .../devicetree/bindings/input/touchscreen/sun4i.txt |   19 +++++++++++++++++--
>  drivers/input/touchscreen/sun4i-ts.c                |   17 +++++++++++++----
>  2 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> index 433332d..c93edfa 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> @@ -8,8 +8,20 @@ Required properties:
>   - #thermal-sensor-cells: shall be 0
>  
>  Optional properties:
> - - allwinner,ts-attached: boolean indicating that an actual touchscreen is
> -			  attached to the controller
> + - allwinner,ts-attached	 : boolean indicating that an actual touchscreen
> +				   is attached to the controller
> + - allwinner,tp-sensitive-adjust : integer (4 bits)
> +				   adjust sensitivity of pen down detection
> +				   between 0 (least sensitive) and 15
> +				   (defaults to 15)
> + - allwinner,filter-type 	 : integer (2 bits)
> +   				   select median and averaging filter
> +				   samples used for median / averaging filter
> +				   0: 4/2
> +				   1: 5/3
> +				   2: 8/4
> +				   3: 16/8
> +				   (defaults to 1)

You shouldn't rely on any bits length in your binding.

And this looks really more of a configuration option, and would be
better exposed through sysfs.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--kJZGYML2m3vFaueA--
