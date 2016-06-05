From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFT 2/4] ARM: dts: imx28-eukrea-mbmx28lc: add missing reg properties
Date: Sun, 5 Jun 2016 11:00:06 -0300
Message-ID: <CAOMZO5DqYV97M+heNaehqFCTEiYnYKRqCfiF0FMxzqEvw-gkZw@mail.gmail.com>
References: <1465134666-13459-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465134666-13459-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 5, 2016 at 10:51 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> This patch adds the missing reg properties for the regulator nodes
> in order to fix the dtc warnings.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> index 8859474..581e85f 100644
> --- a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> +++ b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> @@ -84,6 +84,7 @@
>
>                 reg_3p3v: regulator@0 {
>                         compatible = "regulator-fixed";
> +                       reg = <0>;

The proper fix here would be to remove "@0" instead.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
