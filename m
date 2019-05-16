From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: Use GPU as cooling device for
 the GPU thermal zone of the rk3288
Date: Thu, 16 May 2019 10:39:17 -0700
Message-ID: <CAD=FV=Wk0EFO2+c=KAfemo0_w+QEA8==KzOdN-niD0mA_myh=Q@mail.gmail.com>
References: <20190516172510.181473-1-mka@chromium.org> <20190516172510.181473-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516172510.181473-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 16, 2019 at 10:25 AM Matthias Kaehlcke <mka@chromium.org> wrote:

> Currently the CPUs are used as cooling devices of the rk3288 GPU
> thermal zone. The CPUs are also configured as cooling devices in the
> CPU thermal zone, which indirectly helps with cooling the GPU thermal
> zone, since the CPU and GPU temperatures are correlated on the rk3288.
>
> Configure the ARM Mali Midgard GPU as cooling device for the GPU
> thermal zone instead of the CPUs.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - patch added to the series
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

This makes sense to me unless there is some better way to model the
intertwined nature of the CPU and GPU temperature.  It's my
understanding that the original device tree snippet was there because
it was added before the gpu node existed in the device tree so the
best we could do is to suggest that the cpu could cool things down.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
