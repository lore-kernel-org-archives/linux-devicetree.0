From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 19 Apr 2016 16:26:27 +0530
Message-ID: <57160EDB.5040704@nvidia.com>
References: <20160331192227.GU2350@sirena.org.uk> <56FD7F07.7010404@nvidia.com> <20160331203942.GV2350@sirena.org.uk> <56FE2009.4020302@nvidia.com> <20160401161121.GZ2350@sirena.org.uk> <570370E5.3070901@nvidia.com> <20160412010226.GO3351@sirena.org.uk> <570CF822.4050002@nvidia.com> <20160413065310.GK14664@sirena.org.uk> <571601E7.2000901@nvidia.com> <20160419105545.GT3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160419105545.GT3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 19 April 2016 04:25 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 19, 2016 at 03:31:11PM +0530, Laxman Dewangan wrote:
>> On Wednesday 13 April 2016 12:23 PM, Mark Brown wrote:
>>> Possibly.  It did also occur to me last night that having a Maxim
>>> specific property which lets you specify a raw register value to
>>> configure in cases where the board goes out of spec (as opposed to a
>>> time which could be left specified as the real value) might solve the
>>> problem without being too terrible from an interface point of view,
>>> though something that's directly obvious from the schematic would be
>>> much better.
> You appear to have ignord my suggestion above...
>
>
I was too focused on the getting the info from Maxim on this to get 
something in equation form.
There is no way to get the deviation equation and your suggestion is 
only seems solution for this issue.
Thanks for evaluating/trying at your end and for valuable suggestion.

Now, for property, I will add
  maxim,ramp-delay

This is device specific ramp delay which need to be configure on device 
register. The platform observed delay must be provided via 
regulator-ramp-delay.

I will send the patch on this.

Thanks,
Laxman


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
