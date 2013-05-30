From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFCv1 09/11] pci: mvebu: add MSI support
Date: Thu, 30 May 2013 12:13:53 -0600
Message-ID: <CAErSpo7P-fs_C+Eoc1ppyWz=rGrw4idcziRf9s=h0OsxVqJhLg@mail.gmail.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAErSpo7yC_97Vg-zuype-jyfqiY+77OE97cxYoEO9ZZnXjQ95A@mail.gmail.com> <20130530121518.GA20267@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20130530121518.GA20267@mithrandir>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2013 at 6:15 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Apr 08, 2013 at 04:29:07PM -0600, Bjorn Helgaas wrote:
>> On Tue, Mar 26, 2013 at 10:52 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> [...]
>> > +static int mvebu_pcie_setup_msi_irq(struct msi_chip *chip,
>> > +                                   struct pci_dev *pdev,
>> > +                                   struct msi_desc *desc)
>> > +{
>> > +       struct mvebu_pcie_msi *msi = to_mvebu_msi(chip);
>>
>> If this took only the pci_dev (not the msi_chip), I think you could do this:
>>
>>   struct mvebu_pcie_msi *msi = &pdev->bus->sysdata->msi;
>
> That would mean that the arch_setup_msi_irq() and friends could still be
> architecture-agnostic because they only pass around pci_dev, and the
> driver specific implementations would know how to lookup sysdata and
> from there the MSI chip.
>
> So I was almost convinced that putting the struct msi_chip pointer into
> sysdata is a good idea. However that also means that each PCI host
> bridge driver becomes architecture-specific. If we ever get a driver
> that can be used on multiple architectures (however unlikely), the only
> way to make it work would be to #ifdef those parts. We could make that
> easier to deal with by providing an accessor (pci_sysdata_set_msi_chip()
> or similar), though.
>
> But maybe it's something we don't need to be concerned about because no
> PCI host bridge driver will ever support two different architecture?
>
> One related point is compile coverage. If the drivers are completely
> architecture-agnostic it makes it a lot easier to compile-test all
> drivers, which might come in useful when doing core changes and such.

Hmm, I've forgotten what I was thinking here.  (And I'm the *worst*
about reviving ancient threads myself).  So I drop whatever objection
I had :)

Bjorn
