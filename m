From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: Add LEGO MINDSTORTMS EV3 dts
Date: Tue, 25 Oct 2016 16:28:02 +0530
Message-ID: <0b7cf7a1-e234-2868-dfde-347c92c23829@ti.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-6-git-send-email-david@lechnology.com>
 <b0022fad-a96e-86d4-71ba-2b803e5421fe@ti.com>
 <1593441f-d147-4c91-8aab-8622dd8ced19@lechnology.com>
 <b6cd3c47-0df8-266a-2b8d-13c82062b647@lechnology.com>
 <84648cb0-f1fa-d88b-bac2-79208af01ca6@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <84648cb0-f1fa-d88b-bac2-79208af01ca6-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 25 October 2016 02:50 AM, David Lechner wrote:
> On 10/24/2016 02:50 PM, David Lechner wrote:
>> On 10/24/2016 10:50 AM, David Lechner wrote:
>>> On 10/24/2016 06:58 AM, Sekhar Nori wrote:
>>>> On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
>>>>
>>>>> +&ehrpwm1 {
>>>>> +    status = "disabled";
>>>>
>>>> Hmm, disabled? Can you add this node when you actually use it?
>>>
>>> Not sure why I have this disabled. Like the gpios, the pwms can be used
>>> via sysfs, so I would like to leave them.
>>>
>>
>> Now I remember why these are disabled. The clock matching is broken.
>> Only the first ehrpwm and the first ecap get clocks. The others fail.
>>
>> I can change these to "okay". It will just result in a kernel error
>> message until the clocks are fixed.
>>
> 
> correction: it is not the clocks that are broken. it is the device names.
> 
> In  arch/arm/mach-davinci/da8xx-dt.c, we have...
> 
> 
>     OF_DEV_AUXDATA("ti,da850-ehrpwm", 0x01f00000, "ehrpwm", NULL),
>     OF_DEV_AUXDATA("ti,da850-ehrpwm", 0x01f02000, "ehrpwm", NULL),
>     OF_DEV_AUXDATA("ti,da850-ecap", 0x01f06000, "ecap", NULL),
>     OF_DEV_AUXDATA("ti,da850-ecap", 0x01f07000, "ecap", NULL),
>     OF_DEV_AUXDATA("ti,da850-ecap", 0x01f08000, "ecap", NULL),
> 
> 
> Which causes each device to have the same device node name. This causes
> sysfs errors because it is trying to register a second device at the
> same sysfs path.
> 
> If you change the names here, then the device do not work because the
> clock lookup fails.

Yeah, this is incorrect (I should have caught it in review). The device
id should have been present in the lookup. Can you fix auxdata and clock
lookup too and send a separate patch? Its probably a v4.9-rc candidate.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
