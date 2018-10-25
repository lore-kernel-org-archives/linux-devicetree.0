From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: sdm845: Fix pcs_misc region address
 for UNI PHY
Date: Thu, 25 Oct 2018 13:38:24 -0700
Message-ID: <CAD=FV=Xk0VDp2mQ9B25XXovabiHAHr=Dm1v3Pavf_iaNGOexnw@mail.gmail.com>
References: <20181025172318.31353-1-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025172318.31353-1-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Thu, Oct 25, 2018 at 10:23 AM Manu Gautam <mgautam@codeaurora.org> wrote:
>
> Correct address for pcs_misc register region of USB3 QMP UNI PHY.
> These registers are used during runtime-suspend/resume routines
> of phy.
>
> Fixes: ca4db2b538a1 ("arm64: dts: qcom: sdm845: Add USB-related nodes")
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0a31a5..84bee81562a5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1156,7 +1156,7 @@
>                                 reg = <0x88eb200 0x128>,
>                                       <0x88eb400 0x1fc>,
>                                       <0x88eb800 0x218>,
> -                                     <0x88e9600 0x70>;
> +                                     <0x88eb600 0x70>;

Whoops, sorry for not noticing this earlier.  Thanks for the fix!

Evan's most recent patch to the bindings [1] should also be fixed
eventually too.  It feels like those patches have gone through enough
spins though, so maybe we can just post this fix atop those?

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lkml.kernel.org/r/20181024172735.154304-2-evgreen@chromium.org
