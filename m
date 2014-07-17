From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/4 V3] irqchip: gic: Introduce ARM GICv2m MSI(-X) support
Date: Thu, 17 Jul 2014 09:48:29 -0500
Message-ID: <53C7E23D.1050900@amd.com>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com>
 <20140717131854.GN13108@titan.lakedaemon.net>
 <20140717135534.GM30313@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140717135534.GM30313@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <Marc.Zyngier@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 7/17/2014 8:55 AM, Mark Rutland wrote:
> Hi Jason,
>
> On Thu, Jul 17, 2014 at 02:18:54PM +0100, Jason Cooper wrote:
>> On Wed, Jul 09, 2014 at 06:05:00PM -0500, suravee.suthikulpanit@amd.com wrote:
>>> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>>>
>>> This patch set introduces support for MSI(-X) in GICv2m specification,
>>> which is implemented in some variation of GIC400.
>>>
>>> This depends on and has been tested with the V7 of"Add support for PCI in AArch64"
>>> (https://lkml.org/lkml/2014/3/14/320).
>>>
>>> Changes in V3:
>>>      * Rebase to git://git.infradead.org/users/jcooper/linux.git irqchip/gic
>>>        (per Jason Cooper request)
>>>      * Misc fix/clean up per Mark Rutland comments
>>>      * Minor Clean up in the driver/irqchip/irq-gic-v2m.c: alloc_msi_irqs()
>>>      * Patch 4 is new to the series:
>>>          * Add ARM64-specific version arch_setup_msi_irqs() to allow support
>>>            for Multiple MSI.
>>>          * Add support for Multiple MSI for GICv2m.
>>>
>>> Suravee Suthikulpanit (4):
>>>    irqchip: gic: Add binding probe for ARM GIC400
>>>    irqchip: gic: Restructuring ARM GIC code
>>>    irqchip: gic: Add supports for ARM GICv2m MSI(-X)
>>>    irqchip: gicv2m: Add support for multiple MSI for ARM64 GICv2m
>>
>> Ok, patch #1 applied to irqchip/urgent.  Patches 2 and 3 applied to
>> irqchip/gic with irqchip/urgent merged in.  To facilitate
>> testing/merging, I've prepared an unsigned tag for you on the
>> irqchip/gic branch:
>
> I'm a little concerned that this is all going through for v3.17 without
> a {Reviewed,Acked}-by from Marc or anyone working with GIC{,v2m}.

> While his comments on v1 have been addressed, he has not had a chance to
> acknowledge the solutions. I appreciate Marc's holiday is unfortunately
> timed.
>
> I also have an open concern with the binding with regard to the
> orthogonality of GICV GICH and the MSI registers.

The MSI part is normally enabled from the optional "msi-controller" 
keyword. It should not really matter which compatible ID it uses.

Ooops. I noticed that was accidentally dropped the check for 
"msi-controller" in the gicv2m_of_init() function.  I'll send a follow 
up patch to fix this.

> Suravee, do you need this urgently for v3.17? I was under the impression
> that we wouldn't have full PCIe support by then.
>

PCI is the dependency for this patch to function.  So, it should be 
aligned with upstreaming of PCI patches.

Suravee
