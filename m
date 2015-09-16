From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
Date: Tue, 15 Sep 2015 21:19:15 -0500
Message-ID: <1442369955.2909.166.camel@freescale.com>
References: <1442307339-15225-1-git-send-email-dongsheng.wang@freescale.com>
	 <1442361398.2909.164.camel@freescale.com>
	 <SN1PR0301MB1616C48FB3D990BCA45289AB9D5B0@SN1PR0301MB1616.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SN1PR0301MB1616C48FB3D990BCA45289AB9D5B0-VLIetriUNobRRq1t3zq48ZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Dongsheng-B40534 <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Wang Huan-B18965 <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jin Zhengxiong-R64188 <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Chenhui-B35336 <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian-B29983 <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-15 at 21:15 -0500, Wang Dongsheng-B40534 wrote:
> Hi Scott,
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Wednesday, September 16, 2015 7:57 AM
> > To: Wang Dongsheng-B40534
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Wang Huan-
> > B18965; Jin
> > Zhengxiong-R64188; Zhao Chenhui-B35336; Tang Yuantian-B29983
> > Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
> > 
> > On Tue, 2015-09-15 at 16:55 +0800, Dongsheng Wang wrote:
> > > +* Freescale RCPM Wakeup Source Device Tree Bindings
> > > +-------------------------------------------
> > > +Required rcpm-wakeup property should be added to a device node if the
> > > device
> > > +can be used as a wakeup source.
> > > +
> > > +  - rcpm-wakeup: The value of the property consists of 3 cells. The 
> > > first
> > > cell
> > > +     is a pointer to the rcpm node, the second cell is the bit mask 
> > > that
> > > +     should be set in IPPDEXPCR0, and the last cell is for IPPDEXPCR1.
> > > +     Note: If the platform has no IPPDEXPCR1 register, put a zero here.
> > 
> > What if a future platform has more than two of these registers?
> 
> Those registers are only used for wakeup device, we have a lot of available 
> bit
> for feature. For example, In LS1021a platform only 7bits has used in the 
> registers,
> and 57bits is reserved.

Still, it'd be better to for the rcpm node to advertise the number of cells 
it expects.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
