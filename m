From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Change cubietruck wifi
 enable pin to use mmc-pwrseq
Date: Sat, 1 Aug 2015 11:26:38 +0200
Message-ID: <20150801092638.GW2564@lukather>
References: <1438357312-17378-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bk89pm10uKhhqtFh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2PQ6OWQKGQEDPXTNMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438357312-17378-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--bk89pm10uKhhqtFh
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Jul 31, 2015 at 05:41:52PM +0200, Hans de Goede wrote:
> The wifi-enable pin of the ap6210 module is not really a regulator,
> switch to the mmc-pwrseq framework for controlling it. This more
> accurately reflects how the hardware actually works.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> index de3e195..0b2f914 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -88,15 +88,11 @@
>  		};
>  	};
>  
> -	reg_vmmc3: vmmc3 {
> -		compatible = "regulator-fixed";
> +	mmc3_pwrseq: mmc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&vmmc3_pin_cubietruck>;

The pinctrl name shouldn't be called that way anymore.

Changed it to mmc3_pwrseq_pin_cubietruck, and applied the patch.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--bk89pm10uKhhqtFh--
