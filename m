From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 1 Apr 2016 00:29:05 +0530
Message-ID: <56FD7379.2000307@nvidia.com>
References: <20160330181623.GQ2350@sirena.org.uk> <56FCCC60.3080303@nvidia.com> <20160331165145.GF2350@sirena.org.uk> <56FD5A9F.5050001@nvidia.com> <20160331174741.GO2350@sirena.org.uk> <56FD62BA.3040406@nvidia.com> <20160331183130.GR2350@sirena.org.uk> <56FD6CF7.5080909@nvidia.com> <20160331184553.GS2350@sirena.org.uk> <56FD6ED6.3020507@nvidia.com> <20160331185945.GT2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331185945.GT2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 01 April 2016 12:29 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 01, 2016 at 12:09:18AM +0530, Laxman Dewangan wrote:
>
>> The setting for observed value is not there for device configuration.
>> Device support 5mV/us and 100mV/us.
>> We observed 50mV/us when setting device to 100mV/us.
> But you said the device had a configuration for 50mV/us?
I looked for last 4 communication and tried to find out if any typo on 
mail so that I can correct but did not found.

/**
Here is the case,
PMIC supports 2 ramp time configurations 5mv/us and 100mV/us. This is 
supported with some specific capacitance in rail output per 
recommendation from PMIC
**/

So may be more older may have..

But here is the stuff without typo ;-)
Device supports 5mV/us and 100mV/us which is not in observed value.

And this is the only reason for requesting of second property.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
