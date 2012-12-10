From: Michal Simek <monstr@monstr.eu>
Subject: Re: pci and pcie device-tree binding - range No cells
Date: Mon, 10 Dec 2012 17:05:13 +0100
Message-ID: <50C60839.70603@monstr.eu>
References: <50C5D387.90908@monstr.eu> <50C5F11D.9060006@gmail.com> <50C5FA3E.9030303@monstr.eu> <50C5FE0F.3050108@gmail.com> <50C601B6.2080107@monstr.eu> <AE90C24D6B3A694183C094C60CF0A2F6026B70E7@saturn3.aculab.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <AE90C24D6B3A694183C094C60CF0A2F6026B70E7@saturn3.aculab.com>
Sender: linux-pci-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>
Cc: Rob Herring <robherring2@gmail.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On 12/10/2012 04:52 PM, David Laight wrote:
>> Does it mean that pci is supposed be always 64 bit wide?
>> And there is no option to have just 32bit values.
>
> I certainly believe that all PCIe (not PCI) transfers are
> nominally multiples of 64bit data.

And PCI? That powerpc/pci-common code was designed for PCI
and microblaze also used it for PCI.

CC: Thomas: I think it will be interesting to see this discussion
because you are using size-cell/address-cells equal 1.
http://www.spinics.net/lists/arm-kernel/msg211839.html

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
