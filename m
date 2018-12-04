From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v1 0/4] phy: qcom-qmp: Fix clock-cells binding and
 provider
Date: Tue, 4 Dec 2018 13:42:36 +0530
Message-ID: <62461d1d-2269-37f7-8d08-a116e470ad89@ti.com>
References: <20181129221357.67417-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129221357.67417-1-evgreen@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, David Brown <david.brown@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, Can Guo <cang@codeaurora.org>, linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy Gross, David Brown, Vivek,

On 30/11/18 3:43 AM, Evan Green wrote:
> This series fixes the QMP PHY bindings, which had specified #clock-cells
> in the parent node, and had set it to 1. Putting it in the parent node is
> wrong because the clock providers are the child nodes, so this change
> moves it there. Having it set to 1 is also wrong, since nothing is ever
> specified as to what should go in that cell. So this changes it to zero.
> Finally, this change completes a little bit of code to actually allow these
> exposed clocks to be pointed at in DT.
> 
> I had no idea how to fix up ipq8074.dtsi. It seems to be completely wrong in
> that it doesn't specify #clock-cells at all, has no child nodes, and
> specifies clock-output-names in the parent node. As far as I can tell this
> doesn't work at all. But I can't add the child nodes myself because I don't know
> 1) how many there are, and 2) the registers in them. I also have no way to test it.
> 
> Speaking of testing, I was able to test this on sdm845, but haven't tested msm8996.

Can someone help test this series in msm8996?

Thanks
Kishon

> 
> This patch sits atop the UFS device nodes series [1].
> 
> [1] https://lore.kernel.org/lkml/20181026173544.136037-1-evgreen@chromium.org/
> 
> 
> 
> Evan Green (4):
>   dt-bindings: phy-qcom-qmp: Move #clock-cells to child
>   arm64: dts: qcom: msm8996: Fix QMP PHY #clock-cells
>   arm64: dts: qcom: sdm845: Fix QMP PHY #clock-cells
>   phy: qcom-qmp: Expose provided clocks to DT
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 11 ++++-----
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  4 ++--
>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 23 ++++++++++++++++++-
>  4 files changed, 33 insertions(+), 11 deletions(-)
> 
