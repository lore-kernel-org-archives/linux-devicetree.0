From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 07:29:59 +1000
Message-ID: <1250112599.3587.21.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
	<20090812111954.GB31596@zod.rchland.ibm.com>
	<4A90486C-8BF5-428C-9FD8-830D822C0D40@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4A90486C-8BF5-428C-9FD8-830D822C0D40-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2009-08-12 at 08:40 -0500, Kumar Gala wrote:

> I'm in the same boat as you Josh.  I think there is value and utility  
> here but not sure what problem Ben's trying to solve.

Well, there's several things here. 

First, it would be nice to improve clock management on some existing
SoCs. I'm not going to rewrite the powermac clock handling though :-)
But it might allow to cleanup some hacks we have there or add dynamic
clock handling in areas where we could improve power consumption etc...
by doing it but aren't today. Not critical but it's nice to have the
base layout there.

Don't you have parts where you'd like some more dynamic clock
management ? This API is a reasonably simple and nice way to get there.

Now, I know there is at least one person on earth contemplating sharing
some drivers between PPC and ARM. I won't tell much more at this stage,
but it makes sense in the grand scheme of things to see SoC vendors put
similar IO cores into either PPC or ARM and providing that clock API is
a good way to also allow these drivers to work since the drivers in
questions make use of it.

Also, note that the clk API is in include/linux/clk.h, ie, it's not
really ARM specific anymore in that sense, it's also very simple (it
leaves a lot to the implementation which is good) and thus my proposal
resolves in very little support code for us (mostly the clk_get()
implementation that hooks into ppc_md, the wrappers to call the
"methods" of struct clk, and the helper to parse the OF bits).

Cheers,
Ben.
