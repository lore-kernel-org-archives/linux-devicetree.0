From: Manoil Claudiu <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and eTSEC2
Date: Mon, 13 Jul 2015 10:47:49 +0000
Message-ID: <DM2PR03MB414BBD64BBDEB22DB0981619C9C0@DM2PR03MB414.namprd03.prod.outlook.com>
References: <1435213498-21025-1-git-send-email-b18965@freescale.com>
 <20150712065101.GA14354@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150712065101.GA14354@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Huan Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Sunday, July 12, 2015 9:51 AM
> To: Wang Huan-B18965
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Manoil Claudiu-B08782;
> Wang Huan-B18965
> Subject: Re: [PATCH] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and
> eTSEC2
> 
> On Thu, Jun 25, 2015 at 02:24:58PM +0800, Alison Wang wrote:
> > @@ -391,6 +394,85 @@
> >  			reg = <0x0 0x2d24000 0x0 0x4000>;
> >  		};
> >
> > +		enet0: ethernet@2d10000 {
> 
> Most of the vendor specific properties below are undocumented bindings.
> 
> Shawn
> 

Hi Shawn,

Please note that these properties (with only one exception) were accepted long time ago
and are in use for the upstream powerpc platforms, eg:
$ git grep fsl,num_rx_queues
arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi:    fsl,num_rx_queues = <0x8>;
arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi:    fsl,num_rx_queues = <0x8>;
arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi:    fsl,num_rx_queues = <0x8>;
drivers/net/ethernet/freescale/gianfar.c:                       ret = of_property_read_u32(np, "fsl,num_rx_queues",

So, I think the bindings documentation could be added in a separate, follow-up, patch.

Thanks,
Claudiu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
