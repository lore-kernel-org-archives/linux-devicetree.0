From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: altera: Allow building as module
Date: Tue, 4 Jun 2019 08:18:48 -0500
Message-ID: <20190604131848.GA40122@google.com>
References: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 12:57:14PM +0800, Ley Foon Tan wrote:
> Altera PCIe Rootport IP is a soft IP and is only available after
> FPGA image is programmed.
> 
> Make driver modulable to support use case FPGA image is programmed
> after kernel is booted. User proram FPGA image in kernel then only load
> PCIe driver module.

I'm not objecting to these patches, but help me understand how this
works.  The "usual" scenario is that if a driver is loaded before a
matching device is available, i.e., either the driver is built
statically or it is loaded before a device is hot-added, the event of
the device being available causes the driver's probe method to be
called.

This seems to be a more manual process of programming the FPGA which
results in a new "altera-pcie" platform device.  And then apparently
you need to load the appropriate module by hand?  Is there no
"hot-add" type of event for this platform device that automatically
looks for the driver?

Bjorn
