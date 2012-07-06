From: Jia Hongtao-B38951 <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
Date: Fri, 6 Jul 2012 06:07:43 +0000
Message-ID: <412C8208B4A0464FA894C5F0C278CD5D01A168F2@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1339148585-16947-1-git-send-email-B38951@freescale.com>
 <4FD60FB1.7050106@gmail.com>
 <412C8208B4A0464FA894C5F0C278CD5D01A16829@039-SN1MPN1-002.039d.mgd.msft.net>
 <20120706042611.GA1841@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120706042611.GA1841-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
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
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Greg KH [mailto:greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org]
> Sent: Friday, July 06, 2012 12:26 PM
> To: Jia Hongtao-B38951
> Cc: Rob Herring; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Li Yang-R58472
> Subject: Re: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
> 
> On Fri, Jul 06, 2012 at 02:05:05AM +0000, Jia Hongtao-B38951 wrote:
> > Hi Rob and Greg KH,
> >
> > Do you have any better idea to avoid duplication probe warning?
> 
> I have no idea what the problem is that you are trying to solve.
> 
> > > On 06/08/2012 04:43 AM, Jia Hongtao wrote:
> > > > We changed the pcie controller driver to platform driver so that
> the
> > > PCI
> > > > of platform devices need to be created earlier in the arch_initcall
> > > stage
> > > > according to the original timing of calling fsl_add_bridge(). So we
> do
> > > PCI
> > > > probing separately from other devices. But probing more than once
> could
> > > > cause duplication warning. We add check if the devices have already
> > > probed
> > > > before probing any devices to avoid duplication warning.
> 
> Ick, something else is going wrong here, how could you ever have the
> same device probed more than once?
> 
> > > > Signed-off-by: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > >
> > > Where's v1 and v2 history?
> > >
> > > >  drivers/of/platform.c |   18 ++++++++++++------
> > > >  1 files changed, 12 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > > > index a37330e..3aab01f 100644
> > > > --- a/drivers/of/platform.c
> > > > +++ b/drivers/of/platform.c
> > > > @@ -139,6 +139,18 @@ struct platform_device *of_device_alloc(struct
> > > device_node *np,
> > > >  	if (!dev)
> > > >  		return NULL;
> > > >
> > > > +	dev->dev.of_node = of_node_get(np);
> > > > +	if (bus_id)
> > > > +		dev_set_name(&dev->dev, "%s", bus_id);
> > > > +	else
> > > > +		of_device_make_bus_id(&dev->dev);
> > > > +
> > > > +	if (kset_find_obj(dev->dev.kobj.kset, kobject_name(&dev-
> >dev.kobj)))
> 
> Whatever you are trying to do here, odds are, it's wrong :)
> 
> What is happening that is causing the problem?  What is causing the
> platform core to be calling probe on a device more than once?
> 
> greg k-h

This is why in some cases we may probe twice:
Firstly, we need to probe pci controller separately. But in KVM different
topology of device tree is used in which pci nodes are not under root node
but under "simple bus". Unfortunately, of_platform_bus_probe() will probe
all the first level nodes under "simple bus" so pci nodes will probe again.

Two ways to solve this problem:
1. All the nodes that need to be probed should just under root.
2. Avoid duplication probe at runtime like this patch did.

I do like the first one but it's hard to changing the traditional way that
exist for a long time.

Also, I think this patch as a workaround is not a perfect way to solve this
problem. So I wonder if you or others have any better solutions.

Thanks.
-Jia Hongtao. 
