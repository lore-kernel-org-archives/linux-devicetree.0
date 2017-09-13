From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
Date: Wed, 13 Sep 2017 10:25:51 -0500
Message-ID: <CAL_Jsq+udc2p_jqQN+m4R69zW=7RBfJCDrQgNXOiMycErP43LQ@mail.gmail.com>
References: <20170901065818.2037-1-fe@dev.tdt.de> <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net> <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
 <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a5a2e95a1fb671eb59459542af122d6e-W9Oo8bkYgz6ELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Eckert <fe-W9Oo8bkYgz6ELgA04lAiVw@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux HWMON List <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 12:36 AM, Florian Eckert <fe-W9Oo8bkYgz6ELgA04lAiVw@public.gmane.org> wrote:
> Hello Rob
>
>>> > --- /dev/null
>>> > +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
>>> > @@ -0,0 +1,10 @@
>>> > +Lantiq cpu temperatur sensor
>>
>>
>> s/temperatur/temperature/
>
>
> Will update this in a follow up page based on the old one. So no v4?
>
>>
>>> > +
>>> > +Requires node properties:
>>> > +- compatible value :
>>> > +     "lantiq,cputemp"
>>
>>
>> Kind of non-specific. How is this device even accessed without any other
>> property?
>
>
> It does not need any further properties. If this is set in the device tree
> then the driver is loaded.

DT is not the only way to instantiate drivers.

What I meant is how do you access the hardware? That should be evident
from the binding and it is not.

Looking at the driver, you have some memory mapped system control
registers which get ioremapped in arch/mips/lantiq/xway/sysctrl.c and
accesses thru some platform specific macros. That is not the ideal way
to do things as we use syscon and regmap for such things. But that's
all mostly kernel details not so relevant to the DT binding.

For DT, I'd expect this is a child node of the sysctrl block with a
reg property value of <0x40 4> (along with any other child devices).
You could also not even put this in DT and the system controller can
have it's own driver that instantiates the child device for this
driver.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
