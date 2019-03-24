From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ARM: dts: rockchip: Add
 rk3288-veyron-jerry rev 10-15
Date: Sun, 24 Mar 2019 16:20:53 -0500
Message-ID: <CAL_JsqKYH1yNE1vjppWirn13O0HawKCmveDAaHpgYuFxCwp_hw@mail.gmail.com>
References: <20190322195924.70448-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322195924.70448-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Matthias Kaehlcke <mka@chromium.org>, Ryan Case <ryandcase@chromium.org>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexis Ballier <aballier@gentoo.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 2:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> As far as I can tell/remember rev10 was originally created to support
> making a SKU of jerry that had a different LCD.  rev11-rev15 were
> added to give some wiggle room for future builds.  Downstream has a
> separate device tree for rev10-rev15 (compared to rev3-rev7) with the
> expectation that differences relating to the LCD would be accounted
> for there but nothing was ever added to the rev10-rev15 making it
> identical to the rev3-rev7 one.
>
> It's likely nothing actually shipped with rev10-rev15 but they are
> listed in the downstream kernel's device tree and it seems like it
> should add a little safety if we match them here just in case
> something actually shipped with one of these revisions and that device
> will break if we don't claim support.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
