From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Tue, 03 Apr 2012 10:53:44 +0100
Message-ID: <4F7AC8A8.9020606@arm.com>
References: <1333384217-13441-1-git-send-email-marc.zyngier@arm.com>
 <4F7AC138.9020308@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F7AC138.9020308@citrix.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Vrabel <david.vrabel@citrix.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 03/04/12 10:22, David Vrabel wrote:

Hi David,

> On 02/04/12 17:30, Marc Zyngier wrote:
>> The GICv2 can have virtualization extension support, consisting
>> of an additional set of registers and interrupts. Add the necessary
>> binding to the GIC DT documentation.
> 
> The Xen hypervisor's device tree support is very much incomplete so I've
> not looked into this is much detail.
> 
> Would it make more sense to extend the existing gic binding with the the
> additional information rather than adding a new node?

I'm actually torn between the two approaches. On one side, the VGIC is
part of the GIC spec, hence should be part of the GIC node. On the other
hand, it is logically handled by a different piece of software (the
hypervisor), and would normally be probed separately. Having a separate
node makes the probing more sensible.

It also makes it easier to dynamically filter out the VGIC node if you
want to derive the host DT for the guest (assuming you're emulating the
same platform).

But again, I have no strong feeling about it.

	M.
-- 
Jazz is not dead. It just smells funny...
