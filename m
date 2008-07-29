From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Fwd: Re: [U-Boot-Users] using a flat device tree to drive u-boot
	config]
Date: Tue, 29 Jul 2008 09:27:11 -0500
Message-ID: <488F28BF.6030902@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



-------- Original Message --------
Subject: Re: [U-Boot-Users] using a flat device tree to drive u-boot config
Date: Mon, 28 Jul 2008 13:59:21 -0500
From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
To: Ben Warren <biggerbadderben-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: u-boot-users-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org Users <u-boot-users-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Ben Warren wrote:
> Uh, yeah.  I like the idea of a central repo for hardware info, and
> the device tree concept is good.  My point is that the syntax, while
> concise and exact, can be intimidating.  Just look at the amount of
> traffic on the mailing lists of people that don't understand what all
> the fields mean when specifying IRQs etc.  Anything we can do to make
> it less so for noobies is a good thing for everybody.

Sure, no argument there -- enhancing the dts syntax with symbolic 
constants, computational expressions, and macros should make things like 
interrupt specifiers and maps a lot clearer.

-Scott
