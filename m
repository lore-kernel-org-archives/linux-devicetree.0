From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 1/3] vic: add device tree bindings
Date: Sun, 31 Jul 2011 16:27:14 +0100
Message-ID: <20110731152714.GB7094@pulham.picochip.com>
References: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
	<1311610200-12408-2-git-send-email-jamie@jamieiles.com>
	<20110725200434.GB26735@ponder.secretlab.ca>
	<20110725223151.GB3001@gallagher>
	<20110731041107.GN24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110731041107.GN24334-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2011 at 10:11:07PM -0600, Grant Likely wrote:
> On Mon, Jul 25, 2011 at 11:31:51PM +0100, Jamie Iles wrote:
> > 
> > > > +	}
> > > 
> > > I think that rather than writing a interrupt-controller-specific
> > > parse route like this one, it would be much better to have a generic
> > > helper that finds and sorts all the interrupt controllers before
> > > calling a setup callback for each one.
> > 
> > Hmm, not sure I follow this.  I can see that many controllers would have 
> > some common properties so there will be some common code - are you 
> > suggesting having something do all the parsing then callbacks for each 
> > controller type that takes some kind of template or am I way off the 
> > mark?
> 
> No, I'm more talking about having a routine that finds all the
> interrupt controllers and figures out the cascading order, and then
> calls each irq controller setup routine in order.

OK, that makes sense.  I'm not sure how best to implement that but I'll 
give it some thought.

Regarding the irq-start property - on picoxcell we have 2 VIC's and they 
aren't cascaded - the outputs are just OR'd together so I can't work out 
how to fit in the IRQ decoding with get_irqnr_and_base without having 
this property.  Is there another way that I could implement that?

Jamie
