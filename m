From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2] drm/fsl-dcu: update the panel dt binding document
Date: Wed, 29 Jun 2016 02:58:13 +0000
Message-ID: <HE1PR04MB1051B76708D9E3F0F3DB4C56EC230@HE1PR04MB1051.eurprd04.prod.outlook.com>
References: <1467106748-19314-1-git-send-email-meng.yi@nxp.com>
 <20160628210748.GA10847@rob-hp-laptop>
 <8e8820c0ccfa8e1348a038959da850f8@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8e8820c0ccfa8e1348a038959da850f8-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org" <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> >>  Optional properties:
> >>  - fsl,tcon:		The phandle to the timing controller node.
> >> @@ -24,6 +24,11 @@ dcu: dcu@2ce0000 {
> >>  	clocks = <&platform_clk 0>, <&platform_clk 0>;
> >>  	clock-names = "dcu", "pix";
> >>  	big-endian;
> >> -	fsl,panel = <&panel>;
> >>  	fsl,tcon = <&tcon>;
> >> +
> >> +	port: port@0 {
> >
> > Drop the unit address. With that,
> 
> I was going to say add a corresponding reg property and specify address-cells.
> 

For now, we only have one 'remote-endpoint', you mean maybe we should
use 'ports' that prepare for multiple connections?

> So is it ok to also create a port without address?
> 

It works fine, I think it is ok.

Best Regards,
Meng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
