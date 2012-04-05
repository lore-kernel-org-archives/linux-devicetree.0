From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Thu, 05 Apr 2012 09:25:35 -0500
Message-ID: <4F7DAB5F.7030902@gmail.com>
References: <1333384217-13441-1-git-send-email-marc.zyngier@arm.com>
 <4F7AC138.9020308@citrix.com> <4F7AC8A8.9020606@arm.com>
 <20120403153538.0D1B83E044A@localhost> <4F7D974C.9050506@arm.com>
 <4F7D9F5A.9030709@gmail.com> <4F7DA71A.4020809@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F7DA71A.4020809-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/05/2012 09:07 AM, Marc Zyngier wrote:
> On 05/04/12 14:34, Rob Herring wrote:
>> On 04/05/2012 07:59 AM, Marc Zyngier wrote:
>>> On 03/04/12 16:35, Grant Likely wrote:
>>>
>>> Hi Grant,
>>>
>>>> On Tue, 03 Apr 2012 10:53:44 +0100, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
>>>>> On 03/04/12 10:22, David Vrabel wrote:
>>>>>
>>>>> Hi David,
>>>>>
>>>>>> On 02/04/12 17:30, Marc Zyngier wrote:
>>>>>>> The GICv2 can have virtualization extension support, consisting
>>>>>>> of an additional set of registers and interrupts. Add the necessary
>>>>>>> binding to the GIC DT documentation.
>>>>>>
>>>>>> The Xen hypervisor's device tree support is very much incomplete so I've
>>>>>> not looked into this is much detail.
>>>>>>
>>>>>> Would it make more sense to extend the existing gic binding with the the
>>>>>> additional information rather than adding a new node?
>>>>>
>>>>> I'm actually torn between the two approaches. On one side, the VGIC is
>>>>> part of the GIC spec, hence should be part of the GIC node. On the other
>>>>> hand, it is logically handled by a different piece of software (the
>>>>> hypervisor), and would normally be probed separately. Having a separate
>>>>> node makes the probing more sensible.
>>>>
>>>> Don't get too hung up on the software side of things.  Describe it in
>>>> a way that makes sense for the hardware.  There is lots of precidence
>>>> for two hunks of software initializating from the same node; either by
>>>> probe kicking off two init hooks, or by early init code going looking
>>>> for the node manually.
>>>
>>> What I'm trying to avoid is a royal mess in the future if we get some
>>> other extension to the GIC.
>>>
>>
>> But that would be a new compatible string as is this case.
> 
> Yes, probably.
> 
>>> Let's say we implement the following:
>>>
>>> 	gic: interrupt-controller@2c001000 {
>>> 		compatible = "arm,cortex-a15-gic";
>>> 		#interrupt-cells = <3>;
>>> 		#address-cells = <1>;
>>> 		interrupt-controller;
>>> 		reg = <0x2c001000 0x1000>,
>>> 		      <0x2c002000 0x100>,
>>> 		      <0x2c004000 0x2000>,
>>> 		      <0x2c006000 0x2000>;
>>> 		interrupts = <1 9 0xf04>;
>>
>> Does this work having an interrupt within the parent itself? Normally
>> this would be the connection to the next level up.
> 
> In this case we don't have an interrupt parent property, so the GIC is
> properly identified as the top-level interrupt controller. This is
> admittedly a bit fragile, and contradicts the current wording of the
> binding.
> 

Actually, you typically do have interrupt parent set in the next level
up if the gic is one the same bus or you globally set the parent. If the
parent is itself, the code treats this as the root controller.

>>> 	};
>>>
>>> It's all fine (the two last regions and the interrupt are for VGIC),
>>> until someone comes up with extension FOO which requires two new regions
>>> and am interrupt. It is then impossible to distinguish between the two,
>>> short of adding more attributes.
>>>
>>> How about this?
>>>
>>> 	gic: interrupt-controller@2c001000 {
>>> 		compatible = "arm,cortex-a15-gic";
>>> 		#interrupt-cells = <3>;
>>> 		#address-cells = <1>;
>>> 		#size-cells = <1>;
>>> 		interrupt-controller;
>>> 		reg = <0x2c001000 0x1000>,
>>> 		      <0x2c002000 0x100>;
>>>
>>> 		vgic@2c004000 {
>>> 			compatible = "arm,cortex-a15-vgic", "arm,vgic";
>>> 			reg = <0x2c004000 0x2000>,
>>> 			      <0x2c006000 0x2000>;
>>> 			interrupts = <1 9 0xf04>;
>>> 		};
>>> 	};
>>>
>>> It cleanly separate the extension from the core GIC, and still make it
>>> part of the GIC node.
>>>
>>> What do you think?
>>>
>>
>> I prefer the first option.
> 
> The first I posted (vgic node outside of the gic), or the one with
> everything in the same node?
> 

The first one here. I don't see any advantage of a separate node.

Rob
