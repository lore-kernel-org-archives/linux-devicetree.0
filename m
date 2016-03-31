From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 22:43:03 +0530
Message-ID: <56FD5A9F.5050001@nvidia.com>
References: <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk> <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk> <56E81103.8010903@nvidia.com> <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com> <56ED0F58.7060005@nvidia.com> <56FBD4A3.7080208@nvidia.com> <20160330181623.GQ2350@sirena.org.uk> <56FCCC60.3080303@nvidia.com> <20160331165145.GF2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331165145.GF2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thursday 31 March 2016 10:21 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Mar 31, 2016 at 12:36:08PM +0530, Laxman Dewangan wrote:
>> On Wednesday 30 March 2016 11:46 PM, Mark Brown wrote:
>>>> Like to add property as "regulator-device-ramp-delay" which will be used for
>>>> PMIC configuration and regulator-ramp-delay will be used for delay
>>>> calculation. This is case when advertised ramp delay does not match with the
>>>> platform measured ramp delay.
>>> Why -device?
>> This is device specific and just to differentiate with regulator-ramp-delay
>> which is the platform specific.
>> May be there is some other good name. I can think of other name as
>> regulator-typical-ramp-delay, regulator-advertised-ramp-delay etc.
> So there's already a property you want to set, why are you not trying to
> set that property?

We need two properties, one what we measured in platform and second one 
for what we want to program PMIC. This is for the case where vendor 
advertised ramp delay is not same as measured due to platform design.
Based on discussion, regulator-ramp-delay is for measured ramp delay in 
platform. So we will need another property for configuring PMIC.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
