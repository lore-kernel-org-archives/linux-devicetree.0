From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 0/4] Various PCI-related device tree helpers
Date: Wed, 13 Feb 2013 14:48:44 +0100
Message-ID: <20130213144844.6faa9ce2@skate>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Andrew Murray <andrew.murray@arm.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 11 Feb 2013 09:22:16 +0100, Thierry Reding wrote:
> Hi,
> 
> These patches add a few device tree helpers that are used are partially
> shared by Thomas' Marvell PCIe controller and my Tegra PCIe controller
> series. In an attempt to decrease the number of dependencies between
> trees, it would be nice to get these in for 3.9. There are a few ARM
> specific patches that the series depend on which have also been
> submitted and will hopefully make it into 3.9 so we can use the 3.9
> cycle to focus on getting the driver patches merged.
> 
> Thierry
> 
> Andrew Murray (1):
>   of/pci: Provide support for parsing PCI DT ranges property
> 
> Thierry Reding (3):
>   of/pci: Add of_pci_get_devfn() function
>   of/pci: Add of_pci_get_bus() function
>   of/pci: Add of_pci_parse_bus_range() function
> 
>  drivers/of/address.c       | 63 ++++++++++++++++++++++++++++++++++++
>  drivers/of/of_pci.c        | 80 +++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/of_address.h |  9 ++++++
>  include/linux/of_pci.h     |  3 ++
>  4 files changed, 150 insertions(+), 5 deletions(-)

For the patches:

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As Thierry said, we are also using those patches for the Marvell PCIe
driver, so it would be really nice to have them in 3.9 so that we have a
bit less patches to worry about when submitting our PCIe driver for
3.10.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
