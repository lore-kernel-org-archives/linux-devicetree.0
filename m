From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 7/8] regulator: bd718XX use pickable ranges
Date: Tue, 11 Sep 2018 14:55:49 +0100
Message-ID: <20180911135549.GS4185@dell>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <6fa8728de34a18623736d3b01537930eda2dd54e.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fa8728de34a18623736d3b01537930eda2dd54e.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Wed, 29 Aug 2018, Matti Vaittinen wrote:

> Few regulators in BD71837 and BD71847 can output voltages from
> different voltage ranges. Register interface is arranged so that
> used range is selected by toggling bits which are not next to actual
> voltage selection bits. Then the voltage inside selected range is
> determined by voltage selection bits (as usual). Support BD71837
> and BD71847 selectible range voltages using new pickable ranges
> helpers.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/regulator/bd71837-regulator.c | 155 +++++++++++++++++++++++++++-------
>  include/linux/mfd/rohm-bd718x7.h      |  38 +++++----
>  2 files changed, 147 insertions(+), 46 deletions(-)

[...]

> diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
> index d1730b97ba52..4cc617047d5f 100644
> --- a/include/linux/mfd/rohm-bd718x7.h
> +++ b/include/linux/mfd/rohm-bd718x7.h
> @@ -7,13 +7,13 @@
>  #include <linux/regmap.h>
>  
>  enum {
> -	BD718XX_TYPE_BD71837,
> +	BD718XX_TYPE_BD71837 = 0,
>  	BD718XX_TYPE_BD71847,
>  	BD718XX_TYPE_AMNT // Keep this as last item
>  };
>  
>  enum {
> -	BD718XX_BUCK1	=	0,
> +	BD718XX_BUCK1 = 0,
>  	BD718XX_BUCK2,
>  	BD718XX_BUCK3,
>  	BD718XX_BUCK4,
> @@ -31,31 +31,27 @@ enum {
>  	BD718XX_REGULATOR_MAX,
>  };

Even though I don't care enough to NACK the patch, the above are
unrelated changes and should normally be contained in a separate
patch.

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
