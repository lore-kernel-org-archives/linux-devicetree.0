From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add reserve-memory nodes
Date: Wed, 31 Oct 2018 14:59:25 -0700
Message-ID: <CAD=FV=XpFrt2htDfbkhFQMh7szTcUm4CYqNHsVomOEK6XArC_w@mail.gmail.com>
References: <20181031060921.5890-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031060921.5890-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sibis@codeaurora.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, benchan@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 30, 2018 at 11:09 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add reserve-memory nodes for mpss and mba required for
> remoteproc mss pil.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I'm not an expert on the assignment of these ranges, but my nits have
been addressed and it seems like it matches what we're doing in this
section.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
