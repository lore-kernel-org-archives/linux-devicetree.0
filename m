From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm: dts: rk3288: Enable Cortex-A12 HW PMU events
Date: Tue, 7 Apr 2015 11:28:33 -0700
Message-ID: <CAD=FV=XNJwz+KOquKPgRrRVSZjJ_YbxzfJFsu=3Qhve7ZjY0dw@mail.gmail.com>
References: <1428429159-24102-1-git-send-email-sonnyrao@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428429159-24102-1-git-send-email-sonnyrao@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sonny Rao <sonnyrao@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kever Yang <kever.yang@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 7, 2015 at 10:52 AM, Sonny Rao <sonnyrao@chromium.org> wrote:
> This adds the dts node for the PMU with the correct PMUIRQ interrupts
> for each core.
>
> Signed-off-by: Sonny Rao <sonnyrao@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 165968d..8253abb 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -44,6 +44,14 @@
>                 spi2 = &spi2;
>         };
>
> +       arm-pmu {
> +               compatible = "arm,cortex-a12-pmu";
> +               interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +

As per discussion with Rockchip: these numbers don't actually match
the TRM, but apparently the TRM is wrong.

Since these numbers work and the numbers came from Rockchip:

Reviewed-by: Doug Anderson <dianders@chromium.org>
