From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: sun4i: Add SPDIF to the
 Mele A1000
Date: Mon, 21 Mar 2016 19:21:25 +0100
Message-ID: <20160321182125.GH30977@lukather>
References: <1458576642-4078-1-git-send-email-codekipper@gmail.com>
 <1458576642-4078-5-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zp3AMgPTa9Mf+MXm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMPXYC3QKGQEDGT64JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1458576642-4078-5-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--zp3AMgPTa9Mf+MXm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 21, 2016 at 05:10:41PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Enable the S/PDIF transmitter that is present on the A1000.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-a1000.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
> index 97570cb..aaf5605 100644
> --- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
> @@ -87,6 +87,23 @@
>  		enable-active-high;
>  		gpio = <&pio 7 15 GPIO_ACTIVE_HIGH>;
>  	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "On-board SPDIF";

Please add a newline here.


> +		simple-audio-card,cpu {
> +			sound-dai = <&spdif>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&spdif_out>;
> +		};
> +	};
> +
> +	spdif_out: spdif-out {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +	};
>  };
>  
>  &ahci {
> @@ -188,6 +205,12 @@
>  	status = "okay";
>  };
>  
> +&spdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spdif_tx_pins_a>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins_a>;
> -- 
> 2.7.4
> 

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--zp3AMgPTa9Mf+MXm--
