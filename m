From: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm281xx: DT changes for reboot code
Date: Fri, 28 Jun 2013 14:01:05 -0700
Message-ID: <CAPdLdq=5S1yepBq5mU2_=8gEBsbsHCwfTCAwqO4fA4_7+RDTLw@mail.gmail.com>
References: <1372453018-5830-1-git-send-email-markus.mayer@linaro.org>
 <1372453018-5830-3-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372453018-5830-3-git-send-email-markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Christian who got dropped from the Cc list.

-Markus

On 28 June 2013 13:56, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch adds the device tree bindings for the bcm281xx reboot code.
>
> Signed-off-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/bcm/bcm,kona-wdt.txt   |   15 +++++++++++++++
>  arch/arm/boot/dts/bcm11351.dtsi                    |    7 ++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt b/Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
> new file mode 100644
> index 0000000..ac349e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
> @@ -0,0 +1,15 @@
> +Broadcom Kona Family Watchdog Timer
> +-----------------------------------
> +
> +This watchdog timer is used in the following Broadcom SoCs:
> +  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
> +
> +Required properties:
> +  - compatible = "bcm,kona-wdt";
> +  - reg: memory range
> +
> +Example:
> +       watchdog@35002f40 {
> +               compatible = "bcm,kona-wdt";
> +               reg = <0x35002f40 0x6c>;
> +       };
> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
> index 41b2c6c..cabeade 100644
> --- a/arch/arm/boot/dts/bcm11351.dtsi
> +++ b/arch/arm/boot/dts/bcm11351.dtsi
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (C) 2012 Broadcom Corporation
> + * Copyright (C) 2012-2013 Broadcom Corporation
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> @@ -53,6 +53,11 @@
>                     cache-level = <2>;
>         };
>
> +       watchdog@35002f40 {
> +               compatible = "bcm,kona-wdt";
> +               reg = <0x35002f40 0x6c>;
> +       };
> +
>         timer@35006000 {
>                 compatible = "bcm,kona-timer";
>                 reg = <0x35006000 0x1000>;
> --
> 1.7.9.5
>
>
