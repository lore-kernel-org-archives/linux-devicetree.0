From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2] DT: net: document Ethernet bindings in one place
Date: Wed, 29 Jan 2014 10:16:48 -0600
Message-ID: <CAL_JsqLJrS2w0idwpi0Ar4RyuZ050sb0eYVyzM1HE4df4FxdZQ@mail.gmail.com>
References: <201401280150.32456.sergei.shtylyov@cogentembedded.com>
	<CAL_JsqLH6j=eGPr53myATQ+ySwr4P1y7Lnvqa9Y+-YAqqWa_FA@mail.gmail.com>
	<52E7D31A.4090107@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52E7D31A.4090107@cogentembedded.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 28, 2014 at 9:56 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 01/28/2014 04:38 PM, Rob Herring wrote:
>
>>> This patch is an attempt to gather the Ethernet related bindings in one
>>> file,
>>> like it's done in the MMC and some other subsystems. It should save some
>>> of
>>> the trouble of documenting several properties over and over in each
>>> binding
>>> document, instead only making reference to the main file.

[snip]

>>>   - compatible: should be "allwinner,sun4i-emac".
>>>   - reg: address and length of the register set for the device.
>>>   - interrupts: interrupt for the device
>>> -- phy: A phandle to a phy node defining the PHY address (as the reg
>>> -  property, a single integer).
>>> +- phy: see ethernet.txt file in the same directory.
>>>   - clocks: A phandle to the reference clock for this device
>>>
>>>   Optional properties:
>>> -- (local-)mac-address: mac address to be used by this driver
>>> +- [local-]mac-address: see ethernet.txt file in the same directory
>
>> Sorry, but I meant you should just have a single statement like:
>
>> This binding uses standard ethernet properties defined in ethernet.txt.
>
>    This way it won't be clear which of the properties are used and which are
> not, no?

You're right. For the phy properties we need to specify which ones are
used. This could be done only for bindings using the not recommended
properties.

For optional properties like local-mac-address, I don't think these
need to be listed. They can be used for all devices and whether or not
a given Linux driver supports using the property is not really the
concern of the binding documentation. An exception could be a device
that requires a optional property (i.e. a NIC with no eeprom to store
a MAC address).

Rob
