From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC PATCHv1 2/5] bus: mvebu: fix mistake in PCIe window target
 attribute for Kirkwood
Date: Wed, 3 Apr 2013 13:05:52 +0200
Message-ID: <20130403130552.0c28ea34@skate>
References: <1364407504-13524-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1364407504-13524-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<20130403125247.5914a862@skate>
	<20130403105757.GV13280@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20130403105757.GV13280@titan.lakedaemon.net>
Sender: linux-pci-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Olof Johansson <olof@lixom.net>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Andrew Murray <andrew.murray@arm.com>, Tawfik Bayouk <tawfik@marvell.com>, linux-arm-kernel@lists.infradead.org, Mitch Bradley <wmb@firmworks.com>
List-Id: devicetree@vger.kernel.org

Dear Jason Cooper,

On Wed, 3 Apr 2013 06:57:57 -0400, Jason Cooper wrote:

> Thanks for pointing this out.  I'll put it in mvebu/drivers as you
> suggested.  I'll need to rebase mvebu/soc on it.  But I haven't done the
> PR yet, so not a big deal.

Ok, thanks. I'll finalize the cleanup of the kirkwood PCIe branch in
order to be able to submit a version that hopefully should be
acceptable.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
