From: "Li Yang-R58472" <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 16:59:54 +0800
Message-ID: <3A45394FD742FA419B760BB8D398F9ED59DE33@zch01exm26.fsl.freescale.net>
References: <1250063825.15143.43.camel@pasglop><20090812111954.GB31596@zod.rchland.ibm.com><4A90486C-8BF5-428C-9FD8-830D822C0D40@kernel.crashing.org>
	<1250112599.3587.21.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <1250112599.3587.21.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


>Now, I know there is at least one person on earth 
>contemplating sharing some drivers between PPC and ARM. I 
>won't tell much more at this stage, but it makes sense in the 
>grand scheme of things to see SoC vendors put similar IO cores 
>into either PPC or ARM and providing that clock API is a good 
>way to also allow these drivers to work since the drivers in 
>questions make use of it.

Freescale USB UDC driver is another example that shared between PowerPC
and ARM(i.mx).  Currently, the imx part of the driver uses clk API, but
PowerPC part uses static initialization.  It will be better if we can
unify the clk setting part of the driver.

- Leo
