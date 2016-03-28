From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] pci: host: new driver for Marvell Armada 7K/8K PCIe controller
Date: Mon, 28 Mar 2016 23:21:57 +0200
Message-ID: <3196859.0zi20qjiKR@wuerfel>
References: <1459071058-18328-1-git-send-email-thomas.petazzoni@free-electrons.com> <1459071058-18328-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1459071058-18328-3-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Hanna Hawa <hannah@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sunday 27 March 2016 11:30:58 Thomas Petazzoni wrote:
> +       /* Wait until the link becomes active again */
> +       while (timeout) {
> +               if (armada8k_pcie_link_up(pp))
> +                       break;
> +               udelay(1);
> +               timeout--;
> +       }
> 

Why the busy-loop here?

Maybe just do a single msleep(1) here to wait for the link to
come up instead?

	Arnd
