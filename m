From: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] drivers: firmware: psci: add extended stateid
 power_state support
Date: Fri, 5 Jun 2015 10:16:36 -0400
Message-ID: <CAJ5Y-eYLAjOcTU1Md3Rmc0E49A5Dby1aoBzwtpKpD4Rg=XAYfA@mail.gmail.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1432901799-18359-6-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-6-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29 May 2015 at 08:16, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> PSCI v1.0 augmented the power_state parameter format specification
> (extended stateid) and introduced a way to probe it through the
> PSCI_FEATURES interface.
>
> This patch implements code that detects the power_state format at
> run-time through the PSCI_FEATURES interface, so that the power_state
> argument can be properly detected and validated in the kernel according
> to the information provided through firmware.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/firmware/psci.c   | 34 ++++++++++++++++++++++++++++++++--
>  include/uapi/linux/psci.h | 12 ++++++++++++
>  2 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
> index 2330099..4063784 100644
> --- a/drivers/firmware/psci.c
> +++ b/drivers/firmware/psci.c
> @@ -74,14 +74,34 @@ static u32 psci_function_id[PSCI_FN_MAX];
>                                 PSCI_0_2_POWER_STATE_TYPE_MASK | \
>                                 PSCI_0_2_POWER_STATE_AFFL_MASK)
>
> +#define PSCI_EXT_POWER_STATE_MASK              \
> +                               (PSCI_EXT_POWER_STATE_ID_MASK | \
> +                               PSCI_EXT_POWER_STATE_TYPE_MASK)
> +
> +static u32 psci_cpu_suspend_feature;
> +
> +static inline bool psci_has_ext_power_state(void)
> +{
> +       return psci_cpu_suspend_feature &
> +                               PSCI_FEATURES_CPU_SUSPEND_PF_MASK;
> +}
> +
>  bool psci_power_state_loses_context(u32 state)
>  {
> -       return state & PSCI_0_2_POWER_STATE_TYPE_MASK;
> +       const u32 mask = psci_has_ext_power_state() ?
> +                                       PSCI_EXT_POWER_STATE_TYPE_MASK :
> +                                       PSCI_0_2_POWER_STATE_TYPE_MASK;
> +
> +       return state & mask;
>  }
>
>  bool psci_power_state_is_valid(u32 state)
>  {
> -       return !(state & ~PSCI_0_2_POWER_STATE_MASK);
> +       const u32 valid_mask = psci_has_ext_power_state() ?
> +                              PSCI_EXT_POWER_STATE_MASK :
> +                              PSCI_0_2_POWER_STATE_MASK;
> +
> +       return !(state & ~valid_mask);
>  }
>
>  static int psci_to_linux_errno(int errno)
> @@ -202,6 +222,14 @@ static int __init psci_features(u32 psci_func_id)
>                               psci_func_id, 0, 0);
>  }
>
> +static void __init psci_init_cpu_suspend(void)
> +{
> +       int feature = psci_features(psci_function_id[PSCI_FN_CPU_SUSPEND]);
> +
> +       if (feature != PSCI_RET_NOT_SUPPORTED)
> +               psci_cpu_suspend_feature = feature;
> +}
> +
>  /*
>   * Detect the presence of a resident Trusted OS which may cause CPU_OFF to
>   * return DENIED (which would be fatal).
> @@ -280,6 +308,8 @@ static int __init psci_probe(void)
>
>         psci_init_migrate();
>
> +       psci_init_cpu_suspend();
> +
>         return 0;
>  }
>
> diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
> index 187b828d..2598d7c 100644
> --- a/include/uapi/linux/psci.h
> +++ b/include/uapi/linux/psci.h
> @@ -58,6 +58,13 @@
>  #define PSCI_0_2_POWER_STATE_AFFL_MASK         \
>                                 (0x3 << PSCI_0_2_POWER_STATE_AFFL_SHIFT)
>
> +/* PSCI extended power state encoding for CPU_SUSPEND function */
> +#define PSCI_EXT_POWER_STATE_ID_MASK           0xfffffff
> +#define PSCI_EXT_POWER_STATE_ID_SHIFT          0
> +#define PSCI_EXT_POWER_STATE_TYPE_SHIFT                30
> +#define PSCI_EXT_POWER_STATE_TYPE_MASK         \
> +                               (0x1 << PSCI_EXT_POWER_STATE_TYPE_SHIFT)
> +

For consistency, dont you need version numbers here, like we have for v0.2?

>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON             0
>  #define PSCI_0_2_AFFINITY_LEVEL_OFF            1
> @@ -78,6 +85,11 @@
>  #define PSCI_VERSION_MINOR(ver)                        \
>                 ((ver) & PSCI_VERSION_MINOR_MASK)
>
> +/* PSCI features decoding (>=1.0) */
> +#define PSCI_FEATURES_CPU_SUSPEND_PF_SHIFT     1
> +#define PSCI_FEATURES_CPU_SUSPEND_PF_MASK      \
> +                       (0x1 << PSCI_FEATURES_CPU_SUSPEND_PF_SHIFT)
> +

Likewise.

>  /* PSCI return values (inclusive of all PSCI versions) */
>  #define PSCI_RET_SUCCESS                       0
>  #define PSCI_RET_NOT_SUPPORTED                 -1
> --
> 2.2.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
