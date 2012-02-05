From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 00/25] irq_domain generalization and refinement
Date: Sun, 5 Feb 2012 16:13:48 +0000
Message-ID: <20120205161348.GZ889@n2100.arm.linux.org.uk>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
 <20120204221748.GN14129@n2100.arm.linux.org.uk>
 <20120204223125.GO14129@n2100.arm.linux.org.uk>
 <20120205013853.GQ20333@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120205013853.GQ20333-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 04, 2012 at 05:38:53PM -0800, Tony Lindgren wrote:
> * Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> [120204 14:00]:
> > 
> > Actually, it turns out to be not that hard, because twl doesn't actually
> > make use of the IRQ domain stuff:
> > 
> > commit aeb5032b3f8b9ab69daa545777433fa94b3494c4
> > Author:     Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>
> > AuthorDate: Mon Aug 29 16:20:23 2011 +0200
> > Commit:     Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > CommitDate: Mon Jan 9 00:37:40 2012 +0100
> > 
> >     mfd: twl-core: Add initial DT support for twl4030/twl6030
> > 
> >     [grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Fix IRQ_DOMAIN dependency in kconfig]
> > 
> > Adding any dependency - especially one which wouldn't be enabled - for
> > a new feature which wasn't required before is going to break existing
> > users, so this shouldn't have been done in the first place.
> > 
> > A better fix to preserve existing users would've been as below - yes
> > it means more ifdefs, but if irq domain is to remain a DT only thing
> > then we're going to end up with _lots_ of this stuff.
> > 
> > I'd much prefer to see irq domain become more widely available so it
> > doesn't require these ifdefs everywhere.
> 
> Your patch below looks like a correct fix to me to the problem
> you and Grazvydas are seeing:
> 
> Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>

It's not quite correct, because OMAP4 has issues in this area as well
(which does select IRQ_DOMAIN but can be without OF.)  The result is
an oops from irq_domain_add() because domain->ops is NULL.

The right solution is three fold:

1. Wrap the bits of code in CONFIG_IRQ_DOMAIN
2. Get rid of the #ifdef CONFIG_OF there, so the 'ops' member can be
   initialized.
3. Fix the OMAP vp code not to oops when voltdm->pmic is NULL

which I have in my combined patch for fixing OMAP so far.
