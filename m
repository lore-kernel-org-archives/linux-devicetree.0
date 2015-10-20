Return-Path: <ck.hu@mediatek.com>
Message-ID: <1445325731.19417.20.camel@mtksdaap41>
Subject: RE: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT
 properties
From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 20 Oct 2015 15:22:11 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, "; Mark Rutland" <mark.rutland@arm.com>, "; Ian Campbell" <ijc+devicetree@hellion.org.uk>, "; Kumar Gala" <galak@codeaurora.org>, "; David Airlie" <airlied@linux.ie>, Matthias, "Jitao Shi  <jitao.shi@mediatek.com>, ; Thierry Reding" <treding@nvidia.com>, "; Ajay Kumar" <ajaykumar.rs@samsung.com>, "; Inki Dae" <inki.dae@samsung.com>, Rahul, "Sean Paul  <seanpaul@chromium.org>, ; Vincent Palatin" <vpalatin@chromium.org>, "; Andy Yan" <andy.yan@rock-chips.com>, "; Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha, Yingjoe, Eddie Huang <eddie.huang@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Rob:

> -----Original Message-----
> From: Rob Herring [mailto:robh+dt@kernel.org]
> Sent: Friday, October 16, 2015 9:22 PM
> Subject: Re: [RFC 1/2] Dcumentation: bridge: Add documentation for
ps8640
> DT properties
> 
> On Fri, Oct 16, 2015 at 7:15 AM, CK Hu <ck.hu@mediatek.com> wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> >
> > Add documentation for DT properties supported by ps8640 DSI-eDP
> > converter.
> >
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/video/bridge/ps8640.txt    |   48
> ++++++++++++++++++++
> 
> Please move to bindings/display/bridge/.

ok, we will move ps8640.txt to bindings/display/bridge/

> 
> >  1 file changed, 48 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/video/bridge/ps8640.txt
> >
> > diff --git
a/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> > b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> > new file mode 100644
> > index 0000000..450b5df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> > @@ -0,0 +1,48 @@
> > +ps8640-bridge bindings
> > +
> > +Required properties:
> > +       - compatible: "parade,ps8640"
> > +       - reg: first i2c address of the bridge
> > +       - power-gpios: OF device-tree gpio specification for power
pin.
> > +       - reset-gpios: OF device-tree gpio specification for reset
pin.
> > +       - mode-sel-gpios: OF device-tree gpio specification for
mode-sel
> pin.
> > +       - ps8640-1v2-supply: OF device-tree regulator specification
for
> 1v2.
> > +       - ps8640-3v3-supply: OF device-tree regulator specification
for
> 3v3.
> 
> As others have said, I would drop the part number and name them based
on
> the supply name (e.g. vdd?, vcore?).

yes, we should use vdd12-supply and vdd33-supply, we'll fixed it in next
patch.

> 
> > +
> > +Optional properties:
> > +       - video interfaces: Device node can contain video interface
port
> > +                           nodes for panel according to [1].
> 
> I don't think this should be optional.
> 

yes, we will fix it in next patch.

> >
