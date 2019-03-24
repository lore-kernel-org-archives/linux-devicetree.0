From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ARM: dts: rockchip: Add bindings for rk3288-veyron-mighty
Date: Sun, 24 Mar 2019 16:18:45 -0500
Message-ID: <CAL_JsqK=kt3k=eXn6uuHoRboWMqLFbnqAvAveVmOjOC0+MK5gw@mail.gmail.com>
References: <20190322194310.61365-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322194310.61365-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Matthias Kaehlcke <mka@chromium.org>, Ryan Case <ryandcase@chromium.org>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexis Ballier <aballier@gentoo.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 2:43 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Mighty is basically the same Chromebook as Jaq but it has a full-sized
> SD slot and some different (slightly more rugged) plastics around it.
> Like Jaq, Mighty may show up with various different brandings but all
> of them have the same board inside.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
