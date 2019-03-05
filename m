From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Tue, 5 Mar 2019 09:19:31 +0800
Message-ID: <1551748771.12020.36.camel@mhfsdcap03>
References: <1550561795-31132-1-git-send-email-min.guo@mediatek.com>
         <1550561795-31132-2-git-send-email-min.guo@mediatek.com>
         <20190222164923.GA26413@bogus> <1551058604.12020.34.camel@mhfsdcap03>
         <CAL_JsqKb_afdZFaOoB5yvs2hX-T9HPVy_d30zu7f7yiqaRPaLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKb_afdZFaOoB5yvs2hX-T9HPVy_d30zu7f7yiqaRPaLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, 2019-03-04 at 11:42 -0600, Rob Herring wrote:
> On Sun, Feb 24, 2019 at 7:36 PM Min Guo <min.guo@mediatek.com> wrote:
> >
> > Hi Rob,
> > On Fri, 2019-02-22 at 10:49 -0600, Rob Herring wrote:
> > > On Tue, Feb 19, 2019 at 03:36:30PM +0800, min.guo@mediatek.com wrote:
> > > > From: Min Guo <min.guo@mediatek.com>
> > > >
> > > > This adds support for MediaTek musb controller in
> > > > host, peripheral and otg mode.
> > > >
> > > > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > > > ---
> > > > changes in v5:
> > > > suggested by Rob:
> > > > 1. Modify compatible as
> > > > - compatible : should be one of:
> > > >                "mediatek,mt-2701"
> > > >                ...
> > > >                followed by "mediatek,mtk-musb"
> > > > 2. Add usb connector child node
> > > >
> > > > changes in v4:
> > > > suggested by Sergei:
> > > > 1. String alignment
> > > >
> > > > changes in v3:
> > > > 1. no changes
> > > >
> > > > changes in v2:
> > > > suggested by Bin:
> > > > 1. Modify DRC to DRD
> > > > suggested by Rob:
> > > > 2. Drop the "<soc-model>-musb" in compatible
> > > > 3. Remove phy-names
> > > > 4. Add space after comma in clock-names
> > > > ---
> > > >  .../devicetree/bindings/usb/mediatek,musb.txt      | 54 ++++++++++++++++++++++
> > > >  1 file changed, 54 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > > > new file mode 100644
> > > > index 0000000..0632e6e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > > > @@ -0,0 +1,54 @@
> > > > +MediaTek musb DRD/OTG controller
> > > > +-------------------------------------------
> > > > +
> > > > +Required properties:
> > > > + - compatible      : should be one of:
> > > > +                     "mediatek,mt-2701"
> > >
> > > That looks like a top-level SoC compatible and doesn't match the
> > > example.
> > "mediatek,mt-2701" is an example, just to describe a specific SOC.
> > May I modify compatibel like:
> > compatible : should be "mediatek,mtk-musb"
> 
> No, you should fix the example adding "mediatek,mtk-musb".
OK.

> Rob

Regards,
Min.
