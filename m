From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: media: Add Renesas R-Car DRIF binding
Date: Tue, 10 Jan 2017 01:09:28 +0200
Message-ID: <4506041.7mPt4W6j0m@avalon>
References: <1478706284-59134-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com> <HK2PR06MB05453E11C8931F881E106939C36E0@HK2PR06MB0545.apcprd06.prod.outlook.com> <cca1ade8-01ef-8eab-f4b1-7dd7f204fdea@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cca1ade8-01ef-8eab-f4b1-7dd7f204fdea-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Hans,

On Monday 09 Jan 2017 14:36:55 Hans Verkuil wrote:
> On 01/03/2017 04:20 PM, Ramesh Shanmugasundaram wrote:
> >>> On Wednesday 21 Dec 2016 08:10:37 Ramesh Shanmugasundaram wrote:
> >>>> Add binding documentation for Renesas R-Car Digital Radio Interface
> >>>> (DRIF) controller.
> >>>> 
> >>>> Signed-off-by: Ramesh Shanmugasundaram
> >>>> <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> ---
> >>>> 
> >>>>  .../devicetree/bindings/media/renesas,drif.txt     | 202 +++++++++++++
> >>>>  1 file changed, 202 insertions(+)
> >>>>  create mode 100644
> >>>> 
> >>>> Documentation/devicetree/bindings/media/renesas,drif.txt
> >>>> 
> >>>> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt
> >>>> b/Documentation/devicetree/bindings/media/renesas,drif.txt new file
> >>>> mode 100644
> >>>> index 0000000..1f3feaf
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
> >>>> 
> >>>> +Optional properties of an internal channel when:
> >>>> +     - It is the only enabled channel of the bond (or)
> >>>> +     - If it acts as primary among enabled bonds
> >>>> +--------------------------------------------------------
> >>>> +- renesas,syncmd       : sync mode
> >>>> +                      0 (Frame start sync pulse mode. 1-bit width
> >>>> pulse
> >>>> +                         indicates start of a frame)
> >>>> +                      1 (L/R sync or I2S mode) (default)
> >>>> +- renesas,lsb-first    : empty property indicates lsb bit is received
> >>>> first.
> >>>> +                      When not defined msb bit is received first
> >>>> +(default)
> >>>> +- renesas,syncac-active: Indicates sync signal polarity, 0/1 for
> >>>> low/high
> 
> Shouldn't this be 'renesas,sync-active' instead of syncac-active?
> 
> I'm not sure if syncac is intended or if it is a typo.
> 
> >>>> +                      respectively. The default is 1 (active high)
> >>>> +- renesas,dtdl         : delay between sync signal and start of
> >>>> reception.
> >>>> +                      The possible values are represented in 0.5 clock
> >>>> +                      cycle units and the range is 0 to 4. The default
> >>>> +                      value is 2 (i.e.) 1 clock cycle delay.
> >>>> +- renesas,syncdl       : delay between end of reception and sync
> >>>> signal edge.
> >>>> +                      The possible values are represented in 0.5 clock
> >>>> +                      cycle units and the range is 0 to 4 & 6. The
> >>>> default
> >>>> +                      value is 0 (i.e.) no delay.
> >>> 
> >>> Most of these properties are pretty similar to the video bus
> >>> properties defined at the endpoint level in
> >>> Documentation/devicetree/bindings/media/video-interfaces.txt. I
> >>> believe it would make sense to use OF graph and try to standardize
> >>> these properties similarly.
> 
> Other than sync-active, is there really anything else that is similar? And
> even the sync-active isn't a good fit since here there is only one sync
> signal instead of two for video (h and vsync).

That's why I said similar, not identical :-) My point is that, if we consider 
that we could connect multiple sources to the DRIF, using OF graph would make 
sense, and the above properties should then be defined per endpoint. If we 
define them per endpoint we should then also try standardize the ones that are 
not really Renesas-specific (that's at least syncac-active). For the syncmd 
and lsb-first properties, it could also make sense to query them from the 
connected subdev at runtime, as they're similar in purpose to formats and 
media bus configuration (struct v4l2_mbus_config).

I'm not an SDR expert, so I'd like to have your opinion on this.

> >> Note that the last two properties match the those in
> >> Documentation/devicetree/bindings/spi/sh-msiof.txt.
> >> We may want to use one DRIF channel as a plain SPI slave with the
> >> (modified) MSIOF driver in the future.
> > 
> > Should I leave it as it is or modify these as in video-interfaces.txt?
> > Shall we conclude on this please?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
