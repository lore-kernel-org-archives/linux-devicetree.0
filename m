From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sdm845: Add shutdown-ack for
 Q6V5 MSS node
Date: Mon, 17 Dec 2018 16:02:43 -0800
Message-ID: <CAD=FV=WYda6Th_bjoYsnkzUjcYj7uGb0=3Be-EVu4VHvzxNymQ@mail.gmail.com>
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-7-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217100724.4593-7-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add shutdown-ack smp2p interrupt for Q6V5 MSS node.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> This patch depends on:
> https://patchwork.kernel.org/patch/10691213/ - shutdown-ack dt bindings
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
