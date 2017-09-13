From: Florian Eckert <fe-W9Oo8bkYgz6ELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
Date: Wed, 13 Sep 2017 07:36:16 +0200
Message-ID: <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
References: <20170901065818.2037-1-fe@dev.tdt.de>
 <20170901065818.2037-2-fe@dev.tdt.de> <20170901142622.GC599@roeck-us.net>
 <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob

>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
>> > @@ -0,0 +1,10 @@
>> > +Lantiq cpu temperatur sensor
> 
> s/temperatur/temperature/

Will update this in a follow up page based on the old one. So no v4?

> 
>> > +
>> > +Requires node properties:
>> > +- compatible value :
>> > +	"lantiq,cputemp"
> 
> Kind of non-specific. How is this device even accessed without any 
> other
> property?

It does not need any further properties. If this is set in the device 
tree then the driver is loaded.
After loading the temperature could be read from "/sys/class/hwmon".

Let me know what should i do to get this fixed?

Thanks for feedback

Florian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
