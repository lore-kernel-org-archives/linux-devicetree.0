From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add Nanopi NEO4 initial support
Date: Fri, 8 Mar 2019 14:13:10 -0600
Message-ID: <CAL_JsqLkyfd0Tvuxn_i-24gCReo=CNhtb65zG6xxqVYJasDZrQ@mail.gmail.com>
References: <20190308181202.11607-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308181202.11607-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Akash Gajjar <akash@openedev.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 8, 2019 at 12:12 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> FriendlyElec NanoPi NEO4 is known to be a revision 4 based
> NanoPi4 series of boards.
>
> Most of know peripherals are shared between Nanopi M4 vs NEO4, except
> - 1GB DDR3
> - USB Host ports
> - Missing DSI port
> - USB 2.0 Host with USB2PHY0 (no USB2PH1)
>
> Add support for it, by reusing existing rk3399-nanopi4.dtsi
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Akash Gajjar <akash@openedev.com>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml     |  1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |  1 +
>  .../boot/dts/rockchip/rk3399-nanopi-neo4.dts  | 50 +++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dts

Reviewed-by: Rob Herring <robh@kernel.org>
