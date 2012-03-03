From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 5/5 v2] ARM: kirkwood: convert orion-wdt to fdt.
Date: Sat, 3 Mar 2012 10:08:53 +0000
Message-ID: <20120303100853.GK7363@n2100.arm.linux.org.uk>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <e2fe5e97a83fc753559bbb18d5d111ed01b89034.1330709314.git.jason@lakedaemon.net>
 <201203021832.34901.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203021832.34901.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2012 at 06:32:33PM +0000, Arnd Bergmann wrote:
> On Friday 02 March 2012, Jason Cooper wrote:
> > +       wdt_reg = (void __iomem *)TIMER_VIRT_BASE;
> > +
> > +       ret = of_address_to_resource(np, 0, &res);
> > +       if (ret) {
> > +               printk(KERN_ERR "invalid address\n");
> > +               return ret;
> > +       }
> > +
> > +       wdt_reg = ioremap(res.start, res.end - res.start);
> > +
> 
> This will break non-dt uses because you overwrite the wdt_reg value.

Don't also forget that "res.end - res.start" is also not correct, and
resource_size() should be used to prevent that kind of error.
