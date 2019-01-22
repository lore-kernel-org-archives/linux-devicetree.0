From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Tue, 22 Jan 2019 14:00:40 +0000
Message-ID: <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sai,

On 01/22/2019 01:37 PM, Sai Prakash Ranjan wrote:
> Add coresight components found on Qualcomm SDM845 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 

Sorry, but I hadn't noticed the PID override strings below. Please
find the question.

> ---
> Depends on AOSS QMP side channel patches and AMBA bus pclk change
> by Bjorn Andersson [1][2].
> Also depends on patch ("arm64: dts: qcom: sdm845: Increase address
> and size cells for soc") [3].
> 
> [1] https://lore.kernel.org/lkml/20190106080915.4493-1-bjorn.andersson@linaro.org/
> [2] https://lore.kernel.org/lkml/20190106080915.4493-7-bjorn.andersson@linaro.org/
> [3] https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/

[...]

	};
> +
> +		etr@6048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0 0x06048000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					etr_in: endpoint {
> +						remote-endpoint =
> +						  <&replicator_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/*
> +		 * On QCOM SDM845, we bypass the normal AMBA bus discovery
> +		 * method by forcing the peripheral ID because of the wrong
> +		 * value read from ETM PID registers.
> +		 */

What is the value read back from the ETM PIDx registers ? Do they
provide inconsistent or incompatible value w.r.t the ETM/Coresight
architecture ? If it is an unsupported CPU with proper values,
you must add them to the table in etm4x driver.

> +		etm@7040000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d> > +			reg = <0 0x07040000 0 0x1000>;
> +
> +			cpu = <&CPU0>;
> +

You seem to be specifying the PID of A53 ETM all over, while at least
one of your cores is ETMv4.2 (from the other patch) and A53 is not
ETMv4.2. As above, it would be good to add the PID to the table.

Suzuki
