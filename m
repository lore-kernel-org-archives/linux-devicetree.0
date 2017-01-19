From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3 v3] iio: adc: add device tree bindings for Qualcomm
 PM8xxx ADCs
Date: Thu, 19 Jan 2017 13:16:50 -0600
Message-ID: <20170119191650.o3ghoysxkhrqw4gw@rob-hp-laptop>
References: <20170117142515.10578-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170117142515.10578-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T . Ivanov" <iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 03:25:13PM +0100, Linus Walleij wrote:
> This adds the device tree bindings for the Qualcomm PM8xxx
> ADCs. This is based on the existing DT bindings for the
> SPMI ADC so there are hopefully no controversial features.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Ivan T. Ivanov <iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v2->v3:
> - Collapse the ratiometric property into one that enables and
>   selects a ratiometric reference in one go.
> - Use foo: adc-channel@X notation consequently
> - Document that the reference voltage is compulsory.
> ChangeLog v1->v2:
> - Spelling fixes
> ---
>  .../bindings/iio/adc/qcom,pm8xxx-xoadc.txt         | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,pm8xxx-xoadc.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
