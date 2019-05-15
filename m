From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC 3/3] arm64: dts: qcom: sdm845-cheza: delete zap-shader
Date: Wed, 15 May 2019 14:43:13 -0700
Message-ID: <CAD=FV=Xa0kAReU7CFvO8QiCRkNxGaQY_JohK+psykqeN9e+QJw@mail.gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-4-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509184415.11592-4-robdclark@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 9, 2019 at 12:08 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> This is unused on cheza.  Delete the node to get rid of the reserved-
> memory section, and to avoid the driver from attempting to load a zap
> shader that doesn't exist every time it powers up the GPU.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-

nit: up to Bjorn / Andy, but personally I'd put cheza and non-cheza
changes in two patches.


>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 8ccbe246dff4..28c28517b21a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -175,6 +175,8 @@
>  /delete-node/ &venus_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &cdsp_pas;
> +/delete-node/ &zap_shader;

nit: I'd probably move the delete of the zap shader to a slightly
different place just because the rest of the lines here are deleting
reserved memory regions.

Other than nits this seems OK to me.  Not that I know anything about
the zap shader or why a zap shader wouldn't be appropriate for cheza.

-Doug
