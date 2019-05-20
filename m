From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: Configure the GPU thermal zone
 for mickey
Date: Mon, 20 May 2019 16:29:14 -0700
Message-ID: <CAD=FV=WOpBWapjiz7zq-X7JUG3AaZOcN3Q-Z5XG9md4ZvMCtBw@mail.gmail.com>
References: <20190520220051.54847-1-mka@chromium.org> <20190520220051.54847-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520220051.54847-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 20, 2019 at 3:01 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> mickey crams a lot of hardware into a tiny package, which requires
> more aggressive thermal throttling than for devices with a larger
> footprint. Configure the GPU thermal zone to throttle the GPU
> progressively at temperatures >=3D 60=C2=B0C. Heat dissipated by the
> CPUs also affects the GPU temperature, hence we cap the CPU
> frequency to 1.4 GHz for temperatures above 65=C2=B0C. Further throttling
> of the CPUs may be performed by the CPU thermal zone.
>
> The configuration matches that of the downstream Chrome OS 3.14
> kernel, the 'official' kernel for mickey.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - specify all CPUs as cooling devices
> - s/downstram/downstream/ in commit message
>
> Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
> entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
> ---
>  arch/arm/boot/dts/rk3288-veyron-mickey.dts | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
