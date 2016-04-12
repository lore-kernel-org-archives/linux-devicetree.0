From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] DT: arm,gic-v3: Documment PPI partition support
Date: Tue, 12 Apr 2016 13:31:23 -0500
Message-ID: <CAL_Jsq+ddsVLjd_84Sw-ijKESeurVBy4v8vw_vvr5VrrObgqUg@mail.gmail.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
 <1460365075-7316-6-git-send-email-marc.zyngier@arm.com> <20160412162937.GA25932@rob-hp-laptop>
 <570D2585.5070801@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570D2585.5070801-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 11:42 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Rob,
>
> On 12/04/16 17:29, Rob Herring wrote:
>> On Mon, Apr 11, 2016 at 09:57:55AM +0100, Marc Zyngier wrote:
>>> Add a decription of the PPI partitioning support.
>>>
>>> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  .../bindings/interrupt-controller/arm,gic-v3.txt   | 34 ++++++++++++++++++++--
>>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>> index 007a5b4..4c29cda 100644
>>> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>> @@ -11,6 +11,8 @@ Main node required properties:
>>>  - interrupt-controller : Identifies the node as an interrupt controller
>>>  - #interrupt-cells : Specifies the number of cells needed to encode an
>>>    interrupt source. Must be a single cell with a value of at least 3.
>>> +  If the system requires describing PPI affinity, then the value must
>>> +  be at least 4.
>>
>> You're winning for cell count...
>
> Yeah, it feels like we aim at making people's life difficult...
>
>> One alternative that would save adding a cell and keep it contained
>> within would be just list the affinities in the GIC node in the form of
>> '<PPI#> <count> <cpu phandles>':
>>
>> ppi-affinity = <1 2 &cpu2 &cpu3>,
>>               <5 1 &cpu4>,
>>               ...
>
> But how would that work if you have two sets of CPUs (set-1=[cpu0,
> cpu1]; set-2=[cpu2, cpu3]), and for the same PPI, device A is connected
> to set-1 and device-B is connected to set-2?

Oh right. Need to take those h/w designers out back...

> You need a way to distinguish these two interrupts and so far, the only
> way I've found is to reference the affinity in the interrupt specifier.
>
> That being said, I'm definitely open to suggestions on how to describe
> this in a better way.

In that case, I think it looks fine.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
