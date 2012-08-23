From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/7] mfd: add imx syscon driver based on regmap
Date: Thu, 23 Aug 2012 15:06:58 +0800
Message-ID: <20120823070657.GE10057@shlinux2.ap.freescale.net>
References: <1345619928-15446-1-git-send-email-b29396@freescale.com>
 <1345619928-15446-2-git-send-email-b29396@freescale.com>
 <20120822082940.GJ4011@b20223-02.ap.freescale.net>
 <20120822105729.GB10057@shlinux2.ap.freescale.net>
 <5035BCB1.8000801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5035BCB1.8000801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2012 at 01:16:33PM +0800, Stephen Warren wrote:
> On 08/22/2012 04:57 AM, Dong Aisheng wrote:
> > On Wed, Aug 22, 2012 at 04:29:41PM +0800, Zhao Richard-B20223 wrote:
> >> On Wed, Aug 22, 2012 at 03:18:42PM +0800, Dong Aisheng wrote:
> >>> Add regmap based imx syscon driver.
> >>> This is usually used for access misc bits in registers which does not belong
> >>> to a specific module, for example, IOMUXC GPR and ANATOP.
> >>> With this driver, we provide a standard API for client driver to call to
> >>> access registers which are registered into syscon.
> 
> >>> +static int imx_syscon_match(struct device *dev, void *data)
> >>> +{
> >>> +	struct imx_syscon *syscon = dev_get_drvdata(dev);
> >>> +	struct device_node *dn = data;
> >>> +
> >>> +	return (syscon->dev->of_node == dn) ? 1 : 0;
> >>> +}
> >>> +
> >>> +int imx_syscon_write(struct device_node *np, u32 reg, u32 val)
> >>
> >> For API function, is it better to use struct device rather not np?
> >>  - it won't need to search dev in below code every time it access
> >>    registers.
> >
> > The purpose is not require client driver to know the implementation details
> > of imx_syscon_{read/write} API, it's more easy to use since client only
> > needs pass the device node to which it wants to read/write.
> > 
> > For search dev, it doesn't look like a big issue since it only search devices
> > attached on the driver which is very quick.
> > And hide it in common API does not require every client driver to write
> > duplicated codes.
> 
> You could still implement a function:
> 
> struct device *imx_syscon_lookup(struct device_node *np)
> 
> ... and require all clients to call that, and pass the dev to the other
> functions. That'd still keep all the lookup code in one place, but
> prevent it having to run every time, no matter how small it is.
> 
> I think such an API is required anyway, since client drivers need some
> way to determine whether the imx_syscon driver is available yet, and if
> not defer their probe until it is.
> 
> So, clients would do:
> 
> foo->syscon_dev = imx_syscon_lookup(np);
> if (!foo->syscon_dev)
>     return -EPROBE_DEFER;
> 
> rather than:
> 
> foo->syscon_np = np;
> 
> Not too much overhead/boiler-plate in each client driver.
> 
Looks like a good idea.

Regards
Dong Aisheng
