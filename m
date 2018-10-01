From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v4 3/7] [media] ad5820: DT new optional field enable-gpios
Date: Mon, 1 Oct 2018 10:20:23 +0200
Message-ID: <CAPybu_0CCco6M6A1JsGUTo2P7rvqN1qPnMmuee7UsXxdkmaNBw@mail.gmail.com>
References: <20180920204751.29117-1-ricardo.ribalda@gmail.com>
 <20180920204751.29117-3-ricardo.ribalda@gmail.com> <20180927182311.GA27227@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927182311.GA27227@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob
On Thu, Sep 27, 2018 at 8:23 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 20, 2018 at 10:47:47PM +0200, Ricardo Ribalda Delgado wrote:
> > Document new enable-gpio field. It can be used to disable the part
>
> enable-gpios
>
> > without turning down its regulator.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ad5820.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
> > index 5940ca11c021..9ccd96d3d5f0 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
> > @@ -8,6 +8,12 @@ Required Properties:
> >
> >    - VANA-supply: supply of voltage for VANA pin
> >
> > +Optional properties:
> > +
> > +   - enable-gpios : GPIO spec for the XSHUTDOWN pin. Note that the polarity of
> > +the enable GPIO is the opposite of the XSHUTDOWN pin (asserting the enable
> > +GPIO deasserts the XSHUTDOWN signal and vice versa).
>
> shutdown-gpios is also standard and seems like it would make more sense
> here. Yes, it is a bit redundant to have both, but things just evolved
> that way and we don't want to totally abandon the hardware names (just
> all the variants).
>

Sorry to insist

The pin is called xshutdown, not shutdown and is inverse logic,
Wouldnt it make more sense to use the name
enable-gpios?

Regards

> Rob



-- 
Ricardo Ribalda
