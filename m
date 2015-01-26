From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 1/4] tpm/tpm_i2c_stm_st33: Replace access to io_lpcpd from struct st33zp24_platform_data to tpm_stm_dev
Date: Mon, 26 Jan 2015 23:15:06 +0100
Message-ID: <201501262315.07543.PeterHuewe@gmx.de>
References: <1422220293-21005-1-git-send-email-christophe-h.ricard@st.com> <1422220293-21005-2-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422220293-21005-2-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,
Am Sonntag, 25. Januar 2015, 22:11:30 schrieb Christophe Ricard:
> io_lpcpd is accessible from struct tpm_stm_dev.
> struct st33zp24_platform_data is only valid when using static platform
> configuration data, not when using dts.
> 
> Reviewed-by: Jason Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/char/tpm/tpm_i2c_stm_st33.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c
> b/drivers/char/tpm/tpm_i2c_stm_st33.c index 612845b..882c60a 100644
> --- a/drivers/char/tpm/tpm_i2c_stm_st33.c
> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
> @@ -837,11 +837,14 @@ static int tpm_stm_i2c_remove(struct i2c_client
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

I know this is not changed by this patch, but
don't you need to send a tpm savestate? or is this implicit by pulling 
io_lpcpd ?



> 
> @@ -856,12 +859,13 @@ static int tpm_stm_i2c_pm_suspend(struct device *dev)
>  static int tpm_stm_i2c_pm_resume(struct device *dev)
>  {
>  	struct tpm_chip *chip = dev_get_drvdata(dev);
> -	struct st33zp24_platform_data *pin_infos = dev->platform_data;
> -
> +	struct tpm_stm_dev *tpm_dev;
>  	int ret = 0;
> 
> -	if (gpio_is_valid(pin_infos->io_lpcpd)) {
> -		gpio_set_value(pin_infos->io_lpcpd, 1);
> +	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
> +
> +	if (gpio_is_valid(tpm_dev->io_lpcpd)) {
> +		gpio_set_value(tpm_dev->io_lpcpd, 1);
>  		ret = wait_for_stat(chip,
>  				TPM_STS_VALID, chip->vendor.timeout_b,
>  				&chip->vendor.read_queue, false);


Same applies to startup(STATE) on resume?

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
