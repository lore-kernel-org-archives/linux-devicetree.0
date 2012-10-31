From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH] dt: describe base reset signal binding
Date: Wed, 31 Oct 2012 16:47:15 -0600
Message-ID: <5091AA73.10905@wwwdotorg.org>
References: <1351028756-22309-1-git-send-email-swarren@wwwdotorg.org>
 <20121029183233.18780.11964@nucleus> <5090161D.2030702@wwwdotorg.org>
 <20121031103221.18780.43096@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121031103221.18780.43096@nucleus>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Cc: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/31/2012 04:32 AM, Mike Turquette wrote:
> Quoting Stephen Warren (2012-10-30 11:02:05)
>> On 10/29/2012 12:32 PM, Mike Turquette wrote:
>>> Quoting Stephen Warren (2012-10-23 14:45:56)
>>>> What do people think of this? Does it sound like a good idea to go ahead
>>>> with a reset subsystem? Should we simply add a new API to the common clock
>>>> subsystem instead (and assume that reset and clock domains match 1:1).
>>>> Should this be implemented as part of the generic power management domains;
>>>> see include/linux/pm_domain.h instead?
>>>>
>>>
>>> Hi Stephen,
>>>
>>> I'm not sure a "reset subsystem" is necessary, but I also do not like
>>> using clocks as the keys for IP reset.
>>
>> I'm not sure what you're suggesting as an alternative to a reset
>> subsystem (or API if you want something that sounds smaller!) :-)
> 
> My point was that I do not know if a new subsystem is necessary or not.
> Your suggestion to "simply add a new API to the common clock subsystem"
> is an example of an alternative to a whole new subsystem.  However I
> instinctively feel that the clock api is not the right place for
> reseting devices.

driver/base/power is about the only related place I can think of given a
quick look. However, in a similar way to clocks, I don't think there's
necessarily a 1:1 relationship between power domains and reset domains
either, so driver/base/power doesn't feel like a good fit in just the
same way that drivers/clk doesn't.

I wonder if a drivers/base/reset/ or drivers/base/reset.c would be
appropriate?

>>> I think it is more common to map IPs to struct device, no?
>>
>> It is indeed probably common that there's a 1:1 mapping between IP
>> blocks and struct device. However, I'm sure there are plenty of
>> counter-examples; IP blocks with multiple reset domains (hence struct
>> devices that encompass multiple reset domains, or reset domains that
>> encompass multiple struct devices), just as there are many examples of
>> non-1:1 mappings between struct device and struct clk.
> 
> In OMAP code we handle IP resets through the hwmod code and I prefer
> that IP-centric approach to associating IP resets with a clock node.
> Perhaps the hwmod approach could serve as inspiration for a new generic
> way to reset modules.

OK, I'm not even slightly familiar with the hwmod code, but I keep
hearing about it, so I'll go take a quick look.
