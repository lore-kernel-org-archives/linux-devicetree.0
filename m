From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] of: platform: Drop OF_POPULATED_BUS check from of_platform_notify()
Date: Thu, 8 Sep 2016 10:28:42 -0500
Message-ID: <CAL_Jsq+FedCOU_w4p+ouqjdDmxJ6dzW4Gq=8vnCx3TUk77-zwA@mail.gmail.com>
References: <11c8a7bd-142c-d016-e24b-34d1edbdb8cf@nokia.com>
 <CAL_JsqJWBXqs44vHu4XHAiZhOEghg9X=Q0fvUKHaCVCPnd7kVw@mail.gmail.com> <2e40cd48-35f0-1efa-ee17-566aa728e857@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2e40cd48-35f0-1efa-ee17-566aa728e857-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 9:26 AM, Alexander Sverdlin
<alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> On 08/09/16 16:17, Rob Herring wrote:
>>> The comment to OF_POPULATED_BUS says "of_platform_populate recursed to children
>>> > of this node". Consider the following structure:
>>> >
>>> >         ocp {
>>> >                 compatible = "simple-bus";
>>> >                 ranges;
>>> >                 ...
>>> >                 l4_wkup: l4_wkup@44c00000 {
>>> >                         compatible = "ti,am3-l4-wkup", "simple-bus";
>>> >                         ranges = <0 0x44c00000 0x280000>;
>>> >                         ...
>>> >                         wkup_m3: wkup_m3@100000 {
>>> >                                 compatible = "ti,am3352-wkup-m3";
>>> >                                 ...
>>> >                         }
>>> >                 }
>>> >         }
>>> >
>>> > If one DT overlay adds "ocp" node without children then of_platform_notify()
>>> > creates a platform device, but doesn't set OF_POPULATED_BUS. If second overlay
>>> > tries to populate children of "ocp" node, corresponding platform devices are
>>> > not instantiated because of check for OF_POPULATED_BUS flag. If the above
>>> > example structure is built of several overlays, of_platform_populate() is not
>>> > involved here at all, so maybe OF_POPULATED_BUS requirement is wrong.
>> Your example seems a bit made up. While you can craft base DTs and
>> overlays with any random split between them, I don't necessarily think
>> we want to support that. There will likely be cases which we say can
>> only be applied early in boot or we limit which nodes can be overlay
>> targets for overlays applied from userspace.
>
> Yes, I had to construct an example out of the well-known Beaglebone DT pieces,
> the real use case will only confuse the public.
>
> In general I don't understand why my example is so bizarre, it basically shows, you
> cannot apply an overlay above overlay: the devices will not be registered and actually
> because of the bogus check. Imagine the well known Beagle: you can construct a bone with
> whatever SPI/I2C bus controller. On top of it you can sandwich a board with I2C-driven
> GPIO extenders. Is it absolute unrealistic?

That sounds like a valid example, but that was not the example you
gave. I would expect that adding an I2C slave device is a working
usecase.

> There is full support of multilevel overlays. And just one bug preventing it from working
> properly. Do we really want it?

You're only asking if the hunk should be removed. The short answer is
I don't know just looking at this patch. Show me a real overlay that
is broken and this change fixes things. Or add a unit test that
demonstrates the problem. And I also need to know the change wouldn't
break other users.

I think there may be bigger problems here. The point of this flag is
to make depopulate calls only act on nodes that a prior populate call
acted on. If we populate the base tree, add an overlay, populate the
overlay nodes, we have no way to ensure that of_platform_depopulate
called on a parent node in the base DT would not descend into nodes
from an overlay. We probably need something better like an owner
(distinct from the struct device) assigned to each node and only the
owner can depopulate nodes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
