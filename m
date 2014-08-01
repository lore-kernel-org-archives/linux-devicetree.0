From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 4/4 V3] irqchip: gicv2m: Add support for multiple MSI
 for ARM64 GICv2m
Date: Fri, 1 Aug 2014 09:36:51 -0500
Message-ID: <53DBA603.9030509@amd.com>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com>
	<1404947104-21345-5-git-send-email-suravee.suthikulpanit@amd.com>
 <87vbqej2rj.fsf@approximate.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <87vbqej2rj.fsf@approximate.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 7/30/2014 10:16 AM, Marc Zyngier wrote:
> Why do we need this complexity at all? Is there any case where we'd want
> to limit ourselves to a single vector for MSI?

I think the ARM64 GICv2m should not be the limitation for the devices 
multiple MSI if there is no real hardware/design limitation.

> arm64 is a new enough architecture so that we can expect all interrupt controllers to cope
> with that.

I am not sure if I understand this comment.

We are not forcing all interrupt controllers for ARM64 to handle 
multi-MSI.  They have the option to support if multi-MSI if they want 
to. I just think that we should not put the architectural limit here.

Thanks,

Suravee

