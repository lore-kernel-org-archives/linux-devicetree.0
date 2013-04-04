From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFCv1 00/11] MSI support for Marvell EBU PCIe driver
Date: Thu, 4 Apr 2013 11:29:08 +0200
Message-ID: <20130404112908.24c25c9a@skate>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<20130404091639.GA2245@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20130404091639.GA2245@localhost>
Sender: linux-pci-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Thu, 4 Apr 2013 06:16:40 -0300, Ezequiel Garcia wrote:

> Given the IRQ controller move to drivers/irqchip is independent of MSI
> work, and that we've already agreed this move is fine (Arnd has acked
> patch 2), may I suggest that you resend these three first patches
> (and perhaps the fourth?) as a separate patchset to be included in v3.10.
> 
> This has the advantage that further development on IRQ controller can be
> done directly on its proper place, and also the MSI patchset can be
> simplified.
> 
> What do you think?

Sounds like a good idea. I'll cook a patch set later today and I'll
send it.

Thanks for the suggestion!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
