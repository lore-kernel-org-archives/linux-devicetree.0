From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] arm: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 OpenFrame Cap 10.1 initial support
Date: Mon, 20 Feb 2017 17:11:20 -0300
Message-ID: <CAOMZO5CKQaDvnr2-EzO_3ZOwQWb4RM1ytKiLfvXCj9Azwco8zw@mail.gmail.com>
References: <1487621121-6051-1-git-send-email-jagan@openedev.com> <1487621121-6051-2-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487621121-6051-2-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Domenico Acri <domenico.acri-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 5:05 PM, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org> wrote:

> +&ldb {
> +       status = "okay";
> +
> +       lvds-channel@0 {
> +               fsl,data-mapping = "spwg";
> +               fsl,data-width = <24>;
> +               status = "okay";
> +
> +               display-timings {
> +                        native-mode = <&timing1>;
> +                        timing1: hsd100pxn1 {
> +                                clock-frequency = <60000000>;
> +                                hactive = <1280>;
> +                                vactive = <800>;
> +                                hback-porch = <40>;
> +                                hfront-porch = <40>;
> +                                vback-porch = <10>;
> +                                vfront-porch = <3>;
> +                                hsync-len = <80>;
> +                                vsync-len = <10>;

hsd100pxn1 is supported by the drm simple panel driver.

This allows you to remove the display-timings from the dts and use
compatible = "hannstar,hsd100pxn1" instead.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
