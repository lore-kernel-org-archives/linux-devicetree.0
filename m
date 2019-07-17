From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv8 4/5] coresight: etm4x: Add ETM PIDs for SDM845 and MSM8996
Date: Wed, 17 Jul 2019 11:40:24 -0600
Message-ID: <CANLsYkw=pAmwoEmXCjLtrUtxLnE8KY5o72Of3aq_-_JHeHyhTA@mail.gmail.com>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org> <2694eae0731a07eeda11f666526ccff8c6b5842e.1562940244.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2694eae0731a07eeda11f666526ccff8c6b5842e.1562940244.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Jul 2019 at 08:17, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Instead of overriding the peripheral id(PID) check in AMBA
> by hardcoding them in DT, add the PIDs to the ETM4x driver.
> Here we use Unique Component Identifier(UCI) for MSM8996
> since the ETM and CPU debug module shares the same PIDs.
> SDM845 does not support CPU debug module.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 7bcac8896fc1..28bcc0e58d7a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -1192,11 +1192,15 @@ static struct amba_cs_uci_id uci_id_etm4[] = {
>  };
>
>  static const struct amba_id etm4_ids[] = {
> -       CS_AMBA_ID(0x000bb95d),         /* Cortex-A53 */
> -       CS_AMBA_ID(0x000bb95e),         /* Cortex-A57 */
> -       CS_AMBA_ID(0x000bb95a),         /* Cortex-A72 */
> -       CS_AMBA_ID(0x000bb959),         /* Cortex-A73 */
> -       CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),        /* Cortex-A35 */
> +       CS_AMBA_ID(0x000bb95d),                 /* Cortex-A53 */
> +       CS_AMBA_ID(0x000bb95e),                 /* Cortex-A57 */
> +       CS_AMBA_ID(0x000bb95a),                 /* Cortex-A72 */
> +       CS_AMBA_ID(0x000bb959),                 /* Cortex-A73 */
> +       CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),/* Cortex-A35 */
> +       CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
> +       CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
> +       CS_AMBA_ID(0x000bb802),                 /* Qualcomm Kryo 385 Cortex-A55 */
> +       CS_AMBA_ID(0x000bb803),                 /* Qualcomm Kryo 385 Cortex-A75 */
>         {},
>  };
>

I have also queued this patch.

> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
