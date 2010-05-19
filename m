From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc: make the padding for the device tree a
	configurable option
Date: Thu, 20 May 2010 08:44:10 +1000
Message-ID: <1274309050.1931.21.camel@pasglop>
References: <1274298809-12772-1-git-send-email-timur@freescale.com>
	<1274304013.1931.6.camel@pasglop>  <4BF4593E.8030101@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BF4593E.8030101-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2010-05-19 at 16:33 -0500, Timur Tabi wrote:
> Benjamin Herrenschmidt wrote:
> 
> >> So to accommodate future boards where more padding is needed, we make the
> >> option for the -p parameter configurable.
> > 
> > Can't u-boot just allocate more space ?
> 
> Yes and no.  U-Boot has functions to increase the size of an fdt, but these
> functions can't be sure that the fdt will grow beyond its allocated space.
> So if U-Boot calls fdt_setprop() or fdt_add_subnode(), and there isn't
> enough space in the fdt, those functions will return with an error.

 .../...

It's still not kernel business to have to deal with u-boot memory
allocation constraints. The padding in the kernel built is intended to
make space for DT changes done by the zImage wrapper.

Maybe we could add to libfdt a way to provide a realloc() callback to it
when it hits the max size, and uboot can then move things around (or
fail).

Ben.
