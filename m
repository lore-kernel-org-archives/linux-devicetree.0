From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Fri, 26 Mar 2010 15:30:06 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1003261435460.694@xanadu.home>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
	<fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_L4HcDfWEKtQRiFWQHlZDIQ)"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Philippe Robin <Philippe.Robin@arm.com>, David Rusling <David.Rusling@arm.com>, Mitch Bradley <wmb@firmworks.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Dave P Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_L4HcDfWEKtQRiFWQHlZDIQ)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Fri, 26 Mar 2010, Grant Likely wrote:

> On Fri, Mar 26, 2010 at 11:43 AM, Mitch Bradley <wmb@firmworks.com> wrote:
> > Catalin Marinas wrote:
> >> On Thu, 2010-03-25 at 21:04 +0000, Russell King - ARM Linux wrote:
> >>> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
> >>>> *IRQs disabled
> >>>> *MMU off
> >>>> *Instruction cache either on or off
> >>>> *Data cache turned off
> >>>
> >>> Would recommend saying "Data cache(s) turned off" so that L2 cache is
> >>> included.
> >>
> >> There are platforms where the L2 cache is turned on by the boot monitor
> >> (secure monitor) and Linux has no control over it (I think OMAP).
> >
> > What is the reason for turning off the data caches?  Leaving all caches
> > turned on and coherent with one another has always worked well for me at the
> > interface from firmware to a booted program.
> 
> Data cache off is specified in Documentation/arm/Booting in the Linux
> source tree and I used that document as a starting point to get
> discussion going.  I don't have a technical argument either way.
> 
> Russell, what is the reason for having the data cache off?

At least on machines with a VIVT cache, you need to have the MMU enabled 
for the data cache to be enabled.  That means a page table set up 
somewhere in memory, and then the kernel would need to know where that 
page table is not to overwrite it until the kernel has set its own page 
table, etc.  This makes the booting requirements more complex for very 
little gain.

So by mandating that the MMU be off (implying that the dcache has to be 
disabled too) then the kernel can set it up without restrictions.


Nicolas

--Boundary_(ID_L4HcDfWEKtQRiFWQHlZDIQ)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--Boundary_(ID_L4HcDfWEKtQRiFWQHlZDIQ)--
