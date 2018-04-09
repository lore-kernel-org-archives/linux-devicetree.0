From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mailbox: qcom: Add msm8998 hmss compatible
Date: Mon, 9 Apr 2018 13:59:02 -0500
Message-ID: <20180409185902.sl2r5d5hfpxt4tyb@rob-hp-laptop>
References: <20180327155426.31998-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180327155426.31998-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 08:54:26AM -0700, Bjorn Andersson wrote:
> The Qualcomm MSM8998 platform has a APCS HMSS GLOBAL block, add the
> compatible for this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                             | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
