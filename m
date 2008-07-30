From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Fwd: Re: [U-Boot-Users] using a flat device tree to drive
	u-boot config]
Date: Wed, 30 Jul 2008 11:19:08 +1000
Message-ID: <20080730011908.GB19216@yookeroo.seuss>
References: <488F28BF.6030902@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <488F28BF.6030902-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 29, 2008 at 09:27:11AM -0500, Jon Loeliger wrote:
> -------- Original Message --------
> Subject: Re: [U-Boot-Users] using a flat device tree to drive u-boot config
> Date: Mon, 28 Jul 2008 13:59:21 -0500
> From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> To: Ben Warren <biggerbadderben-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: u-boot-users-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org Users <u-boot-users-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>
> Ben Warren wrote:
>> Uh, yeah.  I like the idea of a central repo for hardware info, and
>> the device tree concept is good.  My point is that the syntax, while
>> concise and exact, can be intimidating.  Just look at the amount of
>> traffic on the mailing lists of people that don't understand what all
>> the fields mean when specifying IRQs etc.  Anything we can do to make
>> it less so for noobies is a good thing for everybody.
>
> Sure, no argument there -- enhancing the dts syntax with symbolic  
> constants, computational expressions, and macros should make things like  
> interrupt specifiers and maps a lot clearer.

Heh, I guess with the new dtc release out, I should have a serious
look at getting the long-mooted expression support ready to merge.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
