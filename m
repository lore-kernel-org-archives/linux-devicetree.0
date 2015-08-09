From: Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Raise minimum CPU
 voltage for sun7i-a20 to meet SoC specifications
Date: Sun, 09 Aug 2015 23:58:55 +0100
Message-ID: <55C7DB2F.5080907@gmail.com>
References: <1438722481-2302-1-git-send-email-public_timo.s@silentcreek.de>
Reply-To: ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDIZ3QVDVUBBBMNWT6XAKGQEQKRHKFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1438722481-2302-1-git-send-email-public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Acked-by: Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On 04/08/15 22:08, Timo Sigurdsson wrote:
> sun7i-a20.dtsi contains a cpufreq operating point at 0.9 volts. The minimum
> CPU voltage for the Allwinner A20 SoC, however, is 1.0 volts. Thus, raise
> the voltage for the lowest operating point to 1.0 volts in order to stay
> within the SoC specifications. It is an undervolted setting that isn't
> stable across all SoCs and boards out there.
> 
> Signed-off-by: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
> ---
> Changes since v1:
> 
> - Fixed checkpatch warnings
> - Changed the commit message and title to clarify that this is not a board-specific issue, but rather a limitation by the SoC  
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 6a63f30..f5f384c 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -107,7 +107,7 @@
>  				720000	1200000
>  				528000	1100000
>  				312000	1000000
> -				144000	900000
> +				144000	1000000
>  				>;
>  			#cooling-cells = <2>;
>  			cooling-min-level = <0>;
> 
