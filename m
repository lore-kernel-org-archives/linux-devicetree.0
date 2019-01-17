From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845: Extend ranges and
 describe DMA space
Date: Thu, 17 Jan 2019 09:47:28 -0800
Message-ID: <CAD=FV=VMBBT0E-7F=F+inThL+hjC8pZCf3707mJaQ0NEKQ_P7Q@mail.gmail.com>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org> <20190117042940.25487-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 16, 2019 at 8:30 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> For devices attached to an IOMMU, translation between IOVA and physical
> addresses is no longer 1:1 and dma-ranges should be specified to
> describe the available IOVA address space.
>
> On SDM845 the busses are implemented with 36 address bits, so dma-ranges
> must be defined to reduce the size of the IOVA address space from the 48
> bits supported by the SMMU. Without this DMA allocations may end up with
> IOVAs outside the valid range, that gets truncated by the bus between
> the device and its translation unit.
>
> Also extend ranges to describe the available address space.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - Split this out from patch 1.
> - Rewrote commit message from scratch
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
