From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] hwmon: (scpi) Fix the scale of SCP sensor readings
Date: Tue, 30 May 2017 12:14:44 +0100
Message-ID: <67c7a124-06fb-fa9e-18b6-5faeed030d10@arm.com>
References: <20170530090507.16611-1-carlo@caione.org>
 <20170530090507.16611-3-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530090507.16611-3-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, punit.agrawal-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 30/05/17 10:05, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> The implementation details for SCPI seems to suggest that the sensor
> readings must be reported by SCP using a well defined scale
> (millidegree Celsius for temperature, millivolts for voltage,
> milliamperes for current, microwatts for power and microjoules for
> energy).
> 
> This is also important for the interaction with other subsystems: for
> example both the thermal sub-system and the hwmon sysfs interface expect
> the temperature expressed in millidegree Celsius.
> 
> Unfortunately since this behaviour is dependent on the firmware
> implementation there are cases where the sensor readings are reported
> using a different scale. For example in the Amlogic SoCs the
> temperature is reported in degree and not millidegree Celsius.
> 
> To take into account this discrepancy and fixup the values reported by
> SCP a new compatible 'amlogic,meson-gxbb-scpi-sensors' is introduced and
> used in this patch by the scpi-hwmon driver to convert the sensor
> readings to the expected scale.
> 

Looks good to me

Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
