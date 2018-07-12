From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add USB-related nodes
Date: Thu, 12 Jul 2018 09:56:02 -0700
Message-ID: <CAD=FV=Xic0sUgWGKfXKMp8t1euRNx_T69bCSLB3XKtYtYaQ8jA@mail.gmail.com>
References: <20180710220202.116404-1-dianders@chromium.org> <20180710220202.116404-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710220202.116404-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jul 10, 2018 at 3:02 PM, Douglas Anderson <dianders@chromium.org> wrote:
> From: Manu Gautam <mgautam@codeaurora.org>
>
> This adds nodes for USB and related PHYs.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> [dianders: reworked quite a bit]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 189 +++++++++++++++++++++++++++
>  1 file changed, 189 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 15188d34a2ab..1de59a39f4fa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>
>  / {
> @@ -249,6 +250,18 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               qfprom@780000 {
> +                       compatible = "qcom,qfprom";
> +                       reg = <0x780000 0x8ff>;

I have later found that this should point to the "corrected" address
range, not the raw one.  Thus address should be 0x784000.

...still trying to get more details on the exact right length.


> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       qusb2p_hstx_trim: hstx-trim@1eb {
> +                               reg = <0x1eb 0x1>;
> +                               bits = <1 4>;
> +                       };

I've now found out the trim location for the secondary port.  Thus on
my next revision I'll add:

qusb2s_hstx_trim: hstx-trim-secondary@1eb {
  reg = <0x1eb 0x2>;
  bits = <6 4>;
};

Since this series isn't really ready for merging yet (see the cover
letter), I'll sit on these changes for now but I'll include them in
the next spin.


-Doug
