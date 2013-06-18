From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation
 to the DT binding
Date: Tue, 18 Jun 2013 13:10:18 -0600
Message-ID: <20130618191018.GB6578@obsidianresearch.com>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618174622.GD2204@obsidianresearch.com>
 <51C0A5F8.8030300@gmail.com> <201306182039.50736.arnd@arndb.de>
 <51C0AA8E.9080807@gmail.com>
 <20130618184753.GA6090@obsidianresearch.com>
 <51C0ADF7.5050609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51C0ADF7.5050609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 08:59:03PM +0200, Sebastian Hesselbarth wrote:

> >S = 0 means 4 bit I, 8 bit A
> >S = F means special
> >S = 1 could mean 16 bit I, etc , etc
> 
> S & 0x8 == 0x0 means 7b target
> S & 0x8 == 0x8 means 7b special ?

No need, special == mbus driver defined. There is no target ID.

The forms could be:

 0IAA0000
 FK000000
   - K=0 -> internal regs
   - K=1 -> PCI-E thingy
    etc
 1IIAA000 (future expansion example)


> >The mbus top level ranges remap already supports>4G locations for
> >the windows, even though current hardware cannot do that.
> 
> True. But as Arnd also mentioned, I don't think it will ever be a
> problem at all. Possibly there will never be any future SoC with mbus
> that will either allow >32b remap base addresses nor >4G size.

Actually, I think the failure to allow > 32b remap is a mistake
on Marvell's part. Linux needs as much low memory as possible, moving
things above 4G gives you more low SDRAM.

So I'd hope to see 40bit addressing for MBUS windows in a future chip.

But again, that already works with what Ezequiel has..

To be very clear, the only issue with the 32 bit offset is if we need
to describe an offset into a target in DT that is larger than 32
bits. The only use of offsets in DT is for internal regs. The
need for a > 32 bit offset in DT does not exist with the current
architecture.

Jason
