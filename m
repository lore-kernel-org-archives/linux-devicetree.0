From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [v2 1/3] dt/bindings: clk: Add YAML schemas for LS1028A Display
 Clock bindings
Date: Thu, 15 Aug 2019 07:49:23 -0600
Message-ID: <CAL_JsqLp4BB+=kdGkMuH+-QQWHt8vRB_DSxjDYBFHLcHUg5V=A@mail.gmail.com>
References: <20190815101613.22872-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815101613.22872-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-devel@linux.nxdi.nxp.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Liviu Dudau <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 4:26 AM Wen He <wen.he_1@nxp.com> wrote:
>
> LS1028A has a clock domain PXLCLK0 used for provide pixel clocks to Display
> output interface. Add a YAML schema for this.
>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v2:
>         - Convert bindings to YAML format
>
>  .../devicetree/bindings/clock/fsl,plldig.yaml | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,plldig.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
