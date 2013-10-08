From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 09 Oct 2013 07:28:55 +1100
Message-ID: <1381264135.645.230.camel@pasglop>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
	 <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
	 <525438F6.3090600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <525438F6.3090600@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2013-10-08 at 11:55 -0500, Rob Herring wrote:

> > I wonder if pci_process_bridge_OF_ranges() would fit somewhere in
> > drivers/of?  The implementations I looked at are mostly concerned with
> > parsing OF resources, and they don't have much to do with PCI
> > directly.
> 
> This was being done until Ben weighed in:
> 
> https://lkml.org/lkml/2013/5/4/103

Well, I proposed an alternative (better) approach which I of course had
no time to actually implement yet :-)

I have done the changes I needed to do to powerpc
pci_process_bridge_OF_ranges so it would be possible to move that now to
a generic place, but I still think it's not a great idea. It means the
pci_controller structure with its resources will have to become generic
which somewhat overlaps with the pci_host_bridge that Bjorn introduced,
so that's really not great.

I still think an arch with DT and simpler PCI code that powerpc could
start looking at the transition to a better model that I hinted at...

Cheers,
Ben.
