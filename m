From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 04/10] tpm/tpm_i2c_stm_st33: Replace access to io_lpcpd from struct st33zp24_platform_data to tpm_stm_dev
Date: Sat, 17 Jan 2015 14:44:47 +0100
Message-ID: <201501171444.49175.PeterHuewe@gmx.de>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com> <1421187198-8503-5-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-5-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Januar 2015, 23:13:12 schrieb Christophe Ricard:
> io_lpcpd is accessible from struct tpm_stm_dev.
> struct st33zp24_platform_data is only valid when using static platform
> configuration data, not when using dts.
> 
> Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/char/tpm/tpm_i2c_stm_st33.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c
> b/drivers/char/tpm/tpm_i2c_stm_st33.c index d12d507..9d3c9c8 100644
> --- a/drivers/char/tpm/tpm_i2c_stm_st33.c
> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
> @@ -834,11 +834,14 @@ static int tpm_stm_i2c_remove(struct i2c_client
> *client) */
>  static int tpm_stm_i2c_pm_suspend(struct device *dev)
>  {
> -	struct st33zp24_platform_data *pin_infos = dev->platform_data;
> +	struct tpm_chip *chip = dev_get_drvdata(dev);
> +	struct tpm_stm_dev *tpm_dev;
>  	int ret = 0;
> 
> -	if (gpio_is_valid(pin_infos->io_lpcpd))
> -		gpio_set_value(pin_infos->io_lpcpd, 0);
> +	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
> +
> +	if (gpio_is_valid(tpm_dev->io_lpcpd))
> +		gpio_set_value(tpm_dev->io_lpcpd, 0);
>  	else
>  		ret = tpm_pm_suspend(dev);

patch is not self contained and fails to build.

drivers/char/tpm/tpm_i2c_stm_st33.c: In function 'tpm_stm_i2c_pm_resume':
drivers/char/tpm/tpm_i2c_stm_st33.c:864:20: error: 'pin_infos' undeclared 
(first use in this function)
  if (gpio_is_valid(pin_infos->io_lpcpd)) {
                    ^
drivers/char/tpm/tpm_i2c_stm_st33.c:864:20: note: each undeclared identifier 
is reported only once for each function it appears in
scripts/Makefile.build:263: recipe for target 
'drivers/char/tpm/tpm_i2c_stm_st33.o' failed
make[3]: *** [drivers/char/tpm/tpm_i2c_stm_st33.o] Error 1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
