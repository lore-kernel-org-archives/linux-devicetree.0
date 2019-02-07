From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv7 6/6] coresight: cpu-debug: Add support for Qualcomm Kryo
Date: Thu, 7 Feb 2019 13:28:56 -0700
Message-ID: <CANLsYky9ujRyftg3WoeSWK37=3_k5hw9x=DV34P_YrUXCLApXw@mail.gmail.com>
References: <cover.1548981329.git.saiprakash.ranjan@codeaurora.org> <53cf9d9d3b14f503a6c842754f3c55413f5a3392.1548981329.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53cf9d9d3b14f503a6c842754f3c55413f5a3392.1548981329.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jan 2019 at 17:55, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add support for coresight CPU debug module on Qualcomm
> Kryo CPUs. This patch adds the UCI entries for Kryo CPUs
> found on MSM8996 which shares the same PIDs as ETMs.
>
> Without this, below error is observed on MSM8996:
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
>  * https://github.com/saiprakash-ranjan/linux/tree/coresight-next
>
> This patch depends on UCI support by Mike Leach in below link:
>  * https://lore.kernel.org/lkml/20190130234051.2294-1-mike.leach@linaro.org/
> ---
>  .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index e8819d750938..50ebf5b7fa4f 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -655,24 +655,23 @@ static int debug_remove(struct amba_device *adev)
>         return 0;
>  }
>
> +static const struct amba_cs_uci_id uci_id_debug[] = {
> +       {
> +               /*  CPU Debug UCI data */
> +               .devarch        = 0x47706a15,
> +               .devarch_mask   = 0xfff0ffff,
> +               .devtype        = 0x00000015,
> +       }
> +};
> +

Thank you for adding that.

>  static const struct amba_id debug_ids[] = {
> -       {       /* Debug for Cortex-A53 */
> -               .id     = 0x000bbd03,
> -               .mask   = 0x000fffff,
> -       },
> -       {       /* Debug for Cortex-A57 */
> -               .id     = 0x000bbd07,
> -               .mask   = 0x000fffff,
> -       },
> -       {       /* Debug for Cortex-A72 */
> -               .id     = 0x000bbd08,
> -               .mask   = 0x000fffff,
> -       },
> -       {       /* Debug for Cortex-A73 */
> -               .id     = 0x000bbd09,
> -               .mask   = 0x000fffff,
> -       },
> -       { 0, 0 },
> +       CS_AMBA_ID(0x000bbd03),                         /* Cortex-A53 */
> +       CS_AMBA_ID(0x000bbd07),                         /* Cortex-A57 */
> +       CS_AMBA_ID(0x000bbd08),                         /* Cortex-A72 */
> +       CS_AMBA_ID(0x000bbd09),                         /* Cortex-A73 */
> +       CS_AMBA_UCI_ID(0x000f0205, uci_id_debug),       /* Qualcomm Kryo */
> +       CS_AMBA_UCI_ID(0x000f0211, uci_id_debug),       /* Qualcomm Kryo */
> +       {},

I have reviewed your work and things look good to me.  Once again
there isn't much I can do with it right now.  Please re-submit when
Mike's set has been merged.

Mathieu

>  };
>
>  static struct amba_driver debug_driver = {
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
