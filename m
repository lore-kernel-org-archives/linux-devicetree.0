Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:25:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCHv4 2/3] ARM: mm: add support for HW coherent systems in
 PL310
Message-ID: <20140517102507.52c5d8ae@free-electrons.com>
In-Reply-To: <CAL_Jsq+VRZdJD6sMR=whC=bmjgODb01h8dci_KsjHx7pMLDhuA@mail.gmail.com>
References: <1400165974-9059-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400165974-9059-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<CAL_Jsq+VRZdJD6sMR=whC=bmjgODb01h8dci_KsjHx7pMLDhuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Albin Tonnerre <albin.tonnerre@arm.com>, "linux-arm-kernel@lists.infradead.org\"   <linux-arm-kernel@lists.infradead.org>, Jason Cooper  <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth  <sebastian.hesselbarth@gmail.com>, Gregory Clement  <gregory.clement@free-electrons.com>, Tawfik Bayouk <tawfik@marvell.com>,  Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>,  Ezequiel Garcia <ezequiel.garcia@free-electrons.com>"@mail.free-electrons.com
List-ID: <devicetree@vger.kernel.org>

Dear Rob Herring,

On Thu, 15 May 2014 14:08:39 -0500, Rob Herring wrote:

> >         of_init = true;
> >         memcpy(&outer_cache, &data->outer_cache, sizeof(outer_cache));
> > +
> > +       /*
> > +        * outer sync operations are not needed when the system is I/O
> > +        * coherent, and potentially harmful in certain situations
> > +        * (PCIe/PL310 deadlock on Armada 375/38x due to hardware I/O
> > +        * coherency). The other operations are kept because they are
> > +        * infrequent (therefore do not cause the deadlock) and needed
> > +        * for secondary CPU boot and other power management
> > +        * activities.
> > +        */
> > +       if (of_device_is_compatible(np, "arm,pl310-cache") &&
> 
> Don't we have a pl310 specific init function this can be placed in
> removing this check? We could probably remove this check here anyway
> because we're never going to see this on an L210 or L220.

We have a pl310 specific init function called pl310_of_init(). However
it gets called *before* the global outer_cache structure gets memcpy()
from the specific L2 cache type chosen by the compatible string.
Therefore, it cannot null-ify the .sync operation. It is also unable to
do it directly in the pl310_data structure, because 1/ this structure
is const and 2/ I believe it would be ugly.

Therefore, we don't have much other choice than to do that where I'm
doing at the moment. I'll respin the patch series to remove the
"arm,pl310-cache" check, as you suggested.

Thanks for the review,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
