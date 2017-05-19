From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 01/11] dt-bindings: update the binding
 for Allwinner H3 TVE support
Date: Fri, 19 May 2017 20:02:15 +0200
Message-ID: <20170519180215.7lc7duueu74pt4kz@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-2-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhwnzsjpz5kvdc7d"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMXG7TEAKGQE7JLY2QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170517164354.16399-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zhwnzsjpz5kvdc7d
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, May 18, 2017 at 12:43:44AM +0800, Icenowy Zheng wrote:
> -On SoCs other than the A33 and V3s, there is one more clock required:
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-v3s-tcon
> +there is one more clock and one more property required:
> + - clocks:
> +   - 'tcon-ch0': The clock driving the TCON channel 0
> + - clock-output-names: Name of the pixel clock created
> +
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-h3-tcon0
> +there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1

Putting ID's in the compatible name is usually a bad idea. What is the
difference between the two? Only that the second one doesn't have a
clock?

That seems highly unlikely. How does it generate the pixel clock
frequency?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zhwnzsjpz5kvdc7d--
