From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc: make the padding for the device tree a
	configurable option
Date: Wed, 19 May 2010 16:33:50 -0500
Message-ID: <4BF4593E.8030101@freescale.com>
References: <1274298809-12772-1-git-send-email-timur@freescale.com>
	<1274304013.1931.6.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1274304013.1931.6.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Benjamin Herrenschmidt wrote:

>> So to accommodate future boards where more padding is needed, we make the
>> option for the -p parameter configurable.
> 
> Can't u-boot just allocate more space ?

Yes and no.  U-Boot has functions to increase the size of an fdt, but these
functions can't be sure that the fdt will grow beyond its allocated space.
So if U-Boot calls fdt_setprop() or fdt_add_subnode(), and there isn't
enough space in the fdt, those functions will return with an error.

The problem with growing the fdt is that the function which does this
(fdt_open_into) cannot guarantee that the fdt will grow too large and
overwrite the end of whatever allocated memory it's in.

I had a long argument with Wolfgang on this (see "libfdt: make
fdt_increase_size() available to everyone"), and he says he'll reject any
patch that can't guarantee that fdt_open_into() won't grow too large.  He'll
also reject any patch that uses a macro constant to reserve this space, even
if I use that constant to ensure that fdt_open_into() won't do anything bad.

So in other words, U-Boot could allocate more space, but Wolfgang won't let it.

-- 
Timur Tabi
Linux kernel developer at Freescale
