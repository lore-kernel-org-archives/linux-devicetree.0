From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/6] iio: bmi160: Fix time needed to sleep after
 command execution
Date: Fri, 30 Dec 2016 10:49:54 +0000
Message-ID: <7668f191-dafd-e616-171a-cafc52791292@kernel.org>
References: <20161208142259.26230-1-m.niestroj@grinn-global.com>
 <20161208142259.26230-6-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161208142259.26230-6-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/16 14:22, Marcin Niestroj wrote:
> Datasheet specifies typical and maximum execution times for which CMD
> register is occupied after previous command execution. We took these
> values as minimum and maximum time for usleep_range() call before making
> a new command execution.
> 
> To be sure, that the CMD register is no longer occupied we need to wait
> *at least* the maximum time specified by datasheet.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
This looks like a definite bug that we would want to fix in stable as well.
If possible, could you ensure this is the first patch in the updated series?

Thanks,

Jonathan
> ---
> Patch introduced in v2
> 
>  drivers/iio/imu/bmi160/bmi160_core.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
> index 095533c..88bcf3f 100644
> --- a/drivers/iio/imu/bmi160/bmi160_core.c
> +++ b/drivers/iio/imu/bmi160/bmi160_core.c
> @@ -67,10 +67,8 @@
>  
>  #define BMI160_REG_DUMMY		0x7F
>  
> -#define BMI160_ACCEL_PMU_MIN_USLEEP	3200
> -#define BMI160_ACCEL_PMU_MAX_USLEEP	3800
> -#define BMI160_GYRO_PMU_MIN_USLEEP	55000
> -#define BMI160_GYRO_PMU_MAX_USLEEP	80000
> +#define BMI160_ACCEL_PMU_MIN_USLEEP	3800
> +#define BMI160_GYRO_PMU_MIN_USLEEP	80000
>  #define BMI160_SOFTRESET_USLEEP		1000
>  
>  #define BMI160_CHANNEL(_type, _axis, _index) {			\
> @@ -153,20 +151,9 @@ static struct bmi160_regs bmi160_regs[] = {
>  	},
>  };
>  
> -struct bmi160_pmu_time {
> -	unsigned long min;
> -	unsigned long max;
> -};
> -
> -static struct bmi160_pmu_time bmi160_pmu_time[] = {
> -	[BMI160_ACCEL] = {
> -		.min = BMI160_ACCEL_PMU_MIN_USLEEP,
> -		.max = BMI160_ACCEL_PMU_MAX_USLEEP
> -	},
> -	[BMI160_GYRO] = {
> -		.min = BMI160_GYRO_PMU_MIN_USLEEP,
> -		.max = BMI160_GYRO_PMU_MIN_USLEEP,
> -	},
> +static unsigned long bmi160_pmu_time[] = {
> +	[BMI160_ACCEL] = BMI160_ACCEL_PMU_MIN_USLEEP,
> +	[BMI160_GYRO] = BMI160_GYRO_PMU_MIN_USLEEP,
>  };
>  
>  struct bmi160_scale {
> @@ -293,7 +280,7 @@ int bmi160_set_mode(struct bmi160_data *data, enum bmi160_sensor_type t,
>  	if (ret < 0)
>  		return ret;
>  
> -	usleep_range(bmi160_pmu_time[t].min, bmi160_pmu_time[t].max);
> +	usleep_range(bmi160_pmu_time[t], bmi160_pmu_time[t] + 1000);
>  
>  	return 0;
>  }
> 
