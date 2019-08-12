From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: add device tree for Mecer Xtreme Mini S6
Date: Mon, 12 Aug 2019 13:11:01 -0600
Message-ID: <CAL_JsqKpNgVcM-Ou7BKWv0qxvkJx3=NuSHRTHonQ-XSz-NXb1w@mail.gmail.com>
References: <20190811230015.28349-1-justin.swartz@risingedge.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811230015.28349-1-justin.swartz@risingedge.co.za>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 11, 2019 at 5:01 PM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> The Mecer Xtreme Mini S6 features a Rockchip RK3229 SoC,
> 1GB DDR3 RAM, 8GB eMMC, MicroSD port, 10/100Mbps Ethernet,
> Realtek 8723BS WLAN module, 2 x USB 2.0 ports, HDMI output,
> and S/PDIF output.
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml          |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/rk3229-xms6.dts                  | 283 +++++++++++++++++++++
>  4 files changed, 291 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3229-xms6.dts

Reviewed-by: Rob Herring <robh@kernel.org>
