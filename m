From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 06/12] memory: mvebu-devbus: Remove address decoding
 window workaround
Date: Tue, 18 Jun 2013 08:33:54 -0400
Message-ID: <20130618123354.GX31667@titan.lakedaemon.net>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618113920.GW31667@titan.lakedaemon.net>
 <20130618141731.56e7966c@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130618141731.56e7966c@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 02:17:31PM +0200, Thomas Petazzoni wrote:
> Dear Jason Cooper,
> 
> On Tue, 18 Jun 2013 07:39:20 -0400, Jason Cooper wrote:
> > On Tue, Jun 18, 2013 at 08:25:31AM -0300, Ezequiel Garcia wrote:
> > > Now that mbus device tree binding has been introduced, remove the address
> > > decoding window management from this driver.
> > > A suitable 'ranges' entry should be added to the devbus-compatible node in
> > > the device tree, as described by the mbus binding documentation.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  drivers/memory/mvebu-devbus.c | 64 ++-----------------------------------------
> > >  1 file changed, 2 insertions(+), 62 deletions(-)
> > 
> > Unfortunately, the patch adding mvebu-devbus is going through gregkh's
> > tree.  Either this patch needs to wait for v3.12, or ask Greg if he can
> > take this one.
> 
> I believe that what we're looking for right now is a Acked-by from both
> the Marvell maintainers, Arnd Bergmann and Jason Gunthorpe. Once we get
> those Acked-by, we can figure out the merge strategy for this patch
> set.

Right.  I was more looking to give Ezequiel a heads up because I think
he will have to extract devbus related changes out of the patches later
in this series.  I haven't had time to look closely yet, but wanted to
toss it out there so it didn't rear it's head later and throw things off
track.

thx,

Jason.
