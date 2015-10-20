Return-Path: <ck.hu@mediatek.com>
Message-ID: <1445323032.19417.8.camel@mtksdaap41>
Subject: RE: [RFC 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 20 Oct 2015 14:37:12 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, "; Pawel Moll" <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "; David Airlie" <airlied@linux.ie>, Matthias, "Jitao Shi  <jitao.shi@mediatek.com>, ; Thierry Reding" <treding@nvidia.com>, "; Ajay Kumar" <ajaykumar.rs@samsung.com>, "; Inki Dae" <inki.dae@samsung.com>, Rahul, "Sean Paul  <seanpaul@chromium.org>, ; Vincent Palatin" <vpalatin@chromium.org>, "; Andy Yan" <andy.yan@rock-chips.com>, "; Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha, Yingjoe, Eddie Huang <eddie.huang@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Mark:

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Friday, October 16, 2015 9:07 PM
> Subject: Re: [RFC 2/2] drm/bridge: Add I2C based driver for ps8640
bridge
> 
> > +	/* FIXME - use of_graph_get_port_by_id(np, 1) on newer kernels */
> > +	in_ep = of_graph_get_next_endpoint(np, NULL);
> 
> Huh?

ah,Sorry,forget remove it. We will remove /* FIXME - use
of_graph_get_port_by_id(np, 1) on newer kernels */.

> 
> > +	edidp = of_get_property(np, "edid", &size);
> 
> This property wasn't mentioned in the binding document.

edid property is the temp solution in develop. We will remove it next
patch.

> 
> Please describe it. If it's from a more generic binding, refer to that
from the
> binding document.
