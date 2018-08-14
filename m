From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] soc: qcom: smd-rpm: Add sdm660 compatible
Date: Tue, 14 Aug 2018 14:57:00 -0600
Message-ID: <20180814205700.GA23182@rob-hp-laptop>
References: <20180811162417.10143-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180811162417.10143-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 11 Aug 2018 17:24:17 +0100, Craig Tatlor wrote:
> Add the compatible for the RPM in SDM660, so that rpm resources can be
> made available.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  drivers/soc/qcom/smd-rpm.c                                  | 1 +
>  2 files changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
