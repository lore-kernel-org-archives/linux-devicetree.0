From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: max8973: add DT parsing of platform specific
 parameter
Date: Tue, 21 Apr 2015 19:45:25 +0530
Message-ID: <55365B7D.7030300@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com> <1429534457-15515-4-git-send-email-ldewangan@nvidia.com> <20150420211907.GP14892@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150420211907.GP14892-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Tuesday 21 April 2015 02:49 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Apr 20, 2015 at 06:24:17PM +0530, Laxman Dewangan wrote:
>
>> +Optional properties:
>> +
>> +-maxim,externally-enable: boolean, externally control the regulator output
>> +		enable/disable.
> I'd have expected this to be enabled if a GPIO is provided to do the
> control rather than having a specific property for it.
Curently there is no support for providing a GPIO for external control 
pins. I have follow on patch to support this as my platform control the 
EN pin of the device through GPIO.

There is also case that the EN pin is controlled by the control signal 
from host power management controller directly and this control signal 
is not exported as GPIO.
So we need this option to support on both cases.

There is another device from Maxim, MAX77621, which is compatible on 
register with this device but it has converted the EN pin as SHTDN pin. 
I have follow on patches to support this device through this driver 
instead of duplicating the driver.

MAX8973: Vout is enabled when EN pin OR EN bit on register is 1.
MAX77621: Vout is enabled when EN pin AND EN bit on register is 1. If EN 
pin (renamed as SHTDN pin) goes low, it reset the entire register 
configuration.

In our platform, we are using MAX77621 and SHTDN pin of MAX77621 is 
controlled through GPIO.
On this case, we will use the GPIO as always HIGH and control Vout 
enable/disable through the register EN bit write otherwise, we will need 
to restore all configuration on each regulator enable.

So on MAX77621 use, we will provide the GPIO for SHTDN pin to make it 
enable always and it will not be controlled externally, it will be 
controlled through register access.

>
>> +-maxim,enable-falling-slew-rate: boolean, enable falling slew rate.
>> +-maxim,enable-active-discharge: boolean: enable active discharge.
>> +-maxim,enable-frequency-shift: boolean, enable 9% frequency shift.
>> +-maxim,enable-bias-control: boolean, enable bias control. By enabling this
>> +		startup delay can be reduce to 20us from 220us.
> It looks like we should be implementing the set_ramp_delay() operation
> here?
>
It is actually enable_time which changes with this bias enable/disable.
So we need to provide desc->enable_time based on this flag. Currently it 
is missing on driver.

I have few more patches, not sent because did not want to bulk the 
review and started with small changes which can be discussed easily.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
