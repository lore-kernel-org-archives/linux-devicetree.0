From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 03/14] bus: mvebu-mbus: Introduce device tree binding
Date: Fri, 7 Jun 2013 18:26:37 -0600
Message-ID: <20130608002637.GA2391@obsidianresearch.com>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072153.03855.arnd@arndb.de>
 <20130607200956.GB9010@obsidianresearch.com>
 <201306072315.50390.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306072315.50390.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 07, 2013 at 11:15:50PM +0200, Arnd Bergmann wrote:

> > The mbus driver should never read or write this register.
> 
> That is not a hard requirement, right? I guess based on the
> recent discussion about the 0xd0 or 0xf1 window, there may
> actually be good reasons to reassign it, although I agree
> that we shouldn't bother with implementing that for now, as
> it's not a simple or urgent problem.

Yes, exactly.

To be meaningfull any re-assignment probably has to go along with a
SDRAM remap as well, which is tricky to impossible to do when you are
already running from SDRAM.

> > Doesn't really matter which is picked, as far as I can tell, though
> > maybe the 01 option is best, leading to:
> > 
> >   IIAAssss 00oooooo
> > 
> > Where:
> >    == 0 means I/A are:
> >    == 1 means internal regs block
> > 
> > Which is pretty tidy..
> 
> Ok, thanks for the explanation. I think this is a good representation.
> The other idea I raised in my previous mail would end up with something
> like
> 
>  SIIAA000 00oooooo
> 
> with 'S' having the inverted meaning of your 's', so '0' actually
> refers to the internal regs as in Ezequiel's current code.
> 
> I'm fine with either representation though.

Right, it doesn't really matter, Ezequiel should pick whatever he
likes, as long as the encoding is fully described in the binding
document (Ezequiel, feel free to crib my text), and the 'special' IDs
don't overlap with potentially valid target ids (ie don't use 0 ==
internal regs).

Jason
