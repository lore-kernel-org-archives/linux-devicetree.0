From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: Re: [PATCH v2 7/9] PCI: dwc: Replace lower into upper case characters
Date: Mon, 9 Apr 2018 14:10:44 +0100
Message-ID: <c7aa4990-92ad-3e5e-de27-40df4f29f08b@synopsys.com>
References: <cover.1523266508.git.gustavo.pimentel@synopsys.com>
 <a28d463d04b198f51c64c1a7eb5b3f77da2d4ab9.1523266508.git.gustavo.pimentel@synopsys.com>
 <0dad6b43476c1a70944e3e7c245040243ddc2a04.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0dad6b43476c1a70944e3e7c245040243ddc2a04.camel@perches.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On 09/04/2018 11:25, Joe Perches wrote:
> On Mon, 2018-04-09 at 10:41 +0100, Gustavo Pimentel wrote:
>> Replaces lower into upper case characters in comments and debug printks.
>>
>> This is an attempt to keep the messages coherent within the designware
>> driver.
> 
> It'd be nice to make all the dwc drivers use the same
> message wording.
> 
> For instance:
> 
> drivers/pci/dwc/pci-keystone.c: dev_err(dev, "phy link never came up\n");
> drivers/pci/dwc/pcie-designware.c:      dev_err(pci->dev, "phy link never came up\n");
> drivers/pci/host/pcie-xilinx-nwl.c:     dev_err(dev, "PHY link never came up\n");

I also agree, I added a task to my backlog to fix that. However, this task
shouldn't be done in this patch series since it's a more broader task involving
many drivers and different maintainers. Agree?

> 

Regards,
Gustavo
