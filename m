From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: sdm845: Define rmtfs memory
Date: Tue, 22 Jan 2019 15:26:22 -0800
Message-ID: <CAD=FV=X0x4hQ=8yQ6wDWE8ximf9A8hpgpRWTdPrFXDD4FVO8VQ@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Ben Chan <benchan@google.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 21, 2019 at 9:51 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Define the rmtfs memory node, as described in version 10 of the memory
> map.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v2:
> - New patch
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index cdcac3704c13..64f57cc5c61a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -72,6 +72,15 @@
>                 #size-cells = <2>;
>                 ranges;
>
> +               rmtfs@85d00000 {
> +                       compatible = "qcom,rmtfs-mem";
> +                       reg = <0 0x85d00000 0 0x200000>;
> +                       no-map;
> +
> +                       qcom,client-id = <1>;
> +                       qcom,vmid = <15>;
> +               };

Ah, I saw this after I posted my comments to patch #1.  I guess this
is the same as this node we have in our cheza board file downstream
(need to get that posted upstream soon):

rmtfs@88f00000 {
  compatible = "qcom,rmtfs-mem";
  reg = <0x0 0x88f00000 0x0 0x800000>;
  no-map;

  qcom,client-id = <1>;
};

That brings up a few things:

1. You should add a node label here.  This allows us to act on the
node more easily from board files, like setting it to disabled or
changing it.

2. In https://crrev.com/c/1119572, the argument was made that the size
of this carveout is board-specific.  That makes it hard to put it in
sdm845.dts.


-Doug
