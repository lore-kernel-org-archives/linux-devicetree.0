From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 4/8] mfd: dt bindings: add BD71847 device-tree binding
 documentation
Date: Wed, 12 Sep 2018 10:43:06 +0300
Message-ID: <20180912074306.GC2381@localhost.localdomain>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <09eceb20f4f05ac48c6767d5f3359743e5b98985.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <20180911134947.GQ4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911134947.GQ4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 11, 2018 at 02:49:47PM +0100, Lee Jones wrote:
> On Wed, 29 Aug 2018, Matti Vaittinen wrote:
> 
> > Add ROHM BD71847 Power Management IC MFD binding information to
> > device-tree binding documents.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt       | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> > index 3ca56fdb5ffe..d78172878faa 100644
> > --- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> > +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> > @@ -1,16 +1,17 @@
> > -* ROHM BD71837 Power Management Integrated Circuit bindings
> > +* ROHM BD71837 and BD71847 Power Management Integrated Circuit bindings
> >  
> > -BD71837MWV is a programmable Power Management IC for powering single-core,
> > -dual-core, and quad-core SoCs such as NXP-i.MX 8M. It is optimized for
> > -low BOM cost and compact solution footprint. It integrates 8 Buck
> > -egulators and 7 LDOs to provide all the power rails required by the SoC and
> > -the commonly used peripherals.
> > +BD71837MWV and BD71847MWV are programmable Power Management ICs for powering
> > +single-core, dual-core, and quad-core SoCs such as NXP-i.MX 8M. They are
> > +optimized for low BOM cost and compact solution footprint. BD71837MWV
> > +integrates 8 Buck regulators and 7 LDOs. BD71847MWV contains 6 Buck regulators
> > +and 6 LDOs.
> >  
> > -Datasheet for PMIC is available at:
> > +Datasheet for BD71837 is available at:
> >  https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e
> >  
> >  Required properties:
> > - - compatible		: Should be "rohm,bd71837".
> > + - compatible		: Should be "rohm,bd71837" for bd71837 and
> > +			  "rohm,bd71847" for bd71847.
> 
> Nit: Probably sightly clearer as:
> 
> > + - compatible		: Should be "rohm,bd71837" for bd71837
> > +			                    "rohm,bd71847" for bd71847.

I think you're correct. I can change this while resending the series
anyways.

> 
> Apart from that:
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> -- 
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
