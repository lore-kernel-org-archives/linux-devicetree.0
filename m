From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [RFCv1 08/11] PCI: Introduce new MSI chip infrastructure
Date: Tue, 9 Apr 2013 09:25:32 +0100
Message-ID: <20130409082532.GA31140@arm.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAErSpo42AFdKH2RKTxOaeJgCPrYD5KYkOs3UEBez8x8Bjmun5w@mail.gmail.com>
 <20130409081119.GA30736@arm.com>
 <20130409082232.GC27255@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130409082232.GC27255@avionic-0098.mockup.avionic-design.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Gregory Clement <gregory.clement@free-electrons.com>, Tawfik Bayouk <tawfik@marvell.com>, Mitch Bradley <wmb@firmworks.com>, linux-arm <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2013 at 09:22:33AM +0100, Thierry Reding wrote:
> On Tue, Apr 09, 2013 at 09:11:19AM +0100, Andrew Murray wrote:
> [...]
> > Also I believe pci_alloc_child_bus function would need to be changed to add
> > "b->msi = msi" to inherit msi_chip for child buses in the above patch?
> 
> The patch already does:
> 
> 	child->msi = parent->msi;
> 
> in pci_alloc_child_bus(), the same way that ops is inherited. I have
> admittedly only tested this code on Tegra, but I don't see why that
> wouldn't be enough. Or maybe I haven't understood your question?

Sorry I missed that part of your patch - that was exacatly what I was
hoping to see.

Andrew Murray
