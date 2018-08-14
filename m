From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] firmware: qcom: scm: Add sdm660 soc compatible
Date: Tue, 14 Aug 2018 14:57:49 -0600
Message-ID: <20180814205749.GA24317@rob-hp-laptop>
References: <20180811162453.10930-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180811162453.10930-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sricharan R <sricharan@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 11 Aug 2018 17:24:50 +0100, Craig Tatlor wrote:
> Add the compatible for SDM660.
> This does not need clocks to do scm calls
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
