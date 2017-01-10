From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 0/4] hwmon: adc128d818: Support missing operation modes
Date: Tue, 10 Jan 2017 09:17:33 -0800
Message-ID: <20170110171733.GA15339@roeck-us.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170106103817.11588-1-mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Michael Hornung <mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 11:38:13AM +0100, Alexander Koch wrote:
> The ADC128D818 offers four different chip operation modes which vary in the
> number and measurement types of the available input signals (see datasheet
> sec. 8.4.1).
> 
> The current version of the driver only supports the default chip operation
> mode (mode 0), providing seven analog values and a temperature reading.
> 
> This patch series adds support for operation modes 1-3, selectable through
> the device tree attribute 'ti,mode':
> 
>         adc1: adc128d818@1d {
>                 compatible = "ti,adc128d818";
>                 reg = <0x1d>;
>                 mode = <1>;
>         };
> 
> The changes are transparent as the driver defaults to keeping the currently
> active operation mode if no mode is specified via device tree (which is
> mode 0 on chip initialization).
> 
> 
> Changes from v2:
>  - Omit device attribute refactoring (for checkpatch.pl), as requested by
>    maintainer
>  - Add vendor prefix 'ti,' for mode property in device tree
>  - Drop size indication for mode property in device tree
>  - Preserve chip operation mode if none specified in devicetree
>  - Fix missing '\n' in dev_err() calls
> 
> Changes from v1:
>  - Add bindings document as first patch
>  - Preserve logical atomicity of code changes
>  - Improve sysfs device node handling (use is_visible() instead of
>    duplicate attribute list)
>  - Add trivial code refactoring stage for checkpatch.pl to succeed
> 
> 
> Alexander Koch (4):
>   devicetree: hwmon: Add bindings for ADC128D818
>   hwmon: adc128d818: Implement mode selection via dt
>   hwmon: adc128d818: Support operation modes 1-3
>   hwmon: adc128d818: Preserve operation mode
> 
>  .../devicetree/bindings/hwmon/adc128d818.txt       |  39 ++++++
>  drivers/hwmon/adc128d818.c                         | 147 +++++++++++++++------
>  2 files changed, 149 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt
> 
Series applied to -next.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
