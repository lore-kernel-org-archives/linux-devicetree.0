From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v2 2/2] pci, pcie-thunder-pem: Add PCIe host driver for
 ThunderX processors.
Date: Mon, 4 Jan 2016 10:18:48 -0800
Message-ID: <568AB788.6050605@caviumnetworks.com>
References: <1450827832-3294-1-git-send-email-ddaney.cavm@gmail.com>
 <1450827832-3294-3-git-send-email-ddaney.cavm@gmail.com>
 <20151229203717.GA21072@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151229203717.GA21072@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, David Daney <david.daney@cavium.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, David Daney <ddaney.cavm@gmail.com>, Kumar Gala <galak@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12/29/2015 12:37 PM, Rob Herring wrote:
> On Tue, Dec 22, 2015 at 03:43:52PM -0800, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> Some Cavium ThunderX processors require quirky access methods for the
>> config space of the PCIe bridge.  Add a driver to provide these config
>> space accessor functions.  The pci-host-common code is used to
>> configure the PCI machinery.
>
> Same comments again...

Yes, I think your initial reply and my v2 must have crossed in 
mid-flight.  Then I was on holiday, but now I can respond...

>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>   .../devicetree/bindings/pci/pcie-thunder-pem.txt   |  43 ++++
>>   drivers/pci/host/Kconfig                           |   7 +
>>   drivers/pci/host/Makefile                          |   1 +
>>   drivers/pci/host/pcie-thunder-pem.c                | 283 +++++++++++++++++++++
>>   4 files changed, 334 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/pcie-thunder-pem.txt
>>   create mode 100644 drivers/pci/host/pcie-thunder-pem.c
>>
>> diff --git a/Documentation/devicetree/bindings/pci/pcie-thunder-pem.txt b/Documentation/devicetree/bindings/pci/pcie-thunder-pem.txt
>> new file mode 100644
>> index 0000000..52f56b3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/pcie-thunder-pem.txt
>> @@ -0,0 +1,43 @@
>> +* ThunderX PEM PCIe host controller
>> +
>> +Firmware-initialized PCIe host controller found on some Cavium
>> +ThunderX processors.
>> +
>> +The properties and their meanings are identical to those described in
>> +host-generic-pci.txt except as listed below.
>> +
>> +Properties of the host controller node that differ from
>> +host-generic-pci.txt:
>> +
>> +- compatible     : Must be "cavium,pci-host-thunder-pem"
>
> pcie rather than pci?

Technically it is a PCI host controller at the root, and doesn't become 
PCIe until we traverse a PCIe RC bridge,  Because of this, and also 
because there is deployed firmware supplying this compatible string, I 
would like to keep the name as is.

If you really want consistency, we could rename the driver (and this 
binding description file) to be pci-thunder-pem.

>
>> +
>> +- reg            : Two entries: First the configuration space for down
>> +                   stream devices base address and size, as accessed
>> +                   from the parent bus. Second, the register bank of
>> +                   the PEM device PCIe bridge.
>> +
>> +Example:
>> +
>> +    pem2 {
>
> pcie-controller@... instead of pem2.

That is purely cosmetic, as the names are not used for anything.  I can 
change it as you suggest.

[...]

Thanks,
David Daney
