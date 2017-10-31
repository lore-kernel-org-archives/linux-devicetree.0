From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 0/3] GLINK intent preallocation support
Date: Mon, 30 Oct 2017 21:26:42 -0700
Message-ID: <20171031042642.GK1275@minitux>
References: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chris Lew <clew@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, aneela@codeaurora.org, smaliyap@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 26 Oct 15:28 PDT 2017, Chris Lew wrote:

> Intents are used to specify when a channel can receive data from a
> remoteproc. Add support for channels to customize the size and amount
> of prequeued intents.
> 
> An audio channel might expect to receive 3 packets of size 4k in rapid
> succession. This change allows the channel to prepare for this data instead
> of allocating on demand.
> 

Thanks, tested and applied with some minor modifications to patch 2.

Regards,
Bjorn

> Chris Lew (3):
>   dt-bindings: soc: qcom: Support GLINK intents
>   rpmsg: glink: Add support to preallocate intents
>   rpmsg: glink: Use best fit intent during tx
> 
>  .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 10 +++++
>  drivers/rpmsg/qcom_glink_native.c                  | 48 +++++++++++++++++-----
>  2 files changed, 47 insertions(+), 11 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
