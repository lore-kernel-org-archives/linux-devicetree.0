From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845: Remove the duplicate header
 inclusion
Date: Wed, 9 Jan 2019 14:57:00 -0800
Message-ID: <CAD=FV=UgFwVdsTuaQhVA9q18Ns8n278A4mx=TrvuOW3mmZm84A@mail.gmail.com>
References: <cover.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <5f400b3a15cab5dd071e4a129d38cb21e7123b78.1547054308.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5f400b3a15cab5dd071e4a129d38cb21e7123b78.1547054308.git.saiprakash.ranjan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Leo Yan <leo.yan@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 9, 2019 at 9:48 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Remove the duplicate inclusion of qcom,gcc-sdm845.h
> mistakenly introduced by commit 6e17f8140521 ("arm64:
> dts: sdm845: add prng-ee node").
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 03683179b8f7..8dced99f875e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -12,7 +12,6 @@
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> -#include <dt-bindings/clock/qcom,gcc-sdm845.h>

This was on my TODO list, but you beat me to it.  This could land any
time and is completely separate from the other patches in this series.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
