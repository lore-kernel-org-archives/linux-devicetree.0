From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: simplefb-sunxi: Add sunxi
 simplefb extensions
Date: Mon, 17 Nov 2014 12:22:34 +0000
Message-ID: <1416226954.5466.8.camel@hellion.org.uk>
References: <1416224086-5698-1-git-send-email-hdegoede@redhat.com>
	 <1416224086-5698-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBC4Y5F6PT4PBBLORU6RQKGQEISNBM5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1416224086-5698-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-17 at 12:34 +0100, Hans de Goede wrote:
> +- sunxi,pipeline:
> +  <0> for the de_be0 -> lcdc0 -> output pipeline
> +  <1> for the de_be1 -> lcdc1 -> output pipeline

Can we express this as a more descriptive string rather than a number,
to better handle future developments?

Otherwise both patches in this series look good to me.

> +- sunxi,output: One of: "hdmi", "lcd", "vga", and "composite"  
> +
> +Example:
> +
> +chosen {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;
> +
> +	framebuffer@0 {
> +		compatible = "sunxi,framebuffer", "simple-framebuffer";
> +		sunxi,pipeline = <0>;
> +		sunxi,output = "hdmi";
> +		clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> +			 <&ahb_gates 44>;
> +		status = "disabled";
> +	};
> +};
