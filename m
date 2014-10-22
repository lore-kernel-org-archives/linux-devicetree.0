From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan portal(s)
Date: Wed, 22 Oct 2014 15:04:54 -0500
Message-ID: <54480DE6.4090604@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
 <20141022142931.GA4010@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141022142931.GA4010@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "scottwood@freescale.com" <scottwood@Freescale.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@Freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,


Thanks for having a look at this

On 10/22/2014 09:29 AM, Mark Rutland wrote:
> On Wed, Oct 22, 2014 at 03:09:30PM +0100, Emil Medve wrote:
>> Portals are used by software running on processor cores, accelerators and
>> network interfaces to communicate with the BMan
> 
> What exactly is a portal?
> 
> Is it a region of shared memory? A device?

In a nutshell a (software, i.e. processor core accessible) portal is a
memory mapped interface to the B/QMan that allows low latency, lock-less
interaction by logically separated units of software. The original
intent was to have one affine portal per core. As of now we're
sprinkling portals to use from various (core affine) contexts:
hypervisor, guests, user-space, containers, etc.

I'll make the definition more palatable in the next round

> I only received emails 2 and 3 of this series, so I'm lacking the
> context necessary to understand the bindings.

Some bubble in the pipe... As of now they all seem to have hit the
e-mail list(s), patchwork and hopefully your Inbox

>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
>> Change-Id: I6d245ffc14ba3d0e91d403ac7c3b91b75a9e6a95
>> ---
>>  .../bindings/powerpc/fsl/bman-portals.txt          | 50 ++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
>>
>> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
>> new file mode 100644
>> index 0000000..40e607e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
>> @@ -0,0 +1,50 @@
>> +QorIQ DPAA Buffer Manager Portals Device Tree Binding
>> +
>> +Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
>> +
>> +CONTENTS
>> +
>> +	- BMan Portal
>> +	- Example
>> +
>> +NOTE:	The bindings described in this document are preliminary and subject to
>> +	change
> 
> While we've tried that elsewhere, unstable DT bindings have been shown
> to be a major source of pain.

Agreed

> I'd feel rather uncomfortable accepting a
> binding that we already believe to be insufficient to describe the
> hardware.
> 
> What do you expect to change?

Related bindings seem incomplete. As such, the PAMU binding (pamu.txt)
covers incompletely a dynamic LIODN assignment/programming model. The
current driver uses a static assignment scheme that the binding needs to
include. I also suspect that once the driver starts supporting the
dynamic LIODN assignment/programming we might find some wrinkles

>> +
>> +BMan Portal Node
>> +
>> +PROPERTIES
>> +
>> +- compatible
>> +	Usage:		Required
>> +	Value type:	<stringlist>
>> +	Definition:	Must include "fsl,bman-portal-<hardware revision>"
>> +			May include "fsl,<SoC>-bman-portal" or "fsl,bman-portal"
>> +
>> +- reg
>> +	Usage:		Required
>> +	Value type:	<prop-encoded-array>
>> +	Definition:	Two regions. The first is the cache-enabled region of
>> +			the portal. The second is the cache-inhibited region of
>> +			the portal
>> +
>> +EXAMPLE
>> +
>> +The example below shows a (P4080) BMan portals container/bus node with two portals
> 
> Is there any particular reason to place these under a simple-bus?

I think they fit the ePAPR definition for simple-bus container. They can
be accessed directly and can be used independently. What are you suggesting?

>> +
>> +	bman-portals@ff4000000 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		compatible = "simple-bus";
>> +		ranges = <0 0xf 0xf4000000 0x200000>;
>> +
>> +		bman-portal@0 {
>> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
>> +			reg = <0x0 0x4000 0x100000 0x1000>;
> 
> It would be easier to read is each entry had its own set of brackets.
> Initially this looked to me like a single 64-bit address/size pair.

Something like <>, <>? It doesn't seem widely used but I agree is more
readable. I can include it in the the next spin

>> +			interrupts = <105 2 0 0>;
>> +		};
> 
> Given the description above, surely you need to know what the portal is
> used for? Or is that queried from the portal?

We don't need/want to include such information in the DT. Portals are
"allocated" dynamically and used by the respective context


Cheers,


> Thanks,
> Mark.
> 
>> +		bman-portal@4000 {
>> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
>> +			reg = <0x4000 0x4000 0x101000 0x1000>;
>> +			interrupts = <107 2 0 0>;
>> +		};
>> +	};
>> -- 
>> 2.1.2
