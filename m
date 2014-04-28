From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] arm: exynos: Add /dev/bL_status user interface
 on Exynos5420
Date: Mon, 28 Apr 2014 13:25:00 +0200
Message-ID: <535E3A8C.6070304@linaro.org>
References: <1398528348-21214-1-git-send-email-a.kesavan@samsung.com> <1398528348-21214-7-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398528348-21214-7-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/26/2014 06:05 PM, Abhilash Kesavan wrote:
> Add a user interface to check the core and cluster status on
> Exynos5420. This can be utilized while debugging mcpm issues.
> cat /dev/bL_status will show the current power status of all
> the 8 cores along with the cluster.
>
> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

Hi Abhilash,

I don't think you should add this file.

1. big Little is not exynos specific
2. /dev is not for the purpose of your patch

So I would recommend:

1. create a generic infra-structure for all the big.Little
2. and/or use debugfs

=46urthermore, how is it usable ? Will you read the file every 2ms to=20
check the cluster status, knowing it will be woken up by the read=20
operation ?

=46rankly speaking, it would make sense to add traces in mcpm.c (if the=
y=20
aren't already there - did not check).

>   arch/arm/mach-exynos/mcpm-exynos.c | 64 +++++++++++++++++++++++++++=
+++++++++++
>   1 file changed, 64 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exyno=
s/mcpm-exynos.c
> index f9977bf..83428b0 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -269,6 +269,53 @@ static void __init exynos_mcpm_usage_count_init(=
void)
>   	cpu_use_count[cpu][cluster] =3D 1;
>   }
>
> +static size_t bL_check_status(char *info)
> +{
> +	size_t len =3D 0;
> +	int i;
> +
> +	len +=3D sprintf(&info[len], "\t0 1 2 3 L2\n");
> +	len +=3D sprintf(&info[len], "[A15]   ");
> +	for (i =3D 0; i < 4; i++) {
> +		len +=3D sprintf(&info[len], "%d ",
> +			(readl(EXYNOS_ARM_CORE_STATUS(i)) & 0x3) =3D=3D 3 ? 1 : 0);
> +	}
> +	len +=3D sprintf(&info[len], "%d\n",
> +			(readl(EXYNOS_COMMON_STATUS(0)) & 0x3) =3D=3D 3 ? 1 : 0);
> +
> +	len +=3D sprintf(&info[len], "[A7]    ");
> +	for (i =3D 4; i < 8; i++)
> +		len +=3D sprintf(&info[len], "%d ",
> +			(readl(EXYNOS_ARM_CORE_STATUS(i)) & 0x3) =3D=3D 3 ? 1 : 0);
> +	len +=3D sprintf(&info[len], "%d\n\n",
> +			(readl(EXYNOS_COMMON_STATUS(1)) & 0x3) =3D=3D 3 ? 1 : 0);
> +
> +	return len;
> +}
> +
> +static ssize_t bL_status_read(struct file *file, char __user *buf,
> +			size_t len, loff_t *pos)
> +{
> +	size_t count =3D 0;
> +	char info[100];
> +
> +	count =3D bL_check_status(info);
> +	if (count < 0)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, len, pos, info, count);
> +}
> +
> +static const struct file_operations bL_status_fops =3D {
> +	.read		=3D bL_status_read,
> +};
> +
> +static struct miscdevice bL_status_device =3D {
> +	MISC_DYNAMIC_MINOR,
> +	"bL_status",
> +	&bL_status_fops
> +};
> +
>   /*
>    * Enable cluster-level coherency, in preparation for turning on th=
e MMU.
>    */
> @@ -319,3 +366,20 @@ static int __init exynos_mcpm_init(void)
>   }
>
>   early_initcall(exynos_mcpm_init);
> +
> +static int __init exynos_bl_status_init(void)
> +{
> +	int ret;
> +
> +	if (!soc_is_exynos5420())
> +		return -ENODEV;
> +
> +	ret =3D misc_register(&bL_status_device);
> +	if (ret) {
> +		pr_info("bl_status not available\n");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +late_initcall(exynos_bl_status_init);
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
