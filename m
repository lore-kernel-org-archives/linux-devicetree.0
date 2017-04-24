From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Mon, 24 Apr 2017 11:43:52 +0100
Message-ID: <32edad9f-a568-c67d-060d-055517d6782f@collabora.com>
References: <cover.1491118230.git.guillaume.tucker@collabora.com>
 <db45d0d68957d699f13a0d92f4f84d8ebfd0270e.1491118230.git.guillaume.tucker@collabora.com>
 <20170404020056.d7osj7rmog22xbjd@rob-hp-laptop>
 <b8cf7acd-83e9-49fb-0800-19a76b8dcce5@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b8cf7acd-83e9-49fb-0800-19a76b8dcce5-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/04/17 10:15, Guillaume Tucker wrote:
> Hi Rob,
>
> On 04/04/17 03:00, Rob Herring wrote:
>> On Sun, Apr 02, 2017 at 08:59:44AM +0100, Guillaume Tucker wrote:

>>> +- operating-points : Refer to Documentation/devicetree/bindings/power/opp.txt
>>> +  for details.
>>
>> Is this going to be sufficient vs. operating-points-v2? Or should it be
>> a power domain with OPPs?
>
> In principle, switching to operating-points-v2 should be very
> straightforward.  I have smoke-tested the driver with an
> operating-points-v2 table and a phandle to it inside the gpu node
> in place of operating-points and it seems to be working fine.  At
> least it parsed the OPPs and got initialised correctly.
>
> My understanding is that operating-points (v1) are not deprecated
> so we could keep the bindings as-is, but please let me know
> otherwise and I can try to address that in my next patch version.
> In the documentation, it should only be the case of replacing
> operating-points with operating-points-v2.

While the opp bindings documentation doesn't mention anything
about operating-points being deprecated, the code and comments in
of.c are pretty clear about this:

	/*
	 * OPPs have two version of bindings now. The older one is deprecated,
	 * try for the new binding first.
	 */

So I shall use operating-points-v2 in my patch v4.

Thanks,
Guillaume
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
