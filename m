From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: document VOP gamma
 LUT address
Date: Thu, 20 Jun 2019 09:43:33 -0700
Message-ID: <CAD=FV=UpZAjrWkQ7qj5Wo2tf2wkg5Q-34Sun0MOtYLBAwY731Q@mail.gmail.com>
References: <20190618213406.7667-1-ezequiel@collabora.com> <20190618213406.7667-2-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618213406.7667-2-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jun 18, 2019 at 2:43 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Add the register specifier description for an
> optional gamma LUT address.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop.txt         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> index 4f58c5a2d195..97ad78cc7e03 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> @@ -20,6 +20,13 @@ Required properties:
>                 "rockchip,rk3228-vop";
>                 "rockchip,rk3328-vop";
>
> +- reg: Must contain one entry corresponding to the base address and length
> +       of the register space. Can optionally contain a second entry
> +       corresponding to the CRTC gamma LUT address.
> +
> +- reg-names: "base" for the base register space. If present, the CRTC
> +       gamma LUT name should be "lut".

As per Rob Herring, current suggestion is to avoid reg-names when
possible.  The code should just look for the presence of a 2nd entry
and assume that if it's there that it's the lut range.  Full context:

https://lore.kernel.org/lkml/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/

-Doug
