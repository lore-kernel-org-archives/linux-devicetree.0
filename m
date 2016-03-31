From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 23:17:38 +0530
Message-ID: <56FD62BA.3040406@nvidia.com>
References: <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk> <56E81103.8010903@nvidia.com> <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com> <56ED0F58.7060005@nvidia.com> <56FBD4A3.7080208@nvidia.com> <20160330181623.GQ2350@sirena.org.uk> <56FCCC60.3080303@nvidia.com> <20160331165145.GF2350@sirena.org.uk> <56FD5A9F.5050001@nvidia.com> <20160331174741.GO2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331174741.GO2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thursday 31 March 2016 11:17 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Mar 31, 2016 at 10:43:03PM +0530, Laxman Dewangan wrote:
>
>> We need two properties, one what we measured in platform and second one for
>> what we want to program PMIC. This is for the case where vendor advertised
>> ramp delay is not same as measured due to platform design.
> What makes you say that we need two properties?
>
>> Based on discussion, regulator-ramp-delay is for measured ramp delay in
>> platform. So we will need another property for configuring PMIC.
> So as well as delaying in the kernel to cover the ramp time you want to
> configure something in the PMIC?  What are you trying to configure in
> the PMIC?  How will the PMIC driver meaningfully interpret a generic
> property given that the whole point here is that the PMIC is unable to
> deliver in spec behaviour?
>

Here is the case,
PMIC supports 2 ramp time configurations 5mv/us and 100mV/us. This is 
supported with some specific capacitance in rail output per 
recommendation from PMIC Vendor. This recommendation is generic in nature.
We got PMIC with some non-desired default configuration i.e. 5mV/us. Our 
HW team recommend to configure the PMIC for 100mV/us.

HW and chip team did simulation with tegra and PMIC and found that the 
board needs more capacitance then what Vendor recommended for proper 
signal conditioning on interface. So they put the difference 
capactitance value and this causes deviation in ramp delay from 
advertised value. In out design, we measured the ramp time as 50mv/us 
when PMIC is configured for 100mV/us.

So for all settling time, we need to use the ramp as 50mV/us.

 From DT, I will provide regulator-ramp-delay as 50mv/us.

But I do not have property for saying 100mv/us for PMIC configurations 
and this is what makes need of 2nd property.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
