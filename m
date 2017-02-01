From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: r8a7791: link DU to VSPDs
Date: Wed, 1 Feb 2017 21:01:01 +0900
Message-ID: <CANqRtoTpsMix30+ESO-bEdaBM8H_9eTOLuoWShQABhmgJk23EA@mail.gmail.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com> <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
 <4ae454ad-296c-dec9-27e9-fd050333737f@cogentembedded.com> <CANqRtoSQTa0fHJSwAHbN3hXSZ=m1kuR2GsUWE5ojN5AN-9i6Bw@mail.gmail.com>
 <4bf0b27c-9641-391d-fc05-8cdc20ce4ec3@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4bf0b27c-9641-391d-fc05-8cdc20ce4ec3-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: "Simon Horman [Horms]" <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Feb 1, 2017 at 8:40 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 2/1/2017 2:13 PM, Magnus Damm wrote:
>
>>>> Add the "vsps" property to the DU device node in order to link this node
>>>> to
>>>> the VSPD nodes.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>>>
>>>> ---
>>>> Changes in version 2:
>>>> - rebased the patch.
>>>>
>>>> This patch is against the 'renesas-devel-20170125-v4.10-rc5' of Simon
>>>> Horman's
>>>> 'renesas.git' repo.  It's  only meaningful if the DRM driver patches
>>>> I've
>>>> just
>>>> posted are applied.
>>>
>>>
>>>
>>>    Forgot to note that without this patch the DU driver fails to link to
>>> VSPD and probe correctly, so there's no video signal. So it makes sense
>>> to
>>> apply before the DU driver patch (once it's ACKed for merge)...
>>
>>
>> Doesn't that translate to breaking the DT ABI? Is there someway we can
>> avoid doing that?
>
>
>    It doesn't -- if this patch is merged ahead of the DU patches.

Perhaps I'm misunderstanding, but if you require a DTS patch to be
merged before a driver change then doesn't this mean that older DTBs
will stop working with newer kernels and the user is forced to update
the DTB to avoid breakage?

It would be nice if older DTBs could keep on working as before and the
DU driver modification would work both with connected VSPs and also
keep on working as before in case the VSP connection is not present in
DT.

Cheers,

/ magnus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
