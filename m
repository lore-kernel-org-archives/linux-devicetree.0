From: Wig C <onlywig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] ARM: dts: Add initial Pistachio i.mx6q board support.
Date: Sat,  9 Sep 2017 20:45:10 +0800
Message-ID: <1504961110-9878-1-git-send-email-onlywig@gmail.com>
References: <1504949308-13552-1-git-send-email-onlywig@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504949308-13552-1-git-send-email-onlywig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 9, 2017 at 6:28 AM, Wig C <onlywig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +&usdhc2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc2>;
> +       bus-width = <4>;
> +       vmmc-supply = <&wlan_en_reg>;
> +       no-1-8-v;
> +       keep-power-in-suspend;
> +  non-removable;
> +  cap-power-off-card;

As I mentioned previously the indentation is not correct here.

You should use tab instead of spaces.

checkpatch also complains about it:

WARNING: please, no spaces at the start of a line
#699: FILE: arch/arm/boot/dts/imx6q-pistachio.dts:654:
+  non-removable;$

WARNING: please, no spaces at the start of a line
#700: FILE: arch/arm/boot/dts/imx6q-pistachio.dts:655:
+  cap-power-off-card;$

Hello Fabio:
I will fix this on next patch, sorry I miss it.

> +&wdog1 {
> +       status = "okay";
> +};

Why don't you use like this as you intended in the original patch?

&wdog1 {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_wdog>;
    fsl,ext-reset-output;
    status = "okay";
};

My original patch has never support hardware watch dog as following link:
https://www.spinics.net/lists/kernel/msg2594724.html

I used soft reset on Pistachio, sorry for cause your misunderstand, and 
thanks for your kindly correction.

Wig
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
