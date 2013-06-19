From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation
 to the DT binding
Date: Wed, 19 Jun 2013 15:37:05 -0400
Message-ID: <20130619193705.GH31667@titan.lakedaemon.net>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306182345.26281.arnd@arndb.de>
 <20130619185224.GB5701@localhost>
 <201306192108.30998.arnd@arndb.de>
 <20130619192915.GA8769@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130619192915.GA8769@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 04:29:16PM -0300, Ezequiel Garcia wrote:
> On Wed, Jun 19, 2013 at 09:08:30PM +0200, Arnd Bergmann wrote:
> > On Wednesday 19 June 2013, Ezequiel Garcia wrote:
> > > > > What happens is that any decoding window that was setup by the bootloader,
> > > > > is wiped and completely new windows are allocated using the translations
> > > > > in the DT, as described by this binding.
> > > > > 
> > > > > This was the case from the start with the old MBus driver. FWIW, I think
> > > > > it's actually the best choice that can be made: it makes the kernel
> > > > > independent of the previous setting.
> > > > > 
> > > > > I know you've suggested differently in the past, but I'm not sure I
> > > > > understand what's the benefit in keeping the bootloaders configuration.
> > > > 
> > > > The device tree normally describes things that are either wired up
> > > > in hardware or set up by the boot loader. Describing things that the
> > > > boot loader may or may not have set up and that the kernel should
> > > > set up but may ignore if it wants to is a bit fishy, but it seems
> > > > that you have decided to do it that way. You should definitely
> > > > document the fact that all ranges except the "internal-regs" are just
> > > > suggestions and cannot be relied on to be present at boot time.
> > > > 
> > > 
> > > Hold on! I've just noticed this, and I want to clarify something, just
> > > to avoid mis-interpretations. The binding is not saying "the windows
> > > described through this ranges are present at boot time".
> > > 
> > > Rather, it is "this binding will guarantee that the windows described 
> > > in it will be present after the mbus allocates them".
> > > 
> > > Does it sound too fishy?
> > 
> > I don't think it's a guarantee that the binding can make. The binding
> > describes the interface between the hardware/firmware and the kernel,
> > not an interface between one kernel driver and another.
> > 
> > You could instead write:
> > 
> > "The ranges property defines a set of mbus windows that are expected
> > to be set by the operating system and that are guaranteed to be free
> > of overlaps with one another or with the system memory ranges.
> > Each entry in the property refers to exactly one window. If an
> > operating system choses to use a different set of mbus windows,
> > it must ensure that any address translations performed from downstream
> > devices are adapted accordingly. The operating system may insert
> > additional mbus windows that do not conflict with the ones listed
> > in the ranges, e.g. for mapping PCIe devices. As a special case,
> > the internal register window must be set up by the boot loader
> > at the address listed in the ranges property, since the operating

...system...

> > uses it to set up the other windows."
> > 
> 
> Nice!
> 
> Shamelessly copy-pasted into the binding documentation.

thx,

Jason.
