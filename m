From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 13:22:19 +0200
Message-ID: <20110612112219.GD16318@ibawizard.net>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612081541.GA10283@n2100.arm.linux.org.uk>
	<20110612083414.GA29516@S2100-06.ap.freescale.net>
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110612083414.GA29516@S2100-06.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, John Bonesio <bones@secretlab.ca>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Shawn Guo <shawn.guo@freescale.com> [2011-06-12 16:34:15]:

> On Sun, Jun 12, 2011 at 09:15:41AM +0100, Russell King - ARM Linux wrote:
> > 
> > One thing which has been bugging me for some time is that the DT stuff
> > completely overrides the ATAGs.  This is wrong with solutions like this.
> > 
> > We have a set of perfectly good boot loaders which provide correct
> > information to the kernel via ATAGs.  If we start moving everything
> > over to DT, then we run into a problem because the ATAGs are ignored -
> > stuff such as the RAM size and command line passed from the boot loader
> > will be entirely ignored, instead these having to be encoded into the
> > kernel at build time.
> > 
> What u-boot does right now is replacing the parameters in dtb with
> its for those it's interested in, for example command line is one,
> before it passes dtb to kernel.

If I understand it all correctly, there must be some 'legacy bootloader
support' added to the kernel, layer which would convert the ATAGs to the DT.
Or something like that.

Please note, that there are some boards out there, which use some kind of
proprietary bootloaders, so you can't update or change them easily. You either
don't have source code, you're limited by the available space (2KB eeprom) so
you can't add much more things into that bootloader or you're limited by the
size of the MBR (yes, even such bootloaders exists).

Ok, everything could be reverse engineered, EEPROM could be exchanged for the
bigger one etc., second stage bootloader could be written for the MBR one, but
it's not as easy as you think, at least not as "Add dtb parsing support with
the help from libfdt. It is some amount of work, but it's not a rewrite of
bootloader, IMHO."

-- ynezz
