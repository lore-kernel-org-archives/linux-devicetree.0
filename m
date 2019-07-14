From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 4/8] PCI: Add quirk to disable MSI support for Amazon's
 Annapurna Labs host bridge
Date: Mon, 15 Jul 2019 08:54:00 +1000
Message-ID: <54a3e2de1baf2aab893ab6370f8f6ec0a83c45db.camel@kernel.crashing.org>
References: <20190710164519.17883-1-jonnyc@amazon.com>
         <20190710164519.17883-5-jonnyc@amazon.com>
         <20190712130419.GA46935@google.com>
         <2cac43401f0cf76acb645b98c6543204f12d5c05.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2cac43401f0cf76acb645b98c6543204f12d5c05.camel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chocron, Jonathan" <jonnyc@amazon.com>, "helgaas@kernel.org" <helgaas@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2019-07-14 at 15:09 +0000, Chocron, Jonathan wrote:
> > s/host bridge/Root Port/, if I understand correctly.
> > 
> 
> Ack.
> 
> BTW, what is the main difference between the 2 terms, since they seem
> to be (mistakenly?) used interchangeably?

The host bridge is the parent of the root port. You can have several
root ports under a host bridge in fact. They tend to be part of the
same silicon and somewhat intimately linked but they are distinct
logical entities. The root port appears as a PCIe p2p bridge sitting on
the top level bus provided by the host bridge. The Host Bridge doesn't
have to have a representation in config space (it sometimes does
historically, but as a sibling of the devices on that top level bus. In
PCIe land, these are chipset built-in devices).

Ben.
