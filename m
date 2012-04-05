From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Thu, 05 Apr 2012 13:59:56 +0100
Message-ID: <4F7D974C.9050506@arm.com>
References: <1333384217-13441-1-git-send-email-marc.zyngier@arm.com>
 <4F7AC138.9020308@citrix.com> <4F7AC8A8.9020606@arm.com>
 <20120403153538.0D1B83E044A@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120403153538.0D1B83E044A@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, David Vrabel <david.vrabel@citrix.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 03/04/12 16:35, Grant Likely wrote:

Hi Grant,

> On Tue, 03 Apr 2012 10:53:44 +0100, Marc Zyngier <marc.zyngier@arm.com> wrote:
>> On 03/04/12 10:22, David Vrabel wrote:
>>
>> Hi David,
>>
>>> On 02/04/12 17:30, Marc Zyngier wrote:
>>>> The GICv2 can have virtualization extension support, consisting
>>>> of an additional set of registers and interrupts. Add the necessary
>>>> binding to the GIC DT documentation.
>>>
>>> The Xen hypervisor's device tree support is very much incomplete so I've
>>> not looked into this is much detail.
>>>
>>> Would it make more sense to extend the existing gic binding with the the
>>> additional information rather than adding a new node?
>>
>> I'm actually torn between the two approaches. On one side, the VGIC is
>> part of the GIC spec, hence should be part of the GIC node. On the other
>> hand, it is logically handled by a different piece of software (the
>> hypervisor), and would normally be probed separately. Having a separate
>> node makes the probing more sensible.
> 
> Don't get too hung up on the software side of things.  Describe it in
> a way that makes sense for the hardware.  There is lots of precidence
> for two hunks of software initializating from the same node; either by
> probe kicking off two init hooks, or by early init code going looking
> for the node manually.

What I'm trying to avoid is a royal mess in the future if we get some
other extension to the GIC.

Let's say we implement the following:

	gic: interrupt-controller@2c001000 {
		compatible = "arm,cortex-a15-gic";
		#interrupt-cells = <3>;
		#address-cells = <1>;
		interrupt-controller;
		reg = <0x2c001000 0x1000>,
		      <0x2c002000 0x100>,
		      <0x2c004000 0x2000>,
		      <0x2c006000 0x2000>;
		interrupts = <1 9 0xf04>;
	};

It's all fine (the two last regions and the interrupt are for VGIC),
until someone comes up with extension FOO which requires two new regions
and am interrupt. It is then impossible to distinguish between the two,
short of adding more attributes.

How about this?

	gic: interrupt-controller@2c001000 {
		compatible = "arm,cortex-a15-gic";
		#interrupt-cells = <3>;
		#address-cells = <1>;
		#size-cells = <1>;
		interrupt-controller;
		reg = <0x2c001000 0x1000>,
		      <0x2c002000 0x100>;

		vgic@2c004000 {
			compatible = "arm,cortex-a15-vgic", "arm,vgic";
			reg = <0x2c004000 0x2000>,
			      <0x2c006000 0x2000>;
			interrupts = <1 9 0xf04>;
		};
	};

It cleanly separate the extension from the core GIC, and still make it
part of the GIC node.

What do you think?

	M.
-- 
Jazz is not dead. It just smells funny...
