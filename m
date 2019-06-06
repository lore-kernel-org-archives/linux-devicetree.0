From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 6 Jun 2019 14:37:43 +0300
Message-ID: <71da083e-1a74-cf86-455d-260a34ee01fd@amazon.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
 <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, Borislav Petkov <bp@alien8.de>, "Herrenschmidt, Benjamin" <benh@amazon.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org


>> Disagree. The various drivers don't depend on each other.
>> I think we should keep the drivers separated as they are distinct and independent IP blocks.
> But they don't exist in isolation, they both depend on the integration-choices/firmware
> that makes up your platform.
>
> Other platforms may have exactly the same IP blocks, configured differently, or with
> different features enabled in firmware. This means we can't just probe the driver based on
> the presence of the IP block, we need to know the integration choices and firmware
> settings match what the driver requires.
>
> (Case in point, that A57 ECC support is optional, another A57 may not have it)
>
> Descriptions of what firmware did don't really belong in the DT. Its not a hardware property.
>
> This is why its better to probe this stuff based on the machine-compatible/platform-name,
> not the presence of the IP block in the DT.
>
>
> Will either of your separate drivers ever run alone? If they're probed from the same
> machine-compatible this won't happen.
>
>
> How does your memory controller report errors? Does it send back some data with an invalid
> checksum, or a specific poison/invalid flag? Will the cache report this as a cache error
> too, if its an extra signal, does the cache know what it is?
>
> All these are integration choices between the two IP blocks, done as separate drivers we
> don't have anywhere to store that information. Even if you don't care about this, making
> them separate drivers should only be done to make them usable on other platforms, where
> these choices may have been different.

James,

Thanks for the prompt responses.

 From our perspective, l1/l2 has nothing to do with the ddr memory 
controller.

Its right that they both use same edac subsystem but they are using 
totally different APIs of it.

We also even want to have separate control for enabling/disabling l1/l2 
edac vs memory controller edac.

Even from technical point-of-view L1/L2 UE collection method is totally 
different from collecting memory-controller UE. (CPU exception vs actual 
interrupts).

So there is less reason why to combine them vs giving each one its own 
file, e.g. al_mc_edac, al_l1_l2_edac (I even don't see why Hanna 
combined l1 and l2...)

As we don't have any technical relation between the two we would rather 
avoid this combination.

Also, Lets assume we have different setups with different memory 
controllers, having a dt binding to control the difference is super easy 
and flexible.

Would having a dedicated folder for amazon ease the move to separate files?

Thanks,

Talel.

>
> Thanks,
>
> James
