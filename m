From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH] pci: Provide support for parsing PCI DT ranges property
Date: Mon, 14 Jan 2013 09:24:45 +0000
Message-ID: <20130114092445.GB23333@arm.com>
References: <20121212163749.GA17371@arm.com>
 <CACxGe6uZATX2uBjuDUsJ489-jmvFbLm-NQ6Q3SGqRVky9XGJYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CACxGe6uZATX2uBjuDUsJ489-jmvFbLm-NQ6Q3SGqRVky9XGJYg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, Michal Simek <monstr@monstr.eu>, Rob Herring <robherring2@gmail.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Liviu Dudau <Liviu.Dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 15, 2012 at 01:06:41AM +0000, Grant Likely wrote:
> On Wed, Dec 12, 2012 at 4:37 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:
> > DT bindings for PCI host bridges often use the ranges property to describe
> > memory and IO ranges - this binding tends to be the same across architectures
> > yet several parsing implementations exist, e.g. arch/mips/pci/pci.c,
> > arch/powerpc/kernel/pci-common.c, arch/sparc/kernel/pci.c and
> > arch/microblaze/pci/pci-common.c (clone of PPC). Some of these duplicate
> > functionality provided by drivers/of/address.c.
> 
> Hi Andrew,
> 
> Thanks for looking into this. This definitely needs to be done.
> 
> However, I cannot merge this patch as-is because it actually makes
> things worse by adding yet another implementation of the parsing code.
> Plus it doesn't actually have any users.  :-)

I understand. Though I see Thierry has included this in his patch set - I
guess that means there is potentially one user now :).

> 
> Instead, move the existing code that you need out of
> arch/powerpc/kernel/pci-common.c into a shared place and add in the
> features you need. Bonus points if you fixup microblaze or others at
> the same time.

In most part the patch I submitted was the common code from powerpc but
without quirks and tie-ins to powerpc structures. I'd like to convert
powerpc to using my patch and others but won't get time to do this at
present :(

> 
> g.
> 
Andrew Murray
