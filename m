From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v4] iio: gyro: Add MPU-3050 device tree bindings
Date: Fri, 2 Sep 2016 12:50:06 -0500
Message-ID: <20160902175006.GA7869@rob-hp-laptop>
References: <1472646781-5551-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472646781-5551-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 02:33:00PM +0200, Linus Walleij wrote:
> This adds device tree bindings for the MPU-3050 gyroscope. Since it
> is the first set of bindings for a gyroscope, the folder for it
> is also created.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v3->v4:
> - No changes, just reposting. If we agree on these bindings and since
>   the dependent I2C bindings are merged, this patch should be merge
>   material now I guess.
> ChangeLog v2->v3:
> - Augmented device tree bindings to reflect Peter Rosins now merged
>   I2C gate bindings.
> ChangeLog v1->v2:
> - Not yet convered to use i2c-gate as I'm waiting for that
>   patch set to stabilize.
> ---
>  .../bindings/iio/gyroscope/invensense,mpu3050.txt  | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
