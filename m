From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to simple-panel
Date: Sat, 06 Apr 2019 01:06:30 -0500
Message-ID: <5ca841e8.1c69fb81.fc058.3930@mx.google.com>
References: <20190401171724.215780-1-dianders@chromium.org> <20190401171724.215780-2-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401171724.215780-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, linux-rockchip@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, =?UTF-8?q?Enric=20Balletb=C3=B2?= <enric.balletbo@collabora.com>, mka@chromium.org, Eric Anholt <eric@anholt.net>, Jeffy Chen <jeffy.chen@rock-chips.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Mon,  1 Apr 2019 10:17:18 -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
> 
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
> Changes in v4:
>  - Simplify desc. for when override should be used (Thierry/Laurent)
>  - Removed Rob H review since it's been a year and wording changed
> Changes in v5:
>  - Removed bit about OS may ignore (Rob/Ezequiel)
> 
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stéphane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../bindings/display/panel/simple-panel.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
