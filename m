From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/5] ARM: dts: rockchip: move rk3288-veryon display
 settings into a separate file
Date: Thu, 25 Jul 2019 09:48:40 -0700
Message-ID: <CAD=FV=X85ACbN79foy_f4qQ=9a+8XFf0a3cE7S4BMn6pWvMmPA@mail.gmail.com>
References: <20190725162642.250709-1-mka@chromium.org> <20190725162642.250709-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725162642.250709-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jul 25, 2019 at 9:26 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The chromebook .dtsi file contains common settings for veyron
> Chromebooks with eDP displays. Some veyron devices with a display
> aren't Chromebooks (e.g. 'tiger' aka 'AOpen Chromebase Mini'), move
> display related bits from the chromebook .dtsi into a separate file
> to avoid redundant DT settings.
>
> The new file is included from the chromebook .dtsi and can be
> included by non-Chromebook devices with a display.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v3:
> - allow MIT license
> - move pinctrl section to the bottom
>
> Changes in v2:
> - rebased on v5.4-armsoc/dts32 (0d19541e3b45)
> ---
>  .../boot/dts/rk3288-veyron-chromebook.dtsi    | 115 +---------------
>  arch/arm/boot/dts/rk3288-veyron-edp.dtsi      | 124 ++++++++++++++++++
>  2 files changed, 125 insertions(+), 114 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
