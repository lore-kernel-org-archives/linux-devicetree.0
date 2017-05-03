From: Markus Mayer <markus.mayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for Broadcom STB DRAM Sensors
Date: Wed, 3 May 2017 15:29:10 -0700
Message-ID: <CAGt4E5s0uoLjeEhk_srxbr=f_sf-NSVXbW_HEJfjnSiAQU8o=Q@mail.gmail.com>
References: <20170418201702.57019-1-code@mmayer.net> <20170418201702.57019-2-code@mmayer.net>
 <CAGt4E5susQWWNZPbNh8AoWtK-4yu50VL=GqOw+_2w_FA+2V68Q@mail.gmail.com>
 <CAGt4E5uu1Ty0ReaiBZ0kcR_-jnqJQL8vgU4Y9mL64FP7f+=T7Q@mail.gmail.com>
 <20170427215737.dmnj4u2e4tfc6vfv@rob-hp-laptop> <90f011d6-9241-e860-7a0e-2fb52c2337ce@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90f011d6-9241-e860-7a0e-2fb52c2337ce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux HWMON List <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 27 April 2017 at 15:00, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/27/2017 02:57 PM, Rob Herring wrote:
>>>>> +Optional properties:
>>>>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
>>
>> Don't use cell-index. It's not a valid property for FDT (only real
>> OpenFirmware).
>
> My bad, I was advising Markus to use this property since it was largely
> used throughout Documentation/devicetree/bindings/. What would be a more
> appropriate way to have the same information? Aliases?

Hopefully this will be the last time we need to pester you about this.
What should we be using instead of cell-index to identify multiple
instances of a device?

To give you an idea of what the code looks like right now:

ret = of_property_read_u32(dev->of_node, "cell-index", &index);
if (ret)
    index = 0;
[...]
dev_set_name(dpfe_dev, "dpfe%u", index);
ret = device_register(dpfe_dev);

Enumerating the devices like this is what we are after.

Thanks,
-Markus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
