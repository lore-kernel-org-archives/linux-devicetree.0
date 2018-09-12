From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 7/8] regulator: bd718XX use pickable ranges
Date: Wed, 12 Sep 2018 10:41:35 +0300
Message-ID: <20180912074135.GB2381@localhost.localdomain>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <6fa8728de34a18623736d3b01537930eda2dd54e.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <20180911135549.GS4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911135549.GS4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Sep 11, 2018 at 02:55:49PM +0100, Lee Jones wrote:
> On Wed, 29 Aug 2018, Matti Vaittinen wrote:
> 
> > Few regulators in BD71837 and BD71847 can output voltages from
> > different voltage ranges. Register interface is arranged so that
> > used range is selected by toggling bits which are not next to actual
> > voltage selection bits. Then the voltage inside selected range is
> > determined by voltage selection bits (as usual). Support BD71837
> > and BD71847 selectible range voltages using new pickable ranges
> > helpers.
> 
> [...]
> 
> > diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
> > index d1730b97ba52..4cc617047d5f 100644
> > --- a/include/linux/mfd/rohm-bd718x7.h
> > +++ b/include/linux/mfd/rohm-bd718x7.h
> > @@ -7,13 +7,13 @@
> >  #include <linux/regmap.h>
> >  
> >  enum {
> > -	BD718XX_TYPE_BD71837,
> > +	BD718XX_TYPE_BD71837 = 0,
> >  	BD718XX_TYPE_BD71847,
> >  	BD718XX_TYPE_AMNT // Keep this as last item
> >  };
> >  
> >  enum {
> > -	BD718XX_BUCK1	=	0,
> > +	BD718XX_BUCK1 = 0,
> >  	BD718XX_BUCK2,
> >  	BD718XX_BUCK3,
> >  	BD718XX_BUCK4,
> > @@ -31,31 +31,27 @@ enum {
> >  	BD718XX_REGULATOR_MAX,
> >  };
> 
> Even though I don't care enough to NACK the patch, the above are
> unrelated changes and should normally be contained in a separate
> patch.

Thanks. But as I am going to modify the patch set anyways I can do this
change in first patch for the series. You're right that it is more
appropriate place for this change.

> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> -- 
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
