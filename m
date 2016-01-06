From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 17:49:22 +0530
Message-ID: <568D064A.8080609@nvidia.com>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com> <20160106121857.GW6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160106121857.GW6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wednesday 06 January 2016 05:48 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 06, 2016 at 11:45:22AM +0530, Laxman Dewangan wrote:
>
>>   Enhanced transient response (ETR) will affect the configuration of CKADV.
>> +-maxim,junction-temp-warning: Junction temp warning on which device generates
>> +		warning interrupts.
> This needs to specify what the values are - it looks like it's raw
> register values but I'd have expected from this that it'd be an actual
> temperature.

I tried to roundoff to the next higher threshold when supported value 
(120 or 140 degC) is not provided in driver. But it is fine to me to 
specify the possible value setting here and DT binding doc. Will do on 
next patch.


>> +-interrupt-flags: Interrupt flags for registering interrupt which can not be
>> +		passed via interrupt properties.
> Why is this being specified and what are the values?  Most devices don't
> have this...
>

I have two different design with this device:
In both design, I have main PMIC like MAX77620 and two MAX77621.

In one of design, interrupt from MAX77620, and alert from both MAX77621 
shorted and going to Arm GIC controller. On this case, I need to 
register the interrupt as SHARED interrupt. This property can not be 
passed via "interrupt" properties from DT.
That's why this flag is added to support this.

On other design, interrupt from all devices are going to different pins, 
MAX77620 to ARM GIC and MAX77621 to different gpio pins. On this case, 
interrupt are not SHARED.

Now, by default, if I register the interrupt as SHARED in driver then it 
failed on second design as GPIO does not offer to register as SHARED 
interrupt.

To support both design, I have added flag properties and passed from DT.




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
