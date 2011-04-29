From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCHv3] ARM:boot:device tree: Allow the device tree binary to be
	appended to zImage
Date: Fri, 29 Apr 2011 09:21:22 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1104290918050.24613@xanadu.home>
References: <20110413140030.GE12665@atomide.com>
	<20110420054746.GA31127@S2100-06.ap.freescale.net>
	<20110420073445.GB31127@S2100-06.ap.freescale.net>
	<20110421080238.GE13688@atomide.com>
	<20110421124618.GA15060@atomide.com>
	<20110427142306.GI3755@atomide.com>
	<alpine.LFD.2.00.1104271036520.24613@xanadu.home>
	<20110427144335.GK3755@atomide.com> <20110429102623.GX3755@atomide.com>
	<BANLkTi=jcb8Piki6RrijGOQG=wJ=ULv5Gw@mail.gmail.com>
	<20110429130939.GB3755@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110429130939.GB3755-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 29 Apr 2011, Tony Lindgren wrote:

> * Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> [110429 05:59]:
> > On Fri, Apr 29, 2011 at 4:26 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > > * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [110427 07:41]:
> > >
> > > If the compressed image is smaller than BSS, then we end up
> > > having DT data in the BSS area. In this case the compressed
> > > image is about 2.3 MB for LZMA.
> > >
> > > The uncompress code does not know about the kernel BSS,
> > > and does not necessarily relocate anything depending on the
> > > compressed image load address.
> > >
> > > So in which code do we want to relocate the DT data?
> > >
> > > We could do it based on estimated BSS size in uncompress code,
> > > or based on the real BSS size in __mmap_switched before BSS
> > > gets reset.
> > 
> > How about telling the wrapper what the final size will be by scraping
> > the __bss_end value out of System.map?
> 
> That sounds doable to me. It should probably be done in the uncompress
> code so the kernel code can stay generic for the DT data handling.

Well, that's probably doable too.  If the final kernel's .bss conflicts 
with the DT data, then moving the DT data above the malloc space in the 
decompressor is trivial too.


Nicolas
