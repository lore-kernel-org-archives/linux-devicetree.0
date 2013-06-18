From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation
 to the DT binding
Date: Tue, 18 Jun 2013 14:55:22 -0600
Message-ID: <20130618205522.GA13691@obsidianresearch.com>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618174622.GD2204@obsidianresearch.com>
 <51C0A5F8.8030300@gmail.com> <201306182039.50736.arnd@arndb.de>
 <51C0AA8E.9080807@gmail.com>
 <20130618184753.GA6090@obsidianresearch.com>
 <51C0ADF7.5050609@gmail.com>
 <20130618191018.GB6578@obsidianresearch.com>
 <51C0B4A0.90204@gmail.com> <20130618204911.GB2516@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130618204911.GB2516@localhost>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 05:49:11PM -0300, Ezequiel Garcia wrote:
> Hi Sebastian,
> 
> You loose +1 internet points for dropping me from Cc ;-)
> 
> On Tue, Jun 18, 2013 at 09:27:28PM +0200, Sebastian Hesselbarth wrote:
> > On 06/18/2013 09:10 PM, Jason Gunthorpe wrote:
> > >
> > > The forms could be:
> > >
> > >   0IAA0000
> > >   FK000000
> > >     - K=0 ->  internal regs
> > >     - K=1 ->  PCI-E thingy
> > >      etc
> > >   1IIAA000 (future expansion example)
> > 
> > Ok, got it. Any encoding is fine that allows to distinguish real
> > remap windows and fake ones. I assumed that maybe someday there
> > will be more than 4b target id so 0x80 as special case indicator
> > leaves 7b of normal target id in the _current_ mapping.
> > 
> 
> I'm also wondering about why we not care about target IDs being more
> than 4 bits.
> 
> Jason: (I'm checking now but perhaps you know better than me):
> Is there any MBus-architectural reason for you assuring the
> target ID will always be within 4-bits?

The manuals I have for the register set say 4 bits is allocated for
mbus targets.. Are yours different?

If they change it then the window register layout changes and then the
mbus driver probably need to change as well.

Jason
