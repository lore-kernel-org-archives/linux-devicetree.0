From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Tue, 2 May 2017 09:13:00 -0500
Message-ID: <CAL_JsqK8rjvFW=LFb7==Qho-MHVew-O_vAJ+M6wcFJGfVD6r1A@mail.gmail.com>
References: <cover.1493125299.git.guillaume.tucker@collabora.com>
 <9349c8ae9091fbd93e9410f4cfae770ac850bf6b.1493125299.git.guillaume.tucker@collabora.com>
 <20170428192742.pu4v4layszr6z2ot@rob-hp-laptop> <60b3c062-d4bb-6502-61be-ada830cf58f7@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <60b3c062-d4bb-6502-61be-ada830cf58f7-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 2, 2017 at 6:23 AM, Guillaume Tucker
<guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> Hi Rob,
>
> On 28/04/17 20:27, Rob Herring wrote:
>>
>> On Tue, Apr 25, 2017 at 02:16:16PM +0100, Guillaume Tucker wrote:
>
>
>>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>>> b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>>> new file mode 100644
>>> index 000000000000..547ddeceb498
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>>> @@ -0,0 +1,82 @@
>>> +ARM Mali Midgard GPU
>>> +====================
>>> +
>>> +Required properties:
>>> +
>>> +- compatible :
>>> +  * Must be one of the following:
>>> +    + "arm,mali-t60x"
>>> +    + "arm,mali-t62x"
>>
>>
>> Don't use wildcards.
>
>
> Sure, old habits die hard...  I'll fix it in patch v5.
>
>>> +    + "arm,mali-t720"
>>> +    + "arm,mali-t760"
>>> +    + "arm,mali-t820"
>>> +    + "arm,mali-t830"
>>> +    + "arm,mali-t860"
>>> +    + "arm,mali-t880"
>>> +  * And, optionally, one of the vendor specific compatible:
>>
>>
>> IMO, these should not be optional.
>
>
> Well, vendor compatible strings are clearly optional for the
> Utgard GPU series for which the bindings docs were recently
> merged.  It seems that whether these should be optional or not,
> the documentation should be consistent between at least all
> similar types of devices like Midgard and Utgard GPUs.  They have
> different architectures but from a device tree point of view,
> they both have the same kind of SoC-specific integration (clocks,
> irqs, regulators...).

Clocks should not vary by SoC. There is often variation because clocks
get driven by same source or are not s/w controlled, but really there
should not be that variation. I noticed Utgard has 2 clocks. So is
Midgard really just 1 clock? The DT should have all the clocks listed
in the TRMs.

> So was this was overlooked in the Utgard case and should it
> ideally be fixed there as well as non-optional?  Or, is it OK to
> keep these optional on a second thought?

Probably should be required in the Utgard case as well.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
