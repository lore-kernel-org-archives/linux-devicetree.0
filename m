From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 6/8] --- arch/powerpc/boot/dts/socrates.dts | 9
	+++++++-- 1 file changed, 7 insertions(+), 2 deletions(-)
Date: Wed, 1 Apr 2009 22:09:55 +1100
Message-ID: <20090401110955.GA7507@yookeroo.seuss>
References: <20090331123727.853787299@denx.de>
	<20090331124036.057237866@denx.de>
	<20090331230451.GA23304@yookeroo.seuss>
	<49D31856.9060808@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49D31856.9060808-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 01, 2009 at 09:31:34AM +0200, Wolfgang Grandegger wrote:
> Hi David,
> 
> this patch went out by mistake, sorry.
> 
> David Gibson wrote:
> > On Tue, Mar 31, 2009 at 02:37:33PM +0200, Wolfgang Grandegger wrote:
> >> Index: linux-2.6/arch/powerpc/boot/dts/socrates.dts
> >> ===================================================================
> >> --- linux-2.6.orig/arch/powerpc/boot/dts/socrates.dts	2009-03-31 13:24:38.078719288 +0200
> >> +++ linux-2.6/arch/powerpc/boot/dts/socrates.dts	2009-03-31 13:47:56.986720719 +0200
> >> @@ -52,6 +52,7 @@
> >>  	soc8544@e0000000 {
> >>  		#address-cells = <1>;
> >>  		#size-cells = <1>;
> >> +		device_type = "soc";
> > 
> > You should not be adding device_type to a new board's dts.  You
> > *especially* shouldn't be doing that with no patch comment explaining
> > why.
> 
> In the final patch I have removed the device_type = "soc", but it makes
> trouble as some mpc85xx rely on it.

Um.. what?  Some mpc85xx?  This is the dts for *one specific board*, I
don't see how something that affects "some mpc85xx" is relevant.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
