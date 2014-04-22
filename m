From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add peach-pit board support
Date: Tue, 22 Apr 2014 11:13:50 +0530
Message-ID: <CAHbNUh3QPgC_yVn8pNwp3K_fz_ujSF+xmMkD=y-xswUd0YTHYg@mail.gmail.com>
References: <1397971609-6144-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1397971609-6144-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@google.com>, olofj@google.com, arunkk.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

On 20 April 2014 10:56, Arun Kumar K <arun.kk@samsung.com> wrote:
> Adds the google peach-pit board dts file which uses
> exynos5420 SoC.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm/boot/dts/Makefile                 |    1 +
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  225 ++++++++++++++++++++++++++++
>  2 files changed, 226 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts
>

[ snip ]

> +       pinctrl@13400000 {
> +               lid_irq: lid-irq {
> +                       samsung,pins = "gpx3-4";
> +                       samsung,pin-function = <0>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               power_key_irq: power-key-irq {
> +                       samsung,pins = "gpx1-2";
> +                       samsung,pin-function = <0>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               tpm_irq: tpm-irq {
> +                       samsung,pins = "gpx1-0";
> +                       samsung,pin-function = <0>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +       };
> +

If you plan to respin, please consider keeping the above entries
sorted based on the pin numbers.

tpm_irq
power_key_irq
lid_irq


-- 
Tushar Behera
