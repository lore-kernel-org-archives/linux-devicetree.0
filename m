From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv5 2/2] coresight: Do not default to CPU0 for missing CPU phandle
Date: Wed, 3 Jul 2019 14:03:53 -0600
Message-ID: <CANLsYkxxEuLmmiabbyi9-f7U37g7OqHiUWzHHo5GYioEu+aR3g@mail.gmail.com>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org> <1a6616f9f41b560963e86e24d533c5b2c3f05179.1561659046.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1a6616f9f41b560963e86e24d533c5b2c3f05179.1561659046.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 27 Jun 2019 at 12:16, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Coresight platform support assumes that a missing "cpu" phandle
> defaults to CPU0. This could be problematic and unnecessarily binds
> components to CPU0, where they may not be. In coresight etm and
> cpu-debug drivers, abort the probe for such cases.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Same with this one:

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  .../hwtracing/coresight/coresight-cpu-debug.c |  3 +++
>  drivers/hwtracing/coresight/coresight-etm3x.c |  3 +++
>  drivers/hwtracing/coresight/coresight-etm4x.c |  3 +++
>  .../hwtracing/coresight/coresight-platform.c  | 20 +++++++++----------
>  4 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 07a1367c733f..58bfd6319f65 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>                 return -ENOMEM;
>
>         drvdata->cpu = coresight_get_cpu(dev);
> +       if (drvdata->cpu < 0)
> +               return drvdata->cpu;
> +
>         if (per_cpu(debug_drvdata, drvdata->cpu)) {
>                 dev_err(dev, "CPU%d drvdata has already been initialized\n",
>                         drvdata->cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x.c b/drivers/hwtracing/coresight/coresight-etm3x.c
> index 225c2982e4fe..e2cb6873c3f2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x.c
> @@ -816,6 +816,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>         }
>
>         drvdata->cpu = coresight_get_cpu(dev);
> +       if (drvdata->cpu < 0)
> +               return drvdata->cpu;
> +
>         desc.name  = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
>         if (!desc.name)
>                 return -ENOMEM;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 7fe266194ab5..7bcac8896fc1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -1101,6 +1101,9 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>         spin_lock_init(&drvdata->spinlock);
>
>         drvdata->cpu = coresight_get_cpu(dev);
> +       if (drvdata->cpu < 0)
> +               return drvdata->cpu;
> +
>         desc.name = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
>         if (!desc.name)
>                 return -ENOMEM;
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 3c5ceda8db24..cf580ffbc27c 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -159,16 +159,16 @@ static int of_coresight_get_cpu(struct device *dev)
>         struct device_node *dn;
>
>         if (!dev->of_node)
> -               return 0;
> +               return -ENODEV;
> +
>         dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -       /* Affinity defaults to CPU0 */
>         if (!dn)
> -               return 0;
> +               return -ENODEV;
> +
>         cpu = of_cpu_node_to_id(dn);
>         of_node_put(dn);
>
> -       /* Affinity to CPU0 if no cpu nodes are found */
> -       return (cpu < 0) ? 0 : cpu;
> +       return cpu;
>  }
>
>  /*
> @@ -310,7 +310,7 @@ of_get_coresight_platform_data(struct device *dev,
>
>  static inline int of_coresight_get_cpu(struct device *dev)
>  {
> -       return 0;
> +       return -ENODEV;
>  }
>  #endif
>
> @@ -734,14 +734,14 @@ static int acpi_coresight_get_cpu(struct device *dev)
>         struct acpi_device *adev = ACPI_COMPANION(dev);
>
>         if (!adev)
> -               return 0;
> +               return -ENODEV;
>         status = acpi_get_parent(adev->handle, &cpu_handle);
>         if (ACPI_FAILURE(status))
> -               return 0;
> +               return -ENODEV;
>
>         cpu = acpi_handle_to_logical_cpuid(cpu_handle);
>         if (cpu >= nr_cpu_ids)
> -               return 0;
> +               return -ENODEV;
>         return cpu;
>  }
>
> @@ -769,7 +769,7 @@ acpi_get_coresight_platform_data(struct device *dev,
>
>  static inline int acpi_coresight_get_cpu(struct device *dev)
>  {
> -       return 0;
> +       return -ENODEV;
>  }
>  #endif
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
