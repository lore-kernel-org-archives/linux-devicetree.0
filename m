From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv3 1/1] coresight: Do not default to CPU0 for missing CPU
 phandle
Date: Mon, 24 Jun 2019 09:26:17 +0100
Message-ID: <4db99204-8553-7a80-f952-30cbd149593d@arm.com>
References: <cover.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <635466ab6a27781966bb083e93d2ca2729473ced.1561346998.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <635466ab6a27781966bb083e93d2ca2729473ced.1561346998.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sai,

Thanks for getting this done.

On 24/06/2019 04:36, Sai Prakash Ranjan wrote:
> Coresight platform support assumes that a missing "cpu" phandle
> defaults to CPU0. This could be problematic and unnecessarily binds
> components to CPU0, where they may not be. Let us make the DT binding
> rules a bit stricter by not defaulting to CPU0 for missing "cpu"
> affinity information.
> 
> Also in coresight etm and cpu-debug drivers, abort the probe
> for such cases.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
