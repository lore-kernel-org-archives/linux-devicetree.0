From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: davinci: add genpd support
Date: Sat, 17 Feb 2018 21:41:01 -0600
Message-ID: <79a981ae-881f-b358-629c-0b64e48f192d@lechnology.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
 <4dbc57ec-3506-eb1d-e00d-adfe75c3b39b@lechnology.com>
 <a736d727-5805-94ea-3e40-34fc4a6267ef@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a736d727-5805-94ea-3e40-34fc4a6267ef-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/09/2018 06:42 AM, Sekhar Nori wrote:
> Hi David,
> 
> On Thursday 08 February 2018 04:13 AM, David Lechner wrote:
>> On 02/07/2018 07:45 AM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>
>>> Hi Sekhar et al,
>>>
>>> please take a look at the following patches. They add a simple genpd
>>> driver and use it in DT mode on da850 boards.
>>>
>>> I was trying to use genpd in legacy mode too, but couldn't find neither
>>> any interfaces nor users that would do that. For now I added a check in
>>> arch/arm/mach-davinci/pm_domain.c that disables the clock pm setup if
>>> we're using genpd.
>>>
>>> This series applies on top of and has been tested with David Lechner's
>>> for-bartosz branch. It fixes the clock look-up issues we faced with
>>> lcdc and emac.
>>
>> I'm starting to think that it makes more sense to just make the PSC driver
>> a power-domain and reset provider rather than a clock provider. It is
>> unfortunate that genpd is DT only.
> 
> This will mean that the only way to enable clocks on DaVinci is to use
> pm_runtime() calls. We do still have drivers which depend on clk api for
> enabling clocks, so I am not sure its feasible just yet.
> 
> I think a question like this can arise for any gate clock.
> 

I've incorporated parts of this series into my v7 work in progress
using the suggestions I made about using the existing PSC device
as the power domain provider.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
