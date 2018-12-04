From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/3] usb: chipidea: imx: support configuring for
 active low oc signal
Date: Tue, 4 Dec 2018 09:52:50 +0100
Message-ID: <20181204085250.o4vaviz7ta43zpfo@pengutronix.de>
References: <20181204083131.12524-1-u.kleine-koenig@pengutronix.de>
 <20181204083131.12524-2-u.kleine-koenig@pengutronix.de>
 <ce751026-d61f-400e-cb5d-abd9d45dc05f@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ce751026-d61f-400e-cb5d-abd9d45dc05f@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Peter Chen <Peter.Chen@nxp.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org, Matthew Starr <mstarr@hedonline.com>, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Stefan,

On Tue, Dec 04, 2018 at 09:40:26AM +0100, Stefan Wahren wrote:
> Am 04.12.18 um 09:31 schrieb Uwe Kleine-K=F6nig:
> > The status quo on i.MX6 is that if "over-current-active-high" is
> > specified in the device tree this is configured as expected. If
> > the property is missing polarity isn't changed and so the
> > polarity is kept as setup by the bootloader. Reset default is
> > active high, so active low can only be used with help by the
> > bootloader. On i.MX7 it is similar, but there disabling of
> > over current detection has a similar inconsistency.
> >
> > This patch introduces a new property that allows to explicitly
> > configure for active low over current detection and consistently
> > sets this up. In the absence of an explicit configuration the
> > bit is kept as is. On i.MX7 over current detection is used unless
> > disabled in the device tree.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  .../devicetree/bindings/usb/ci-hdrc-usb2.txt  |  5 ++--
> >  drivers/usb/chipidea/ci_hdrc_imx.c            | 16 ++++++++---
> >  drivers/usb/chipidea/ci_hdrc_imx.h            |  8 +++++-
> >  drivers/usb/chipidea/usbmisc_imx.c            | 28 ++++++++++++++-----
> >  4 files changed, 43 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/D=
ocumentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > index 529e51879fb2..c32f6e983cf6 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > @@ -87,8 +87,9 @@ i.mx specific properties
> >  - fsl,usbmisc: phandler of non-core register device, with one
> >    argument that indicate usb controller index
> >  - disable-over-current: disable over current detect
> > -- over-current-active-high: over current signal polarity is high activ=
e,
> > -  typically over current signal polarity is low active.
> > +- over-current-active-low: over current signal polarity is active low.
> > +- over-current-active-high: over current signal polarity is active hig=
h.
> > +  It's recommended to specify the over current polarity.
> >  - external-vbus-divider: enables off-chip resistor divider for Vbus
> >  =

> >  Example:
> =

> thanks for making this configurable. But shouldn't this be a separate
> patch and reviewed by the devicetree guys?

I'm not sure about the separate patch part. My impression is it depends
on the maintainer if a change to the binding (opposed to the
introduction of a binding) should be separate or not.

But for the review you are right, I added the dt people to Cc for them
to comment. In v2 Matthew also noted that he would prefer to handle the
situation when both over-current-active-low and over-current-active-high
were given differently. I think we don't need that as this is a case of
"broken dt" and it doesn't matter much what is done then. (With my patch
we're configuring for active high in that case.) A feedback here would
be great, too.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
