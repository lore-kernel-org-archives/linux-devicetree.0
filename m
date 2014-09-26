From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree bindings
Date: Fri, 26 Sep 2014 13:26:09 -0500
Message-ID: <CAL_JsqK2bqsbjEf2OngL2=Xr8t0AUobb_bd43BV4t9iXY-n6KQ@mail.gmail.com>
References: <1411573068-12952-1-git-send-email-rric@kernel.org>
 <1411573068-12952-4-git-send-email-rric@kernel.org> <3082935.e3X4GsVUDn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3082935.e3X4GsVUDn@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Robert Richter <rric@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Sunil Goutham <sgoutham@cavium.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 11:06 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 24 September 2014 17:37:45 Robert Richter wrote:
>>
>> +       pcie0@0x8480,00000000 {
>
> The name should be pci, not pci0.

And the address should be "@848000000000". There was some confusion
about when the comma should be used and it is only if you have things
like PCI bus, device, function for the addressing.


>
>> +               compatible = "cavium,thunder-pcie";

A bit too generic as many of the Cavium bindings have been.

Rob
