From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Date: Mon, 7 Oct 2019 10:44:02 -0700
Message-ID: <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724044906.12007-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Amit Pundir <amit.pundir@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 9:51 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> We get a warning about missing unit name for soc node, so add it.
>
> arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 601cfb078bd5..e81f4a6d08ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -620,7 +620,7 @@
>                 method = "smc";
>         };
>
> -       soc: soc {
> +       soc: soc@0 {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges = <0 0 0 0 0x10 0>;

So Amit Pundir noted that this patch is causing 5.4-rc to no longer
boot on db845 w/ AOSP, due to it changing the userland sysfs paths
from "/devices/platform/soc/1a00000.mdss" to
"/devices/platform/soc@0/1a00000.mdss"

Is there a better solution here that might not break userspace?

thanks
-john
