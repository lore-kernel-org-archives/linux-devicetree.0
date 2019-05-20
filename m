From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: rockchip: Use the GPU to cool CPU
 thermal zone of veyron mickey
Date: Mon, 20 May 2019 16:26:10 -0700
Message-ID: <CAD=FV=UfVwGbraO91Rq2vKA5-H1uZhMPeoE4h+qWH39f0DqnXA@mail.gmail.com>
References: <20190520220051.54847-1-mka@chromium.org> <20190520220051.54847-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520220051.54847-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 20, 2019 at 3:01 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On rk3288 the CPU and GPU temperatures are correlated. Limit the GPU
> frequency on veyron mickey to 400 MHz for CPU temperatures >=3D 65=C2=B0C
> and to 300 MHz for CPU temperatures >=3D 85=C2=B0C.
>
> This matches the configuration of the downstream Chrome OS 3.14 kernel,
> the 'official' kernel for mickey.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - added 'cpu_warm_limit_gpu' to throttle GPU for T.cpu >=3D 65=C2=B0C
> - removed comment saying that GPU isn't throttled beyond 400 MHz
>   based on CPU temperature
> - updated commit message
>
> Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
> entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
> ---
>  arch/arm/boot/dts/rk3288-veyron-mickey.dts | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
