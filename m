From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/3] pci:aer: add support aer interrupt with none
 MSI/MSI-X/INTx mode
Date: Tue, 20 Sep 2016 20:39:26 +0800
Message-ID: <20160920123926.GA3744@tiger>
References: <1472625442-23309-2-git-send-email-po.liu@nxp.com>
 <1473741659-17618-1-git-send-email-po.liu@nxp.com>
 <1473741659-17618-3-git-send-email-po.liu@nxp.com>
 <20160918005212.GF15478@tiger>
 <VI1PR0401MB1709F91B0C1EB6C80D741E4492F50@VI1PR0401MB1709.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB1709F91B0C1EB6C80D741E4492F50-9IDQY6o3qQhWumToEB7uiI3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, "M.H. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2016 at 03:37:27AM +0000, Po Liu wrote:
> Hi Shawn,
> 
> 
> >  -----Original Message-----
> >  From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> >  Sent: Sunday, September 18, 2016 8:52 AM
> >  To: Po Liu
> >  Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> >  linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Roy Zang; Arnd
> >  Bergmann; Marc Zyngier; Stuart Yoder; Leo Li; M.H. Lian; Murali
> >  Karicheri; Bjorn Helgaas; Mingkai Hu
> >  Subject: Re: [PATCH v5 3/3] pci:aer: add support aer interrupt with none
> >  MSI/MSI-X/INTx mode
> >  
> >  On Tue, Sep 13, 2016 at 12:40:59PM +0800, Po Liu wrote:
> >  > On some platforms, root port doesn't support MSI/MSI-X/INTx in RC mode.
> >  > When chip support the aer interrupt with none MSI/MSI-X/INTx mode,
> >  > maybe there is interrupt line for aer pme etc. Search the interrupt
> >  > number in the fdt file. Then fixup the dev->irq with it.
> >  >
> >  > Signed-off-by: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
> >  
> >  Will the new kernel work with existing/old DTB?  I'm trying to
> >  understand the dependency between driver and DTS changes.
> 
> Yes, We've never use name 'intr' before. So we remove it is ok. 
> 'aer' is a dts name for researching it's true interrupt number by kernel. This patch is first time to use name 'aer'. So it must be compatible with existing/old DTB.

Does that mean driver and DTS changes can go through separate trees,
i.e. PCI and arm-soc, without introducing regressions on either tree?
Or does the patch series needs to go in as a whole?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
