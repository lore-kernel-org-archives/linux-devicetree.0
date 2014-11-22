From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 09/16] ARM: mvebu: implement suspend/resume support
 for Armada XP
Date: Sat, 22 Nov 2014 21:56:48 +0100
Message-ID: <20141122215648.771225f2@free-electrons.com>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1416585613-2113-10-git-send-email-thomas.petazzoni@free-electrons.com>
	<20141121164142.GB20238@lunn.ch>
	<20141121175957.6ef4f26d@free-electrons.com>
	<20141121172031.GC20238@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141121172031.GC20238-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Fri, 21 Nov 2014 18:20:31 +0100, Andrew Lunn wrote:
> > > Hi Thomas
> > > 
> > > Is this a well defined mechanism supported by mainline uboot, barebox
> > > etc. Or is it some Marvell extension to their uboot?
> > 
> > As far as I know, it is a Marvell extension to their "binary header",
> > so it's done even before U-Boot starts.
> 
> Ah, O.K. So i miss understood what you meant by bootloader. It is the
> first stage boot loader as part of the BootROM that does this.
> 
> If i've got this wrong, probably others will as well. So could you
> make the comments talk about BootROM bootloader?

No, it is not the BootROM that does this. It is the binary header,
which is something different.

Essentially, the boot process is the following:

 * BootROM runs. This one cannot be changed, it is set in stone in the
   chip.

 * It locates a bootable image from some media, and looks at its
   header. Its header can contain several sections, some describing
   some (address, value) pairs to write some values to some registers
   (this was used on Kirkwood to configure the memory controller, for
   example). Some other sections can contain binary code that will get
   executed on the SoC, this is what is called a "binary header". It
   gets executed before U-Boot starts, but it's really a piece of
   software that can be changed.

 * Then it loads and runs U-Boot.

The "binary header" is currently the piece of code that we extract
using the kwbimage tool from existing U-Boot images to build working
Barebox images, since we haven't yet written the equivalent code in
Barebox land.

So, the specification of where the "resume informations" is located and
how this information is organized is purely defined by software that
can potentially be changed, not by the BootROM. Though that if we
decided to use a different protocol, we would basically have a
suspend/resume in the kernel that would not work with any Marvell
platform  that uses the default bootloader.

I hope that this clarifies how things are working.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
