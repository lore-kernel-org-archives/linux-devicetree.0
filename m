From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/3] mfd: cros_ec_spi: Add compatible string for NI
 version of cros-ec-spi
Date: Wed, 28 Sep 2016 10:27:43 -0700
Message-ID: <CAKdAkRRMbfJWeiEWWDUPemWS9f4rzSWX4T1sp+qD9_BDoU-Jdg@mail.gmail.com>
References: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com> <1475081961-3858-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475081961-3858-3-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, antonynpavlov@gmail.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, moritz.fischer.private@gmail.com, julia@ni.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 9:59 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> Add compatible string for NI version of cros-ec-spi.
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  drivers/mfd/cros_ec_spi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index ebe9b94..e4504ec 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -708,6 +708,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
>                          cros_ec_spi_resume);
>
>  static const struct of_device_id cros_ec_spi_of_match[] = {
> +       { .compatible = "ni,cros-ec-spi", },

I am confused: if the 2 controllers are the same, why do we need the
new compat string, at least in the driver? Shouldn't DTS simply use
"google,cros-ec-spi", or maybe both (compatible = "ni,cros-ec-spi",
"google,cros-ec-spi")?

DT folks, is there clear instructions somewhere as to when
introduction of new compatible is warranted, along with the rules of
how to settle on common fallback (i.e. how to make sure that, let's
say, Linux, U-boot and FreeBSD use the same fallback compatible for
the same series of devices)?

>         { .compatible = "google,cros-ec-spi", },
>         { /* sentinel */ },
>  };
> --
> 2.7.4
>

Thanks.

-- 
Dmitry
