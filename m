From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv6 10/17] arm: mvebu: add PCIe Device Tree informations for Armada 370
Date: Tue, 26 Mar 2013 20:50:12 +0000
Message-ID: <201303262050.12847.arnd@arndb.de>
References: <1364314719-1049-1-git-send-email-thomas.petazzoni@free-electrons.com> <20130326163421.GA30255@obsidianresearch.com> <20130326201654.GA7109@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20130326201654.GA7109@avionic-0098.mockup.avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Maen Suleiman <maen@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Thierry Reding wrote:
>                 pci@1,0 {
>                         device_type = "pci";
>                         assigned-addresses = <0x82000800 0 0x80000000 0 0x1000>;
>                         reg = <0x000800 0 0 0 0>;
>                         status = "disabled";
> 
>                         #address-cells = <3>;
>                         #size-cells = <2>;
> 
>                         nvidia,num-lanes = <2>;
>                 };

Shouldn't there be an empty ranges property in there as well?

	Arnd
