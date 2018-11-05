From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dtsi: sun8i-r40: add mali node
Date: Mon, 5 Nov 2018 10:07:31 +0100
Message-ID: <20181105090731.vkcdwde5zmkxjzmc@flea>
References: <20181101085710.15774-1-lothar.felten@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hmehpeleewvssyd5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBX4QQDPQKGQELAKBCYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181101085710.15774-1-lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lothar Felten <lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hmehpeleewvssyd5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,x

On Thu, Nov 01, 2018 at 09:57:10AM +0100, Lothar Felten wrote:
> This patch adds a node for the mali 400 GPU of the R40/V40 SoC
> 
> Signed-off-by: Lothar Felten <lothar.felten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes v2->v3:
> - remove mali clock rates
> - drop hdmi-phy sun50i-a64 compatibility  
> - patch version, change log added
> 
> Changes v1->v2:
> - commit message uppercase ARM prefix
> - wrong patch submitted by mistake
> ---
> 
>  arch/arm/boot/dts/sun8i-r40.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 6f4c9ca5a3ee..136c248cc7d1 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -542,6 +542,28 @@
>  
>  		};
>  
> +		mali: gpu@1c40000 {
> +			compatible = "allwinner,sun7i-a20-mali", "arm,mali-400";

You should have an r40 compatible here. You can have a look at the
A23-A33 DTSI compatible for an example if you want.

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--hmehpeleewvssyd5--
