From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: gnss: add mediatek binding
Date: Tue, 12 Feb 2019 15:18:46 -0600
Message-ID: <CAL_JsqJPhuDDsEMvpVizewTuehOZTc84d+8Hq7o8C+O4UrBjYw@mail.gmail.com>
References: <1548693481-1162-1-git-send-email-lollivier@baylibre.com>
 <1548693481-1162-3-git-send-email-lollivier@baylibre.com> <20190130155016.GA26536@bogus>
 <20190211092251.GV4686@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211092251.GV4686@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 3:23 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Jan 30, 2019 at 09:50:16AM -0600, Rob Herring wrote:
> > On Mon, Jan 28, 2019 at 05:37:59PM +0100, Loys Ollivier wrote:
> > > Add binding for Mediatek-based GNSS receivers.
> > >
> > > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> > > ---
> > >
> > > v3:
> > > Removed the I2C and SPI interfaces references.
> > > Removed the "mediatek,mt3339" compatible line.
> > > Added the optional propertied (reset, fix)
> > > Added the pin names for the optional properties.
> > >
> > > v2:
> > > Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> > > Moved current-speed as an optional propertie.
> > > Removed the status line in the example.
> > > Added "mediatek,mt3339" compatible.
> > >
> > >  .../devicetree/bindings/gnss/mediatek.txt          | 37 ++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
> > > new file mode 100644
> > > index 000000000000..00650d81c5c8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
> > > @@ -0,0 +1,37 @@
> > > +Mediatek-based GNSS Receiver DT binding
> > > +
> > > +Mediatek chipsets are used in GNSS-receiver modules produced by several
> > > +vendors and can use an UART interface.
>
> s/an/a/
>
> > > +
> > > +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> > > +properties.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible       : Must be
> > > +
> > > +                   "globaltop,pa6h"
> > > +
> > > +- vcc-supply       : Main voltage regulator (pin name: VCC)
> > > +
> > > +Optional properties:
> > > +
> > > +- gtop,reset-gpios : GPIO used to reset the device
> > > +                     (pin name: RESET, NRESET)
> >
> > reset-gpios is the standard name.
> >
> > > +- gtop,fix-gpios   : GPIO used to determine device position fix state
> > > +                     (pin name: FIX, 3D_FIX)
>
> I'm thinking we might need a standard name for fix-gpios as well. This
> isn't a feature that is globaltop (or mediatek) specific, and other
> manufacturers provide similar functionality through pins named UI_FIX,
> or even LCKIND (lock indicator).
>
> The pin is typically used to drive an indicator LED AFAIU, but the
> characteristics of the signal varies from device to device (fw to fw),
> for example, pulse when no lock and low otherwise, or pulse when a 2d or
> 3d-fix is acquired, etc.
>
> I'm not sure how useful the pulsing would be for software, but someone
> might find a use for it in some form.
>
> Rob, is this something we want to keep in the binding, and if so, how
> about using a generic name such as "gnss-fix-gpios"?

Sure. As long as details like being a pulse and when the pulse occurs
are implied by compatible string. So we don't get an endless addition
of properties to describe those.

Rob
