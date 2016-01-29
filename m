From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Fri, 29 Jan 2016 13:17:10 +0900
Message-ID: <CA+Ln22HCH5u=m+2KD3G1Pk-8dKfmSB8yUkdXoHXt8o3jvbSgGQ@mail.gmail.com>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com>
	<alpine.DEB.2.11.1601262142450.3886@nanos>
	<20160128095955.GA12884@e106950-lin.cambridge.arm.com>
	<alpine.DEB.2.11.1601281116310.3886@nanos>
	<20160128111041.GB12884@e106950-lin.cambridge.arm.com>
	<alpine.DEB.2.11.1601281238110.3886@nanos>
	<CAL_JsqLTFu18a-Mj_XPZBpcFkD+R-uiK70yLnCT27np2YK6_ag@mail.gmail.com>
	<alpine.DEB.2.11.1601282105150.3886@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1601282105150.3886@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

2016-01-29 5:06 GMT+09:00 Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>:
> On Thu, 28 Jan 2016, Rob Herring wrote:
>> On Thu, Jan 28, 2016 at 5:49 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>> > I've cc'ed the author and the device tree folks. Perhaps are they able to
>> > explain what this commit tries to 'fix'.
>>
>> It's certainly not clear what driver was being fixed. I think the
>> intention was to provide the trigger flags from the DT to drivers in a
>> standard, non-DT specific way. The implementation of it certainly
>> seems convoluted. The usecase I can think of is drivers may need the
>> trigger information for cases where the device can support different
>> trigger modes/polarity. The DT says which trigger mode to use and the
>> device and irqchip need to be programmed to match. IIRC, SMSC ethernet
>> chips frequently used on ARM boards do this.
>
> I can see that the driver wants this information, but why would one feed that
> back into request_irq() when the interrupt was already configured by DT.
>

I think Rob already explained the original intention of the patch in
question I sent quite long time ago.

To clarify, I have to add that passing interrupt trigger in resource
flags is not something specific for DT, but it is the general way used
for platform devices and dating times even before DT adoption on ARM
(=== wide spread DT adoption). The key point here is that on pre-DT
systems, the interrupt would not be already configured by DT code and
that's why you have to pass the trigger flags to request_irq().

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
