From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Add missing of_address.h to xilinx ehci driver
Date: Tue, 15 Feb 2011 22:55:36 -0700
Message-ID: <20110216055536.GB22236@angua.secretlab.ca>
References: <1297680009-4054-1-git-send-email-monstr@monstr.eu>
	<20110215204011.GB24022@angua.secretlab.ca>
	<AANLkTi=j4COunaLvadkD8Oh2qGaBCsNb8DvrKt_C4GHf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=j4COunaLvadkD8Oh2qGaBCsNb8DvrKt_C4GHf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 16, 2011 at 06:58:26AM +1000, John Williams wrote:
> On Wed, Feb 16, 2011 at 6:40 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:
> 
> > On Mon, Feb 14, 2011 at 11:40:09AM +0100, Michal Simek wrote:
> > > Build log:
> > > In file included from drivers/usb/host/ehci-hcd.c:1208:
> > > drivers/usb/host/ehci-xilinx-of.c: In function
> > 'ehci_hcd_xilinx_of_probe':
> > > drivers/usb/host/ehci-xilinx-of.c:168: error: implicit declaration of
> > function 'of_address_to_resource'
> > >
> > > Signed-off-by: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> > > Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> >
> > Applied, thanks.
> >
> 
> FYI I haven't tried building it, but I believe that ehci-ppc-of.c will need
> the same patch.

I'll wait for someone to post a patch.

g.
