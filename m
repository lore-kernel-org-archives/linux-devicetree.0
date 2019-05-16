From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: raise GPU trip point temperature for
 speedy to 80 degC
Date: Thu, 16 May 2019 09:58:26 -0700
Message-ID: <CAD=FV=WJrfAPMvK99QycHLuoTqXG8UWWojF+DpGZwB9ijckLig@mail.gmail.com>
References: <20190516162942.154823-1-mka@chromium.org> <20190516162942.154823-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516162942.154823-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 16, 2019 at 9:29 AM Matthias Kaehlcke <mka@chromium.org> wrote:

> Raise the temperature of the GPU thermal trip point for speedy
> to 80=C2=B0C. This is the value used by the downstream Chrome OS 3.14
> kernel, the 'official' kernel for speedy.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - add entry at position in alphabetical order
> ---
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
