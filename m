Return-Path: <ck.hu@mediatek.com>
Message-ID: <1445324564.19417.13.camel@mtksdaap41>
Subject: RE: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT
 properties
From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 20 Oct 2015 15:02:44 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, "; Pawel Moll" <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "; Kumar Gala" <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "; Jitao Shi" <jitao.shi@mediatek.com>, Thierry, Ajay, Inki, Rahul Sharma <rahul.sharma@samsung.com>, "; Sean Paul" <seanpaul@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, "; Russell King" <rmk+kernel@arm.linux.org.uk>, "; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;"  dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha, "Yingjoe Chen  <yingjoe.chen@mediatek.com>, ; Eddie Huang" <eddie.huang@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Philipp:

> -----Original Message-----
> From: Philipp Zabel [mailto:p.zabel@pengutronix.de]
> Sent: Friday, October 16, 2015 9:09 PM
> Subject: Re: [RFC 1/2] Dcumentation: bridge: Add documentation for
ps8640
> DT properties
> 
> Hi CK,
> 
> there is a typo in the subject: s/Dcumentation/Documentation/.

We will correct next patch.

> 
> Am Freitag, den 16.10.2015, 20:15 +0800 schrieb CK Hu:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> >
> > Add documentation for DT properties supported by ps8640 DSI-eDP
> > converter.
> >
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> [...]
> > +	- ps8640-1v2-supply: OF device-tree regulator specification for
1v2.
> > +	- ps8640-3v3-supply: OF device-tree regulator specification for
3v3.
> 
> The ps8640- part of the regulator supply property names is redundant.
> The PS8622 driver uses vdd12-supply as its regulator. Should we strive
for
> consistency here? Or if you have access to the datasheet, how are
these inputs
> called there?

yes, we should use vdd12-supply and vdd33-supply, we'll fixed it in next
patch.

> 
> > +
> > +Optional properties:
> > +	- video interfaces: Device node can contain video interface port
> > +			    nodes for panel according to [1].
> > +
> > +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> 
> It should be documented here that port@0 is the input port and port@1
is the
> output port.

Yes, port@0 is the input port and port@1 is the output port. We'll add
the info in next patch.

> 
> best regards
> Philipp
