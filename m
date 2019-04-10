From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add BT_EN to the power sequence for veyron
Date: Wed, 10 Apr 2019 13:59:18 -0700
Message-ID: <CAD=FV=U531pq__emY9nXm1hZF3Hp3tGFQQTn0eX17rHYp5nH1Q@mail.gmail.com>
References: <20190409231405.189335-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409231405.189335-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 9, 2019 at 4:14 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add GPIO D5 (BT_ENABLE_L) as reset-GPIO to the power sequence for the
> Bluetooth/WiFi module. On devices with a Broadcom module the signal
> needs to be asserted to use Bluetooth.
>
> Note that BT_ENABLE_L is a misnomer in the schematics, the signal
> actually is active-high.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Looks right to me.  Thanks!

Note that this might enable the signals in a different order than in
the downstream Chrome OS kernel, but it looks like it doesn't matter
in this case since the datasheet for the AzureWave module talks about
enabling / disabling these pins in either order.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
