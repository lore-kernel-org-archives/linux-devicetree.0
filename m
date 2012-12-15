From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] pci: Provide support for parsing PCI DT ranges property
Date: Sat, 15 Dec 2012 01:06:41 +0000
Message-ID: <CACxGe6uZATX2uBjuDUsJ489-jmvFbLm-NQ6Q3SGqRVky9XGJYg@mail.gmail.com>
References: <20121212163749.GA17371@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20121212163749.GA17371@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Andrew Murray <Andrew.Murray@arm.com>
Cc: linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Michal Simek <monstr@monstr.eu>, Rob Herring <robherring2@gmail.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Liviu Dudau <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2012 at 4:37 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:
> DT bindings for PCI host bridges often use the ranges property to describe
> memory and IO ranges - this binding tends to be the same across architectures
> yet several parsing implementations exist, e.g. arch/mips/pci/pci.c,
> arch/powerpc/kernel/pci-common.c, arch/sparc/kernel/pci.c and
> arch/microblaze/pci/pci-common.c (clone of PPC). Some of these duplicate
> functionality provided by drivers/of/address.c.

Hi Andrew,

Thanks for looking into this. This definitely needs to be done.

However, I cannot merge this patch as-is because it actually makes
things worse by adding yet another implementation of the parsing code.
Plus it doesn't actually have any users.  :-)

Instead, move the existing code that you need out of
arch/powerpc/kernel/pci-common.c into a shared place and add in the
features you need. Bonus points if you fixup microblaze or others at
the same time.

g.
