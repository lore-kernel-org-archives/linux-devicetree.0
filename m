From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dsi: Add ref clock for PHYs
Date: Tue, 27 Nov 2018 21:41:39 -0800
Message-ID: <CAD=FV=WvXFpZDJGbdvvY=HL_=tDWyhKpTg7zu8s=gUuJgK1ebg@mail.gmail.com>
References: <20181126231159.122298-1-mka@chromium.org> <20181126231159.122298-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126231159.122298-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 26, 2018 at 3:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Allow the PHY drivers to get the ref clock from the DT.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - add the ref clock for all PHYs, not only the 10nm one
> - updated commit message
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index dfc743219bd88..b0485559a719c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -106,6 +106,7 @@ Required properties:
>  - clocks: Phandles to device clocks. See [1] for details on clock bindings.
>  - clock-names: the following clocks are required:
>    * "iface"
> +  * "ref"

We can't quite make ref "required" because there are some old device
tree files dating back to 2016 that would be broken.  It could be
listed as optional, but I _think_ Rob is OK with it being listed as
"required" for all new device tree files with the footnote that if
it's not present then the code will still work.
