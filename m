From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/2] gpio: davinci: Add keystone-k2g compatible
Date: Tue, 1 Aug 2017 11:42:49 +0530
Message-ID: <65ab0098-ef1b-3bec-1d2a-768e478fa413@ti.com>
References: <1501051524-5990-1-git-send-email-j-keerthy@ti.com>
 <5aa0d273-8e05-a5ff-7931-b9a94acade36@ti.com>
 <8021c424-460c-def4-3a67-ed760997193d@ti.com>
 <2eeaeea5-9476-8631-8680-7db3322151bf@ti.com>
 <da92fe60-d70b-6a37-6b88-2ac95dd67b6a@ti.com>
 <90337754-8670-6df7-5421-7100e31755b1@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90337754-8670-6df7-5421-7100e31755b1-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Monday 31 July 2017 07:14 PM, Keerthy wrote:
> 
> 
> On Wednesday 26 July 2017 07:50 PM, Suman Anna wrote:
>> On 07/26/2017 08:36 AM, Keerthy wrote:
>>>
>>> On Wednesday 26 July 2017 06:57 PM, Franklin S Cooper Jr wrote:
>>>>
>>>>
>>>> On 07/26/2017 08:00 AM, Suman Anna wrote:
>>>>> Hi Keerthy,
>>>>>
>>>>> On 07/26/2017 01:45 AM, Keerthy wrote:
>>>>>> The patch adds keystone-k2g compatible, specific properties and
>>>>>> an example.
>>>>
[...]
>>>>>
>>>>
>>>> What about power-domain property?
>>
>> The correct name is "power-domains".
>>
>>> Driver has no pm_runtime implemented yet.
>>
>> True, not yet, but this is in general a required property on K2G SoCs to
>> automatically enable clocks through runtime_pm. Clock properties on K2G
>> nodes should only be truly required if a driver is using clk API
>> (ideally to control optional clocks or for adjusting clock frequencies).
>> When the gpio-davinci driver gets updated to use pm_runtime, the clock
>> properties will be rendered obsolete for K2G.
>>
>> Rob,
>> Any suggestions on how we need to handle this? Should we be adding the
>> property now or later when we adapt the driver for runtime_pm? This
>> would be a common theme for K2G nodes that are reusing Davinci drivers.
>>
>> My take on this would be to add the property now, and mark the clock
>> properties obsolete when the driver gets converted.
> 

I don't think SoC wide properties are put into device specific binding
documentation, for example pinctrl bindings are not put into device
documentation.

> Rob,
> 
> Any comments on this?
> 

[...]

-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
