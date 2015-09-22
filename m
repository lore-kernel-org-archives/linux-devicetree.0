From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: sun5i: Add PWM controller
 node for A13/A10s
Date: Tue, 22 Sep 2015 16:28:48 +0200
Message-ID: <20150922142848.GC4684@lukather>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <1442752251-20744-2-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrSfZTInSE10h3HO"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIWLQWYAKGQECEGWUIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442752251-20744-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--IrSfZTInSE10h3HO
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Sep 20, 2015 at 08:30:47AM -0400, Hans de Goede wrote:
> The sun5i die has a PWM controller that is compatible to the one on the A20.
> Add a device node for it.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index 78b993a..5e036a4 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -543,6 +543,14 @@
>  			reg = <0x01c20c90 0x10>;
>  		};
>  
> +		pwm: pwm@01c20e00 {
> +			compatible = "allwinner,sun7i-a20-pwm";

Is it? IIRC, it has a single channel, while the A20 has two.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--IrSfZTInSE10h3HO--
