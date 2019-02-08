From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCHv7 2/6] arm64: dts: qcom: msm8998: Add Coresight support
Date: Fri, 8 Feb 2019 14:23:43 +0000
Message-ID: <20190208142343.GA9649@en101>
References: <cover.1548981329.git.saiprakash.ranjan@codeaurora.org>
 <bcff6cd655c565568caa2d5a9b20d95e619afb1e.1548981329.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bcff6cd655c565568caa2d5a9b20d95e619afb1e.1548981329.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel
List-Id: devicetree@vger.kernel.org

On Fri, Feb 01, 2019 at 06:23:10AM +0530, Sai Prakash Ranjan wrote:
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on MSM8998.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> ---
> For testing, all dependent patches are in below tree:
>  * https://github.com/saiprakash-ranjan/linux/tree/coresight-next
> 
> This depends on MSM8998 rpm clocks and rpmcc node by Jeffrey Hugo
> and Marc Gonzalez [1][2][3].
> 
> [1] https://lore.kernel.org/lkml/1545099336-5615-1-git-send-email-jhugo@codeaurora.org/
> [2] https://lore.kernel.org/lkml/1548866144-30265-1-git-send-email-jhugo@codeaurora.org/
> [3] https://lore.kernel.org/lkml/6da00186-e7c9-c93d-a80a-65eda2516451@free.fr/
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 435 ++++++++++++++++++++++++++
>  1 file changed, 435 insertions(+)

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
