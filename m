From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv6 6/6] coresight: debug: Add Unique Component Identifier
 (UCI) table
Date: Thu, 31 Jan 2019 18:01:59 +0000
Message-ID: <304febd7-da9a-92d6-47bb-d9983d4bc5d4@arm.com>
References: <cover.1548943727.git.saiprakash.ranjan@codeaurora.org>
 <f724b28e5bfd7bca062aa5380cfd9328289559bf.1548943727.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f724b28e5bfd7bca062aa5380cfd9328289559bf.1548943727.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, jhugo@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, tingwei@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 31/01/2019 14:22, Sai Prakash Ranjan wrote:
> Add UCI table for coresight CPU debug module. This patch adds
> the UCI entries for Kryo CPUs found on MSM8996 which shares
> the same PIDs as ETMs.
> 
> Without this, below error is observed on MSM8996:

nit: Subject doesn't match the patch contents. You could simply say :

coresight: cpu-debug: Add support for Qualcomm Kryo


> 
> [    5.429867] OF: graph: no port node found in /soc/debug@3810000
> [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
> [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
> [    5.446474] OF: graph: no port node found in /soc/debug@3910000
> [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
> [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
> [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
> [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
> [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
> [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
> [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
> [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> ---
> For testing, all dependent patches are in below tree:
>   * https://github.com/saiprakash-ranjan/linux/tree/coresight-next
> 
> This patch depends on UCI support by Mike Leach in below link:
>   * https://lore.kernel.org/lkml/20190130234051.2294-1-mike.leach@linaro.org/
> ---
>   .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index e8819d750938..915d86a39cee 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -655,24 +655,23 @@ static int debug_remove(struct amba_device *adev)
>   	return 0;
>   }
>   
> +static struct amba_cs_uci_id uci_id_debug[] = {

As Stephen mentioned, this must be "const".

Rest looks fine.

Suzuki
