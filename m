Return-Path: <ck.hu@mediatek.com>
Message-ID: <1445325251.19417.16.camel@mtksdaap41>
Subject: RE: [RFC 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 20 Oct 2015 15:14:11 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>, "; Mark Rutland" <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>, "; Ian Campbell" <ijc+devicetree@hellion.org.uk>, "; Kumar Gala" <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "; Jitao Shi" <jitao.shi@mediatek.com>, Thierry, Ajay, Inki, Rahul Sharma <rahul.sharma@samsung.com>, "; Sean Paul" <seanpaul@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, "; Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha, Yingjoe, Eddie Huang <eddie.huang@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Rob:

> -----Original Message-----
> From: Rob Herring [mailto:robh+dt@kernel.org]
> Sent: Friday, October 16, 2015 9:27 PM
> Subject: Re: [RFC 2/2] drm/bridge: Add I2C based driver for ps8640
bridge
> 
> On Fri, Oct 16, 2015 at 8:06 AM, Mark Rutland <mark.rutland@arm.com>
> wrote:
> >> +     /* FIXME - use of_graph_get_port_by_id(np, 1) on newer
kernels */
> >> +     in_ep = of_graph_get_next_endpoint(np, NULL);
> >
> > Huh?
> >
> >> +     edidp = of_get_property(np, "edid", &size);
> >
> > This property wasn't mentioned in the binding document.
> >
> > Please describe it. If it's from a more generic binding, refer to
that
> > from the binding document.
> 
> It should be generic, but currently documented in individual drivers.
> I also think this is not the right location in the DT for this
property. It should be
> part of the panel or connector node instead.

edid property is the temp solution in develop. We will remove it next
patch.

> 
> Rob
