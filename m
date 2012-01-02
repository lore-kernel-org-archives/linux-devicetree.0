From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 2 Jan 2012 14:54:39 +0000
Message-ID: <20120102145439.GR4300@opensource.wolfsonmicro.com>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
 <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
 <20120102132500.GB18443@sirena.org.uk>
 <20120102135145.GA25420@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120102135145.GA25420@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2012 at 01:51:45PM +0000, Jamie Iles wrote:
> On Mon, Jan 02, 2012 at 01:25:00PM +0000, Mark Brown wrote:

> > > v2:	- use Rob Herring's irqdomain in generic irq chip patches
> > > 	- use reg property to indicate bank index
> > > 	- support irqs on both edges based on LinusW's u300 driver

> > Put stuff like this after the ---, it shouldn't end up in git history.

> Grant (and others I believe) have asked to have it above the separator 
> in the past to ensure that it does end up in the history.  This helps 
> make it clear what version got applied and it's a lot easier for patch 
> authors to manage rather than keeping it out of band.

You end up with content-free junk in the changelogs like "v2: rewrite
with new API" (I've actually had that...) which just isn't instructive
to anyone reading the logs later; if there were some way of going from
the changelog back to the actual code that'd be one thing but then
there's a reason why we don't carry the out of tree revision control
history.

Note that patch changelogs are one of the specific examples given in
SubmittingPatches for inclusion after the ---.

Personally I'm not convinced carrying any out of tree change history
except the delta from the last version submitted is useful as the actual
code changes aren't readily available and the fact that there were
earlier versions with bugs or whatever isn't terribly instructive.  The
delta from the last version is useful for helping to focus review but
the rest of it gets very noisy.  If the history is really useful
probably merging an actual branch with is much more helpful, if it's
getting troublesome to manage it and that's not suitable then I'd just
drop it.

> Something like this?

Yes, exactly thanks.
