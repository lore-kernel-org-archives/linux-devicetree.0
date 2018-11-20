From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] ARM: dts: qcom: Add SoC-specific string for
 sdhci-msm-v4 nodes
Date: Tue, 20 Nov 2018 15:12:14 -0800
Message-ID: <CAD=FV=V7RM2AEM857VJMZmFcBOTSL+Aa03=wiricMV9DZ=NCRg@mail.gmail.com>
References: <20181105210921.253707-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105210921.253707-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Andy,

On Mon, Nov 5, 2018 at 1:09 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per upstream discussion [1], we should have an SoC-specific
> compatible string for Qualcomm's SDHCI nodes.  Let's add it.
>
> [1] https://lkml.kernel.org/r/20181105203657.GA32282@bogus
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 4 ++--
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

This patch and the 2nd patch in this series are ready to land.  The
bindings change related to this has been Acked by Rob and can now be
found in Ulf's "next" branch.  See:

https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=next&id=c1f921e9b691d0110f46c55fdeb8762b85994fba

...everything here should be fully backward compatible so it can be
landed without concern for any dependencies.

-Doug
