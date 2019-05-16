From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: rockchip: raise GPU trip point
 temperatures for veyron
Date: Thu, 16 May 2019 09:57:54 -0700
Message-ID: <CAD=FV=Vqpiq4=pt=KnCW7Zpj9QF0v4STHu5s05PZ9G5AyHbX0w@mail.gmail.com>
References: <20190516162942.154823-1-mka@chromium.org> <20190516162942.154823-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516162942.154823-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 16, 2019 at 9:29 AM Matthias Kaehlcke <mka@chromium.org> wrote:

> The values match thorse used by the downstream Chrome OS 3.14
> kernel, the 'official' kernel for veyron devices. Keep the critical
> trip point for speedy at 90=C2=B0C as in the downstream configuration.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - also raise temperature of critical trip point
> - add entries at position in alphabetical order
> - added entry to keep critical trip point for speedy at 90=C2=B0C
> - updated commit message
> ---
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
>  arch/arm/boot/dts/rk3288-veyron.dtsi       | 8 ++++++++
>  2 files changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
