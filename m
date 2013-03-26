From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFCv1 07/11] irqchip: armada-370-xp: add MSI support to interrupt controller driver
Date: Tue, 26 Mar 2013 17:07:41 +0000
Message-ID: <201303261707.41563.arnd@arndb.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com> <1364316746-8702-8-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1364316746-8702-8-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Thomas Petazzoni wrote:
> +              mpic: main-intc@d0020000 {
> +                    #interrupt-cells = <1>;
> +                    interrupt-controller;
> +              };
> +
> +              msi: msi-intc@d0020000 {
> +                    #interrupt-cells = <1>;
> +                    interrupt-controller;
> +                    marvell,doorbell = <0xd0020a04>;
> +              };

I think the @d0020000 part needs to be removed for the nodes that
have no reg property.

I think I did not follow the entire discussion. What has led to having
two subnodes in the end, rather than a single node like this?


       interrupt-controller@d0020000 {
              compatible = "marvell,mpic";
              #interrupt-cells = <1>;
              #msi-cells = <1>;
              #address-cells = <1>;
              #size-cells = <1>;
              interrupt-controller;
              msi-controller;
              reg = <0xd0020a00 0x1d0>,
                     <0xd0021070 0x58>;
              marvell,doorbell = <0xd0020a04>;
       };


	Arnd
