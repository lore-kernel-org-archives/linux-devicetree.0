From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/7] soc: qcom: rpmpd: Add a Power domain driver to
 model corners
Date: Mon, 25 Jun 2018 11:15:44 -0600
Message-ID: <20180625171544.GA18520@rob-hp-laptop>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180612044052.4402-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 10:10:47AM +0530, Rajendra Nayak wrote:
> The Power domains for corners just pass the performance state set by the
> consumers to the RPM (Remote Power manager) which then takes care
> of setting the appropriate voltage on the corresponding rails to
> meet the performance needs.
> 
> We add all Power domain data needed on msm8996 here. This driver can easily
> be extended by adding data for other qualcomm SoCs as well.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig               |   9 +
>  drivers/soc/qcom/Makefile              |   1 +
>  drivers/soc/qcom/rpmpd.c               | 301 +++++++++++++++++++++++++

>  include/dt-bindings/power/qcom-rpmpd.h |  16 ++

Acked-by: Rob Herring <robh@kernel.org>

>  4 files changed, 327 insertions(+)
>  create mode 100644 drivers/soc/qcom/rpmpd.c
>  create mode 100644 include/dt-bindings/power/qcom-rpmpd.h
