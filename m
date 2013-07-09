From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v7 11/22] PCI: mvebu: Adapt to the new device tree layout
Date: Tue, 9 Jul 2013 14:54:00 -0400
Message-ID: <20130709185400.GM11908@titan.lakedaemon.net>
References: <1373388084-29520-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1373388084-29520-12-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130709182026.GJ11908@titan.lakedaemon.net>
 <CAErSpo5uhDRWNnEvTewU=RnV7VW_em=PbvyQZh2PkEy8pCsGwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo5uhDRWNnEvTewU=RnV7VW_em=PbvyQZh2PkEy8pCsGwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2013 at 12:50:47PM -0600, Bjorn Helgaas wrote:
> On Tue, Jul 9, 2013 at 12:20 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > Bjorn,
> >
> > On Tue, Jul 09, 2013 at 01:41:13PM -0300, Ezequiel Garcia wrote:
> >> From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>
> >> The new device tree layout encodes the window's target ID and attribute
> >> in the PCIe controller node's ranges property. This allows to parse
> >> such entries to obtain such information and use the recently introduced
> >> MBus API to create the windows, instead of using the current name based
> >> scheme.
> >>
> >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/pci/mvebu-pci.txt          | 145 ++++++++++++++++-----
> >>  drivers/pci/host/pci-mvebu.c                       | 113 +++++++++++-----
> >>  2 files changed, 193 insertions(+), 65 deletions(-)
> >
> > After my conversation with tglx a few days ago [1], I'm even more
> > inclined to push patches like this to the correct maintainers.  However,
> > looking at how this patch fits into the series, it may be better if we
> > take it through mvebu/arm-soc with your Ack.
> >
> > It depends on the patches before it, and the patches after it depend on
> > it.  Unless I'm reading this wrong, I would have a branch that you would
> > pull and base this patch on, which I would then pull and base the rest
> > of the series on. Reshuffling the series to alleviate this wouldn't work
> > in this case. :-/
> >
> > Are you ok with that?  (fwiw, the code changes are isolated to
> > pci-mvebu.c)
> 
> Yep, that makes sense to me.  With dependencies both ways, it just
> seems much simpler to have you push it via mvebu/arm-soc.
> 
> Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Will do, thanks Bjorn!

thx,

Jason.
