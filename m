From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCHv3] ARM:boot:device tree: Allow the device tree binary to be
	appended to zImage
Date: Wed, 27 Apr 2011 10:40:34 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1104271036520.24613@xanadu.home>
References: <20110324231830.2586.7150.stgit@riker>
	<20110328091259.GA18721@S2100-06.ap.freescale.net>
	<20110413140030.GE12665@atomide.com>
	<20110420054746.GA31127@S2100-06.ap.freescale.net>
	<20110420073445.GB31127@S2100-06.ap.freescale.net>
	<20110421080238.GE13688@atomide.com>
	<20110421124618.GA15060@atomide.com>
	<20110427142306.GI3755@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110427142306.GI3755-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 27 Apr 2011, Tony Lindgren wrote:

> * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [110421 05:44]:
> > * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [110421 11:00]:
> > > * Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> [110420 00:27]:
> > > > On Wed, Apr 20, 2011 at 01:47:47PM +0800, Shawn Guo wrote:
> > > > > I would like to confirm it fixes your setup before I send fixing
> > > > > patch to remove 'static' from global variables in all platform
> > > > > uncompress.h.
> > > > > 
> > > > Just saw Nico's patch, so ignore above lines ...
> > > 
> > > Thanks looks like removing static only changes things so now
> > > "Warning: Neither atags nor dtb found" error message printed out.
> > 
> > But also Nico's patch fixes the corruption of the DT data during
> > uncompress, so I'm getting much further now.
> > 
> > Now the problem is that the DT data is zeroed out by the time code
> > gets to setup_machine_fdt. I wonder if I'm missing some patch?
> > 
> > I'm using grant's devicetree/arm branch + DT append patch + Nico's
> > static fix + my relocate fix.
> > 
> > Oh well have to look at it again next week..
> 
> I guess the issue is that when setup_machine_fdt gets called we only
> have minimal MMU mapping done.

In head.S (the final kernel image one) there is a 1MB mapping 
established when r2 contains a valid ATAG/DTB pointer.  See commit 
4d901c42 (you even ACK'd it).


Nicolas
