From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: board identification in /sys
Date: Fri, 19 Aug 2011 12:23:06 +1000
Message-ID: <20110819022306.GD30097@yookeroo.fritz.box>
References: <20110818121530.08946a6e@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110818121530.08946a6e-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2011 at 12:15:30PM -0700, Andres Salomon wrote:
> I've been paying partial attention to the following thread:
> http://marc.info/?l=linux-hotplug&m=131352330625733&w=2
> 
> It's an interesting discussion.  I realize that
> moving /proc/device-tree to /sys would probably violate
> sysrq-rules.txt, but it would be nice to have a common way to
> represent things like cpu type, board id, etc in /sys that is populated
> from the DT.  I haven't seen that discussed here yet, has anyone
> considered it?

Seems like a specious argument to me.  Despite all the problems of
/proc, the contents of /proc/device-tree are perfectly well-defined.
Or at least, its problems are entirely its own and not related to the
general problems of /proc.  The only argument here seems to be that
it's in /proc, and that's dealt with if that helper script just thinks
of /proc/device-tree as one possible place for the device tree path.
In the future it could be under /sys.  Indeed on sparc I think their
device tree representation is a separate filesystem and could be
anywhere.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
