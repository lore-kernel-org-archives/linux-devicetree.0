From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 3/4] pci: iproc: Add Broadcom iProc PCIe support
Date: Tue, 10 Mar 2015 23:39:08 +0100
Message-ID: <4502186.8jmIz85sZB@wuerfel>
References: <1425947886-23705-1-git-send-email-rjui@broadcom.com> <20150310214010.GB32204@google.com> <54FF6EAC.90603@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <54FF6EAC.90603@broadcom.com>
Sender: linux-pci-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Ray Jui <rjui@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-kernel@vger.kernel.org, Anatol Pomazau <anatol@google.com>, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, bcm-kernel-feedback-list@broadcom.com, Dmitry Torokhov <dtor@google.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 10 March 2015 15:22:36 Ray Jui wrote:
> > Do you anticipate additional front-end bus interfaces?  If not, and maybe
> > even if you do, you might squash everything into pcie-iproc.c.  Then you
> > only need one file (no .h file needed) and the package is a little
> > simpler.  I think it's pretty common to have multiple driver registration
> > methods in the same file (OF, PCI, ACPI, etc.)  And I think it's common to
> > have those methods guarded by the generic config symbol (CONFIG_PCI,
> > CONFIG_OF, etc.) rather than defining new ones specific to the driver.
> > 
> 
> Yes I do expect Hauke (CCed) to add BCMA bus front end support later.
> 
> I still think having the front end bus driver separated is cleaner and
> may be less troublesome for Hauke to add BCMA support in the future. But
> if you strongly favor having everything stuffed in one single file, I
> can make that change. Please let me know.
> 

I was the one that initially suggested splitting the driver into files
like this, and I still think it's the right strategy with the
BCMA driver coming up.

	Arnd
