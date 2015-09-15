From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 6/6] PCI: generic: Allow bus default MSI controller to
 be specified.
Date: Tue, 15 Sep 2015 11:25:25 -0700
Message-ID: <55F86295.9030409@caviumnetworks.com>
References: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com> <1442013719-5001-7-git-send-email-ddaney.cavm@gmail.com> <20150915175327.GM31157@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150915175327.GM31157@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: David Daney <ddaney.cavm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, David Daney <david.daney@cavium.com>, lorenzo.pieralisi@arm.com, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

On 09/15/2015 10:53 AM, Will Deacon wrote:
> On Sat, Sep 12, 2015 at 12:21:59AM +0100, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> If the device tree node for the bus has a "msi-parent" property, use
>> that as the default MSI controller for devices on the bus.  Add device
>> tree binding documentation describing the new property.
>>
>> This allows the pci-host-generic driver to be used in systems with
>> multiple MSI controllers.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>   .../devicetree/bindings/pci/host-generic-pci.txt          |  5 +++++
>>   drivers/pci/host/pci-host-generic.c                       | 15 +++++++++++++--
>>   2 files changed, 18 insertions(+), 2 deletions(-)
>
> I don't think you need this anymore with 4.3-rc1. The core IRQ subsystem
> should take care of parsing and configuring the MSI parents.

I will re-test and see if I can make it work.

David Daney


>
> Will
>
