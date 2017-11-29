From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 3/5] PCI: cadence: Add host driver for Cadence PCIe
 controller
Date: Wed, 29 Nov 2017 09:55:21 -0600
Message-ID: <20171129155521.GA6469@bhelgaas-glaptop.roam.corp.google.com>
References: <cover.1511439189.git.cyrille.pitchen@free-electrons.com>
 <2670f7ddf59e708beb9d32bef1353e15bd4e1ecf.1511439189.git.cyrille.pitchen@free-electrons.com>
 <20171128204114.GE11228@bhelgaas-glaptop.roam.corp.google.com>
 <20171129091929.0077ffbc@windsurf.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129091929.0077ffbc@windsurf.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>, bhelgaas@google.com, kishon@ti.com, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, adouglas@cadence.com, stelford@cadence.com, dgary@cadence.com, kgopi@cadence.com, eandrews@cadence.com, sureshp@cadence.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 09:19:29AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 28 Nov 2017 14:41:14 -0600, Bjorn Helgaas wrote:
> 
> > > + * struct cdns_pcie_rc_data - hardware specific data  
> > 
> > "cdns" is a weird abbreviation for "Cadence", since "Cadence" doesn't
> > contain an "s".
> 
> cdns is the official Device Tree binding vendor prefix for Cadence:
> 
> $ grep Cadence Documentation/devicetree/bindings/vendor-prefixes.txt
> cdns	Cadence Design Systems Inc.
> 
> And it is already widely used throughout the kernel for Cadence
> drivers. See drivers/watchdog/cadence_wdt.c, drivers/spi/spi-cadence.c,
> drivers/i2c/busses/i2c-cadence.c, etc.

Hard to argue with that!  Thanks!
