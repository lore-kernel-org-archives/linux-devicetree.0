From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3] vic: add device tree bindings
Date: Sat, 30 Jul 2011 22:11:07 -0600
Message-ID: <20110731041107.GN24334@ponder.secretlab.ca>
References: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
	<1311610200-12408-2-git-send-email-jamie@jamieiles.com>
	<20110725200434.GB26735@ponder.secretlab.ca>
	<20110725223151.GB3001@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110725223151.GB3001@gallagher>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2011 at 11:31:51PM +0100, Jamie Iles wrote:
> Hi Grant,
> 
> On Mon, Jul 25, 2011 at 02:04:34PM -0600, Grant Likely wrote:
> > irq_domain_add_simple() is a stop-gap shortcut for interrupt
> > controllers that don't use irq_domain directly.  I'm okay with doing
> > this in the short term, but I imagine it will want to change in the
> > near future to take advantage of hw->linux irq translation provided by
> > irq_domain when it matures.
> 
> I have to admit to taking this from other controllers without fully 
> understanding it.  Is there any documentation on how this should be done 
> correctly in the longer term?

Documentation?  Ummmm... no, not yet.  :-/  There will be though.

> 
> > > +	}
> > 
> > I think that rather than writing a interrupt-controller-specific
> > parse route like this one, it would be much better to have a generic
> > helper that finds and sorts all the interrupt controllers before
> > calling a setup callback for each one.
> 
> Hmm, not sure I follow this.  I can see that many controllers would have 
> some common properties so there will be some common code - are you 
> suggesting having something do all the parsing then callbacks for each 
> controller type that takes some kind of template or am I way off the 
> mark?

No, I'm more talking about having a routine that finds all the
interrupt controllers and figures out the cascading order, and then
calls each irq controller setup routine in order.

g.
