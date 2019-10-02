From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] hwmon: Fix HWMON_P_MIN_ALARM mask
Date: Wed, 2 Oct 2019 06:37:27 -0700
Message-ID: <20191002133727.GA15583@roeck-us.net>
References: <20190924124945.491326-1-nuno.sa@analog.com>
 <20190924124945.491326-2-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924124945.491326-2-nuno.sa@analog.com>
Sender: stable-owner@vger.kernel.org
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 02:49:43PM +0200, Nuno Sá wrote:
> Both HWMON_P_MIN_ALARM and HWMON_P_MAX_ALARM were using
> BIT(hwmon_power_max_alarm).
> 
> Fixes: aa7f29b07c870 ("hwmon: Add support for power min, lcrit, min_alarm and lcrit_alarm")
> CC: <stable@vger.kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

> ---
>  include/linux/hwmon.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 04c36b7a61dd..72579168189d 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -235,7 +235,7 @@ enum hwmon_power_attributes {
>  #define HWMON_P_LABEL			BIT(hwmon_power_label)
>  #define HWMON_P_ALARM			BIT(hwmon_power_alarm)
>  #define HWMON_P_CAP_ALARM		BIT(hwmon_power_cap_alarm)
> -#define HWMON_P_MIN_ALARM		BIT(hwmon_power_max_alarm)
> +#define HWMON_P_MIN_ALARM		BIT(hwmon_power_min_alarm)
>  #define HWMON_P_MAX_ALARM		BIT(hwmon_power_max_alarm)
>  #define HWMON_P_LCRIT_ALARM		BIT(hwmon_power_lcrit_alarm)
>  #define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
