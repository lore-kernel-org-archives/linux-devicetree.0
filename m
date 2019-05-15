From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] dts: rockchip: raise GPU trip point temperature for
 veyron to 72.5 degC
Date: Wed, 15 May 2019 11:30:24 -0700
Message-ID: <CAD=FV=U19uAGkwTqg-N6_m5WYQ7yMwjQir3TYUsb3SWWOihTOg@mail.gmail.com>
References: <20190515153127.24626-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515153127.24626-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 15, 2019 at 8:31 AM Matthias Kaehlcke <mka@chromium.org> wrote:

> This value matches what is used by the downstream Chrome OS 3.14
> kernel, the 'official' kernel for veyron devices.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
> index 1252522392c7..169da06e1c09 100644
> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
> @@ -446,6 +446,14 @@
>         status = "okay";
>  };
>
> +&gpu_thermal {
> +       trips {
> +               gpu_alert0: gpu_alert0 {
> +                       temperature = <72500>; /* millicelsius */
> +               };
> +       };
> +};
> +

This should be sorted alphabetically.  Thus this should sort right
after this in rk3288-veyron.dtsi

&gpu {
  mali-supply = <&vdd_gpu>;
  status = "okay";
};

Also you don't need to replicate the whole structure?  I think the
above should just be:

&gpu_alert0 {
  temperature = <72500>; /* millicelsius */
};

NOTE also that that gpu and cpu critical is 100 C downstream.  Should
we do that too?  Ah, but before we do that I guess we'd need to also
override the "rockchip,hw-tshut-temp" to 125000 to match downstream.
I guess that could be a separate series?

-Doug
