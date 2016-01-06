From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 19:29:52 +0530
Message-ID: <568D1DD8.9070705@nvidia.com>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com> <20160106121857.GW6588@sirena.org.uk> <568D064A.8080609@nvidia.com> <20160106123735.GX6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160106123735.GX6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wednesday 06 January 2016 06:07 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
>
>> In one of design, interrupt from MAX77620, and alert from both MAX77621
>> shorted and going to Arm GIC controller. On this case, I need to register
>> the interrupt as SHARED interrupt. This property can not be passed via
>> "interrupt" properties from DT.
>> That's why this flag is added to support this.
> If the driver supports shared interrupts it should just register as a
> shared interrupt all the time, there is nothing about shared interrupts
> which requires that the pin actually be shared.
>
>> Now, by default, if I register the interrupt as SHARED in driver then it
>> failed on second design as GPIO does not offer to register as SHARED
>> interrupt.
> What makes you say that this would fail?

The failure was due to the mismatch flags when registering interrupts. I 
used flag as ONESHOT, TRIGGER Type and SHARED.

I experimented as make the interrupt flag as SHARED all places (and 
ONESHOT always) so that  all interrupt flag same for all registration on 
both design. This way it works fine. It success on GPIO based flag also. 
Now I am passing SHARED | ONESHOT on both driver interrupt registration.

I will drop the interrupt flag option from DT on next patch.

Thanks,
Laxman



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
