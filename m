From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: (brcmstb) Add driver for Broadcom STB DPFE
Date: Tue, 18 Apr 2017 17:15:47 -0700
Message-ID: <CANEuBv5uTBurgpoXBh143T0sB+GCj8oymDxh5+2CqXk5A4dYqw@mail.gmail.com>
References: <20170418201702.57019-1-code@mmayer.net> <20170418201702.57019-3-code@mmayer.net>
 <20170418205839.GA3554@roeck-us.net> <f8c99c6f-8c53-0d0e-0712-d001c1e45f75@gmail.com>
 <20170418224739.GA24376@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418224739.GA24376-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux HWMON List <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18 April 2017 at 15:47, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> Hi Florian,
>
> On Tue, Apr 18, 2017 at 03:29:55PM -0700, Florian Fainelli wrote:
>> Hey Guenter,
>>
>> On 04/18/2017 01:58 PM, Guenter Roeck wrote:
>> > Hi Markus,
>> >
>> > On Tue, Apr 18, 2017 at 01:17:02PM -0700, Markus Mayer wrote:
>> >> From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> >>
>> >> This driver allows access to DRAM properties, such as the refresh rate,
>> >> via the Broadcom STB DDR PHY Front End (DPFE). The refresh rate can be
>> >> used as indirect indicator of the DRAM temperature.
>> >>
>> >> The driver also allows setting of the sampling interval.
>> >>
>> >> Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> >> ---
>> > [ ... ]
>> >
>> >> +
>> >> +static SENSOR_DEVICE_ATTR(dpfe_info, 0444, show_info, NULL, 1000);
>> >> +static SENSOR_DEVICE_ATTR(dpfe_refresh, 0644, show_refresh, store_refresh,
>> >> +                    1000);
>> >> +static SENSOR_DEVICE_ATTR(dpfe_vendor, 0444, show_vendor, NULL, 1000);
>> >> +static struct attribute *dpfe_attrs[] = {
>> >> +  &sensor_dev_attr_dpfe_info.dev_attr.attr,
>> >> +  &sensor_dev_attr_dpfe_refresh.dev_attr.attr,
>> >> +  &sensor_dev_attr_dpfe_vendor.dev_attr.attr,
>> >> +  NULL
>> >> +};
>> >> +ATTRIBUTE_GROUPS(dpfe);
>> >> +
>> >
>> > There is not a single standard hwmon attribute. I don't know how
>> > to classify this driver, and where it should reside, but it is not
>> > a hwmon driver.
>>
>> This is a driver that talks to an embedded CPU running firmware which is
>> capable of giving various informations about the DRAM chip being
>> populated, including a temperature trend (hotter or cooler). We thought
>> initially we would be able to expose the actual temperature, but this in
>> turn required a lot more knowledge about the DRAM chip that we wish we
>> knew about. That is sort of where and why this driver was proposed for
>> hwmon.
>>
>> Which subsystem do you think would be best for this driver drivers/misc/
>> or drivers/soc/bcm/brcmstb/ maybe?
>
> Both should work. I would probably try misc first and let Greg tell me
> which way to go ;-).

Thanks for the tip. As Florian said, it was not the idea to submit a
completely non-standard hwmon driver. I was sure I would be able to
report at least some standard hwmon data also.

Regards,
-Markus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
