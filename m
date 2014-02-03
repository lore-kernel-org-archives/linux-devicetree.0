From: Ian Campbell <Ian.Campbell@citrix.com>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Mon, 3 Feb 2014 11:14:27 +0000
Message-ID: <1391426067.10515.54.camel@kazak.uk.xensource.com>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
	 <52EA83D6.9050506@codeaurora.org> <20140203045638.GB4167@cbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140203045638.GB4167@cbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <christoffer.dall@linaro.org>
Cc: Christopher Covington <cov@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 2014-02-02 at 20:56 -0800, Christoffer Dall wrote:
> On Thu, Jan 30, 2014 at 11:54:46AM -0500, Christopher Covington wrote:
> > Hi Ian,
> > 
> > On 01/30/2014 11:11 AM, Ian Campbell wrote:
> > > mach-virt has existed for a while but it is not written down what it actually
> > > consists of. Although it seems a bit unusual to document a binding for an
> > > entire platform since mach-virt is entirely virtual it is helpful to have
> > > something to refer to in the absence of a single concrete implementation.
> > > 
> > > I've done my best to capture the requirements based on the git log and my
> > > memory/understanding.
> > > 
> > > While here remove the xenvm dts example, the Xen tools will now build a
> > > suitable mach-virt compatible dts when launching the guest.
> > 
> 
> [...]
> 
> > > +The platform may also provide hypervisor specific functionality
> > > +(e.g. PV I/O), if it does so then this functionality must be
> > > +discoverable (directly or indirectly) via device tree.
> > 
> > I think it would be informative to provide pointers here to commonly used
> > paravirtualized devices, especially VirtIO PCI/MMIO.
> > 
> 
> I disagree: that would only encourage limited testing or assumptions
> about these specific devices when really this platform is just a
> bare-bones platform driven by device tree which should make no
> preference, whatsoever, about which devices are used with the platform.

Thanks, I think this is exactly what I was failing to express coherently
last week ;-)

Ian.
