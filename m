From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: qcom: spmi-gpio: Add support for GPIO
 LV/MV subtype
Date: Mon, 24 Jul 2017 14:07:18 -0500
Message-ID: <20170724190718.be6jxmsn43zzhdlw@rob-hp-laptop>
References: <20170719063136.5300-1-fenglinw@codeaurora.org>
 <20170719063136.5300-2-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170719063136.5300-2-fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wruan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 02:30:45PM +0800, fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
> From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> GPIO LV (low voltage)/MV (medium voltage) subtypes have different
> features and register mappings than 4CH/8CH subtypes. Add support
> for LV and MV subtypes.
> 
> Signed-off-by: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  17 +-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 281 +++++++++++++++++----
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   2 +
>  3 files changed, 250 insertions(+), 50 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
