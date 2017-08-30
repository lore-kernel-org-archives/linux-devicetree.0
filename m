From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v5,3/3] Documentation: hwmon: Document the IBM CFF power supply
Date: Tue, 29 Aug 2017 18:07:39 -0700
Message-ID: <20170830010739.GA18916@roeck-us.net>
References: <1503344773-7236-4-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1503344773-7236-4-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
Cc: jdelvare-IBi9RG/b67k@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 02:46:13PM -0500, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/ibm-cffps | 54 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/hwmon/ibm-cffps
> 
> diff --git a/Documentation/hwmon/ibm-cffps b/Documentation/hwmon/ibm-cffps
> new file mode 100644
> index 0000000..e05ecd8
> --- /dev/null
> +++ b/Documentation/hwmon/ibm-cffps
> @@ -0,0 +1,54 @@
> +Kernel driver ibm-cffps
> +=======================
> +
> +Supported chips:
> +  * IBM Common Form Factor power supply
> +
> +Author: Eddie James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> +
> +Description
> +-----------
> +
> +This driver supports IBM Common Form Factor (CFF) power supplies. This driver
> +is a client to the core PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +details.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> +curr1_alarm		Output current over-current alarm.
> +curr1_input		Measured output current in mA.
> +curr1_label		"iout1"
> +
> +fan1_alarm		Fan 1 warning.
> +fan1_fault		Fan 1 fault.
> +fan1_input		Fan 1 speed in RPM.
> +fan2_alarm		Fan 2 warning.
> +fan2_fault		Fan 2 fault.
> +fan2_input		Fan 2 speed in RPM.
> +
> +in1_alarm		Input voltage under-voltage alarm.
> +in1_input		Measured input voltage in mV.
> +in1_label		"vin"
> +in2_alarm		Output voltage over-voltage alarm.
> +in2_input		Measured output voltage in mV.
> +in2_label		"vout1"
> +
> +power1_alarm		Input fault or alarm.
> +power1_input		Measured input power in uW.
> +power1_label		"pin"
> +
> +temp1_alarm		PSU inlet ambient temperature over-temperature alarm.
> +temp1_input		Measured PSU inlet ambient temp in millidegrees C.
> +temp2_alarm		Secondary rectifier temp over-temperature alarm.
> +temp2_input		Measured secondary rectifier temp in millidegrees C.
> +temp3_alarm		ORing FET temperature over-temperature alarm.
> +temp3_input		Measured ORing FET temperature in millidegrees C.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
