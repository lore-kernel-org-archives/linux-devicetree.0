From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Enable audio codec on pcDuino
Date: Tue, 03 Nov 2015 21:43:34 -0500
Message-ID: <jwvsi4mo5al.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <1446565640-21069-1-git-send-email-hdegoede@redhat.com>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDMKFH665MBBBZPB4WYQKGQEOH35ZAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

BTW, I've been using successfully the same additions in
sun7i-a20-bananapi.dts and sun7i-a20-orangepi-mini.dts.


        Stefan


>>>>> "Hans" == Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> Enable the on-chip audio codec

> Signed-off-by: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-pcduino3.dts | 5 +++++
>  1 file changed, 5 insertions(+)

> diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
> index 861a4a6..067f365 100644
> --- a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
> @@ -111,6 +111,11 @@
>  	allwinner,pins = "PH2";
>  };
 
> +
> +&codec {
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdc2>;
>  };
> -- 
> 2.5.0
