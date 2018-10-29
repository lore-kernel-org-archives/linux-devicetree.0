From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add reserve-memory nodes
Date: Mon, 29 Oct 2018 11:37:46 -0700
Message-ID: <CAD=FV=Xf7NXTV_OtBePn9QUQbzdkMxdYg-yRua_6SbV-av3P+g@mail.gmail.com>
References: <20181026122745.5094-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026122745.5094-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sibis@codeaurora.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, benchan@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Oct 26, 2018 at 5:28 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add reserve-memory nodes for mpss and mba required for
> remoteproc mss pil.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d3fe012ad84e..f74892e447f9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -88,6 +88,16 @@
>                         reg = <0 0x86200000 0 0x2d00000>;
>                         no-map;
>                 };
> +
> +               mpss_region: reserved-memory@8e000000 {
> +                       no-map;
> +                       reg = <0 0x8e000000 0 0x7800000>;
> +               };
> +
> +               mba_region: reserved-memory@96500000 {

nit: All of the other reserved memory in this same section just has
the node name "memory".  Can you please follow suit?  Also above.
This is the kind of thing that Rob H. usually cares about doing right.

> +                       no-map;
> +                       reg = <0 0x96500000 0 0x200000>;

nit: All of the other reserved memory in this same section has "reg"
above "no-map".  It doesn't matter a whole lot, but why not make it
match everyone else?  Also above.


-Doug
