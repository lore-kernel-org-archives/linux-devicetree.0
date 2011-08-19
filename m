From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: board identification in /sys
Date: Thu, 18 Aug 2011 20:14:56 -0700
Message-ID: <20110818201456.5517ae55@debxo>
References: <20110818121530.08946a6e@queued.net>
	<20110819022306.GD30097@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110819022306.GD30097-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 19 Aug 2011 12:23:06 +1000
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

> On Thu, Aug 18, 2011 at 12:15:30PM -0700, Andres Salomon wrote:
> > I've been paying partial attention to the following thread:
> > http://marc.info/?l=linux-hotplug&m=131352330625733&w=2
> > 
> > It's an interesting discussion.  I realize that
> > moving /proc/device-tree to /sys would probably violate
> > sysrq-rules.txt, but it would be nice to have a common way to
> > represent things like cpu type, board id, etc in /sys that is
> > populated from the DT.  I haven't seen that discussed here yet, has
> > anyone considered it?
> 
> Seems like a specious argument to me.  Despite all the problems of
> /proc, the contents of /proc/device-tree are perfectly well-defined.
> Or at least, its problems are entirely its own and not related to the
> general problems of /proc.  The only argument here seems to be that
> it's in /proc, and that's dealt with if that helper script just thinks
> of /proc/device-tree as one possible place for the device tree path.
> In the future it could be under /sys.  Indeed on sparc I think their
> device tree representation is a separate filesystem and could be
> anywhere.

Under sparc, it's typically in /openprom iirc.

I'd be fine with converting it to /sys/device-tree or some such thing
if that was okay with maintainers.
