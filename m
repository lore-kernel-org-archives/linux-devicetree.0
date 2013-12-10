From: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: bcm28155-ap: Enable all the i2c busses
Date: Mon, 9 Dec 2013 23:07:30 -0800
Message-ID: <CAEPRUYquqJ+y7+ZV12_uKnRq+XkoYZ7M7JNbsZBCPzVRGgGJ8w@mail.gmail.com>
References: <1386373528-13045-1-git-send-email-tim.kryger@linaro.org>
	<1386373528-13045-3-git-send-email-tim.kryger@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386373528-13045-3-git-send-email-tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches List <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Applied to armsoc/for-3.14/dt
 thanks,
   csd


On Fri, Dec 6, 2013 at 3:45 PM, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Enable all available i2c busses.
>
> Signed-off-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm28155-ap.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
> index 08e47c2..bab302d 100644
> --- a/arch/arm/boot/dts/bcm28155-ap.dts
> +++ b/arch/arm/boot/dts/bcm28155-ap.dts
> @@ -27,6 +27,26 @@
>                 status = "okay";
>         };
>
> +       i2c@3e016000 {
> +               status="okay";
> +               clock-frequency = <400000>;
> +       };
> +
> +       i2c@3e017000 {
> +               status="okay";
> +               clock-frequency = <400000>;
> +       };
> +
> +       i2c@3e018000 {
> +               status="okay";
> +               clock-frequency = <400000>;
> +       };
> +
> +       i2c@3500d000 {
> +               status="okay";
> +               clock-frequency = <400000>;
> +       };
> +
>         sdio1: sdio@3f180000 {
>                 max-frequency = <48000000>;
>                 status = "okay";
> --
> 1.8.0.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
