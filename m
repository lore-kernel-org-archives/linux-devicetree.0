From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 4/4] drm/layerscape: Add HDMI driver for freescale DCU
Date: Wed, 3 Feb 2016 03:23:35 +0000
Message-ID: <HE1PR04MB105133BFC2DBAC3EB1CB715BECD00@HE1PR04MB1051.eurprd04.prod.outlook.com>
References: <1453780833-32289-1-git-send-email-meng.yi@nxp.com>
 <1453780833-32289-4-git-send-email-meng.yi@nxp.com>
 <20160129025156.GA26113@rob-hp-laptop>
 <HE1PR04MB105182735A413F11D6704A7CECDF0@HE1PR04MB1051.eurprd04.prod.outlook.com>
 <63270b7f7015d99be2cb10377c976b31@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63270b7f7015d99be2cb10377c976b31-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,
    I will take PTO during Chinese Spring Festival, and I will rebase my patches according to your tree and send out after 2/16/2016 ^_^
BR 
Meng

> On Wednesday, February 03, 2016 5:56 AM, Stefan Agner [stefan-XLVq0VzYD2Y@public.gmane.org] wrote:
> 
> Hi Meng Yi,
> 
> I plan to review the patchset too, but did not come around yet.
> 
> The forth patch conflicts with my changes in the DRM DCU driver. Since it will
> likely go through my tree, please base v2 ontop of my DCU
> branch:
> http://git.agner.ch/gitweb/?p=linux-drm-fsl-dcu.git;a=summary
> 
> --
> Stefan
> 
> On 2016-02-02 01:53, Meng Yi wrote:
> > Hi Rob
> >     Thanks for your reply. I will correct those soon, and then send v2 out.
> > BR
> > Meng Yi
> >
> >> On Friday, January 29, 2016 10:52 AM, Rob Herring[robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org] wrote:
> >
> >> > +The SiI9022A is an ultra low-power HDMI transmitter. It supports
> >> > +resolutions from standard definition 480i/p and 576i/p all the way
> >> > +to high-definition 720p, 1080i, and 1080p, the highest resolution
> >> > +supported by HDTVs today. It also supports all
> >>
> >> Well, we're up to 4K now...
> >
> >> > +            ports {
> >> > +                    #address-cells = <1>;
> >> > +                    #size-cells = <0>;
> >> > +
> >> > +                    port@0 {
> >> > +                            reg = <1>;
> >>
> >> Your unit address (0) and reg don't match.
> >>
> >> > +                            sii9022_out: endpoint {
> >> > +                                    remote-endpoint = <&hdmi_con>;
> >> > +                            };
> >>
> >> This needs to have a port for the input for the connection to your
> >> display controller.
> >>
> >> > +                    };
> >> > +            };
> >> > +    };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
