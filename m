From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v13 4/4] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 16 Feb 2016 19:42:56 -0800
Message-ID: <56C3EC40.6080500@roeck-us.net>
References: <1455642530-19103-1-git-send-email-fu.wei@linaro.org>
 <1455642530-19103-5-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455642530-19103-5-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/16/2016 09:08 AM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> According to Server Base System Architecture (SBSA) specification,
> the SBSA Generic Watchdog has two stage timeouts: the first signal (WS0)
> is for alerting the system by interrupt, the second one (WS1) is a real
> hardware reset.
> More details about the hardware specification of this device:
> ARM DEN0029B - Server Base System Architecture (SBSA)
>
> This driver can operate ARM SBSA Generic Watchdog as a single stage watchdog
> or a two stages watchdog, it's set up by the module parameter "action".
> In the single stage mode, when the timeout is reached, your system
> will be reset by WS1. The first signal (WS0) is ignored.
> In the two stages mode, when the timeout is reached, the first signal (WS0)
> will trigger panic. If the system is getting into trouble and cannot be reset
> by panic or restart properly by the kdump kernel(if supported), then the
> second stage (as long as the first stage) will be reached, system will be
> reset by WS1. This function can help administrator to backup the system
> context info by panic console output or kdump.
>
> This driver bases on linux kernel watchdog framework, so it can get
> timeout from module parameter and FDT at the driver init stage.
>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
