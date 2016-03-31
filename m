From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 1 Apr 2016 00:09:18 +0530
Message-ID: <56FD6ED6.3020507@nvidia.com>
References: <56ED0F58.7060005@nvidia.com> <56FBD4A3.7080208@nvidia.com> <20160330181623.GQ2350@sirena.org.uk> <56FCCC60.3080303@nvidia.com> <20160331165145.GF2350@sirena.org.uk> <56FD5A9F.5050001@nvidia.com> <20160331174741.GO2350@sirena.org.uk> <56FD62BA.3040406@nvidia.com> <20160331183130.GR2350@sirena.org.uk> <56FD6CF7.5080909@nvidia.com> <20160331184553.GS2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331184553.GS2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 01 April 2016 12:15 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 01, 2016 at 12:01:19AM +0530, Laxman Dewangan wrote:
>> On Friday 01 April 2016 12:01 AM, Mark Brown wrote:
>>> So the PMIC actually has a setting for the rate you're seeing but for
>>> some resaon you can't use it?
>> PMIC has the different rate setting what I am seeing on platform (measured).
>> HW team measured the ramp dealy with specific configuration of rate setting
>> on PMIC which is not default (OTP-One time programmed from Vendor).
> That doesn't tell me what happens if you just configure the device to
> deliver the rate you're observing...

The setting for observed value is not there for device configuration.

Device support 5mV/us and 100mV/us.

We observed 50mV/us when setting device to 100mV/us.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
