From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 15:06:52 +0100
Message-ID: <7badefae-a952-7839-0bfe-dcd09ea1204f@prevas.dk>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <58297576-cc32-819d-c6b3-7d1355095482@prevas.dk>
 <5117875.4tMaEC1223@ws-stein> <2475814.YIHTfursNv@ws-stein>
 <42019fb5-393a-08b0-924d-bf1a97e078fe@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42019fb5-393a-08b0-924d-bf1a97e078fe@prevas.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-12-11 14:45, Rasmus Villemoes wrote:
> On 2017-12-11 11:02, Alexander Stein wrote:
> 
>> Oh, and what is the content of register SCFG_SCFGREVCR?
> 
> Good point. On my board it's 0xffffffff, set even before U-boot starts,
> and lots board support code in U-boot expects this. I can't immediately
> find examples in the linux source code that actually writes to the scfg,

Not a write, but we do already implicitly assume SCFG_SCFGREVCR is set
to all-ones: In drivers/pci/dwc/pci-layerscape.c, bits which are
numbered 6-11 in the reference manual are extracted with a regmap_read()
followed by a left-shift by 20 and mask with 0x3f. That's consistent
with me setting bit 0 (reference manual enumeration) using 1U<<31.

Rasmus
