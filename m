From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Limit WiFi TX power on rk3288-veyron-jerry
Date: Wed, 24 Jul 2019 12:56:08 -0700
Message-ID: <CAD=FV=Wk2meLxa6AszjFs=Mfp_wML_7OMsn81FLA5tcdEx=1kg@mail.gmail.com>
References: <20190723225258.93058-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723225258.93058-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jul 23, 2019 at 3:53 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The downstream Chrome OS 3.14 kernel for jerry limits WiFi TX power
> through calibration data in the device tree [1]. Add a DT node for
> the WiFi chip and use the downstream calibration data.
>
> Not all calibration data entries have the length specified in the
> binding (Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt),
> however this is the data used by the downstream ('official') kernel
> and the binding mentions that "the length can vary between hw
> versions".
>
> [1] https://crrev.com/c/271237
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts | 147 ++++++++++++++++++++++
>  1 file changed, 147 insertions(+)

I agree that this matches what's downstream and seems right.

As you pointed out the bindings are a bit on the sketchy side,
claiming a certain length in one place but then saying that the length
depends on the HW version in another place.  I'll also point out that
the bindings are inconsistent about the name that should be used.
AKA:

marvell,caldata-txpwrlimit-2g
 -vs-
marvell,caldata_00_txpwrlimit_2g_cfg_set

...but I think the answer is that it doesn't matter at all from a
practical point of view.  The code seems to just find everything that
starts with "marvell,caldata" and send the binary blindly to the WiFi
card.  Presumably there is enough of a header in the opaque binary
data that the card can make sense of what it's being sent.


So it seems like this is the best we can do given the current state of
the world.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
