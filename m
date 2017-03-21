From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Tue, 21 Mar 2017 08:41:17 +0100
Message-ID: <20170321074117.vdfjynauuuv6fivp@lukather>
References: <20170315172808.64011-1-icenowy@aosc.xyz>
 <20170315172808.64011-2-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nlfme6nxrfyk26rd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLNSYPDAKGQEP2ABRGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170315172808.64011-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nlfme6nxrfyk26rd
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng wrote:
> Many Allwinner SoCs after A31 have a CCU in PRCM block.
> 
> Give the ones on H3 and A64 compatible strings.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> Changes in v2:
> - Add iosc for R_CCU's on H3/A64. (A31, A23 and A33 seem to have different
>   clock for mux 3 of ar100 clk. Investgations are needed for them.)
> 
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> index 68512aa398a9..4a4addff595d 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> @@ -7,9 +7,11 @@ Required properties :
>  		- "allwinner,sun8i-a23-ccu"
>  		- "allwinner,sun8i-a33-ccu"
>  		- "allwinner,sun8i-h3-ccu"
> +		- "allwinner,sun8i-h3-r-ccu"
>  		- "allwinner,sun8i-v3s-ccu"
>  		- "allwinner,sun9i-a80-ccu"
>  		- "allwinner,sun50i-a64-ccu"
> +		- "allwinner,sun50i-a64-r-ccu"
>  		- "allwinner,sun50i-h5-ccu"
>  
>  - reg: Must contain the registers base address and length
> @@ -20,7 +22,11 @@ Required properties :
>  - #clock-cells : must contain 1
>  - #reset-cells : must contain 1
>  
> -Example:
> +For the PRCM CCUs on H3/A64, one more clock is needed:
> +- "iosc": another frequency oscillator used for CPUS (usually at 32000Hz,
> +          not the same with losc)

This is called the internal oscillator in the datasheet, it would
probably make more sense to call it that way in the documentation too.

This oscillator seems to be clocked at 16MHz, so we should represent
it as such.

And I'm wondering, are you *sure* that it's fed directly from the
internal oscillator, or goes through the registers in the RTC, with
the 32 divider and 16 prescaler by default that makes it at roughly
the same rate (31.25kHz).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--nlfme6nxrfyk26rd--
