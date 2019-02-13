From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: gnss: add mediatek binding
Date: Wed, 13 Feb 2019 10:31:21 +0100
Message-ID: <20190213093121.GG28278@localhost>
References: <1548693481-1162-1-git-send-email-lollivier@baylibre.com>
 <1548693481-1162-3-git-send-email-lollivier@baylibre.com>
 <20190130155016.GA26536@bogus>
 <20190211092251.GV4686@localhost>
 <CAL_JsqJPhuDDsEMvpVizewTuehOZTc84d+8Hq7o8C+O4UrBjYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJPhuDDsEMvpVizewTuehOZTc84d+8Hq7o8C+O4UrBjYw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 03:18:46PM -0600, Rob Herring wrote:
> On Mon, Feb 11, 2019 at 3:23 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Jan 30, 2019 at 09:50:16AM -0600, Rob Herring wrote:
> > > On Mon, Jan 28, 2019 at 05:37:59PM +0100, Loys Ollivier wrote:
> > > > Add binding for Mediatek-based GNSS receivers.
> > > >
> > > > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>

> > > > +- gtop,fix-gpios   : GPIO used to determine device position fix state
> > > > +                     (pin name: FIX, 3D_FIX)
> >
> > I'm thinking we might need a standard name for fix-gpios as well. This
> > isn't a feature that is globaltop (or mediatek) specific, and other
> > manufacturers provide similar functionality through pins named UI_FIX,
> > or even LCKIND (lock indicator).
> >
> > The pin is typically used to drive an indicator LED AFAIU, but the
> > characteristics of the signal varies from device to device (fw to fw),
> > for example, pulse when no lock and low otherwise, or pulse when a 2d or
> > 3d-fix is acquired, etc.
> >
> > I'm not sure how useful the pulsing would be for software, but someone
> > might find a use for it in some form.
> >
> > Rob, is this something we want to keep in the binding, and if so, how
> > about using a generic name such as "gnss-fix-gpios"?
> 
> Sure. As long as details like being a pulse and when the pulse occurs
> are implied by compatible string. So we don't get an endless addition
> of properties to describe those.

Agreed, thanks.

Johan
