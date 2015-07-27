From: Manoil Claudiu <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and
 eTSEC2
Date: Mon, 27 Jul 2015 16:09:26 +0000
Message-ID: <BY2PR0301MB07278CDB98082971F6094FD19C8E0@BY2PR0301MB0727.namprd03.prod.outlook.com>
References: <20150713133138.GO23464@tiger>
 <1436888777-29742-1-git-send-email-claudiu.manoil@freescale.com>
 <20150727142816.GP12927@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150727142816.GP12927@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Huan Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Monday, July 27, 2015 5:28 PM
> To: Manoil Claudiu-B08782
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Wang Huan-B18965
> Subject: Re: [PATCH v2] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and
> eTSEC2
> 
[...]
> >
> >  .../devicetree/bindings/net/fsl-tsec-phy.txt       |  6 +-
> 
> Bindings doc should be a separate patch reviewed by device tree
> maintainers.
> 
> >  arch/arm/boot/dts/ls1021a-qds.dts                  | 20 +++++
> >  arch/arm/boot/dts/ls1021a-twr.dts                  | 20 +++++
> >  arch/arm/boot/dts/ls1021a.dtsi                     | 92
> ++++++++++++++++++++++
> 
> Please separate soc level dts changes from board level changes.
> 

Ok, will break this in 3 patches (soc, boards, bindings), trimmed down as much as possible,
with remaining findings addressed.  Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
