From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: sunxi: Extend the simple gates and
 handle the Allwinner H3
Date: Mon, 7 Dec 2015 08:31:02 -0600
Message-ID: <20151207143102.GA29097@rob-hp-laptop>
References: <20151206100412.1a74b71da8e9ca28c6e61589@free.fr>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBL5QS2ZQKGQETO2JFZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151206100412.1a74b71da8e9ca28c6e61589-GANU6spQydw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 06, 2015 at 10:04:12AM +0100, Jean-Francois Moine wrote:
> The H3 has a clock gate definition similar to the other Allwinner SoCs,
> but with a different parent clock for each single gate.
> 
> Adding the names of the parent clocks in both the source and output clocks
> permits the use of the simple-gates driver to define the bus gates
> of all known Allwinner SoCs.
> 
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
> This patch replaces a part of Jens Kuske's patch
> 	[PATCH v5 1/4] clk: sunxi: Add H3 clocks support
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 25 +++++++++++++++++++++++
>  drivers/clk/sunxi/clk-simple-gates.c              | 14 ++++++++++++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
> index 8a47b77..5736e6d 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -70,6 +70,7 @@ Required properties:
>  	"allwinner,sun8i-a23-usb-clk" - for usb gates + resets on A23
>  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
>  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
> +	"allwinner,sunxi-gates-clk" - simple gates
>  
>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> @@ -93,6 +94,12 @@ The "allwinner,sun9i-a80-mmc-config-clk" clock also requires:
>  - #reset-cells : shall be set to 1
>  - resets : shall be the reset control phandle for the mmc block.
>  
> +The "allwinner,sunxi-gates-clk" clock also requires:
> +- clock-names : corresponding names of the parent clocks
> +when the output clocks have different parents.
> +These names must be 4 characters long and must appear as a prefix in
> +the names of the output clocks. See example.
> +

I don't think you should be encoding relationships of clocks using the 
name strings. We describe relationships in DT via parent/child or 
phandles.

Rob
