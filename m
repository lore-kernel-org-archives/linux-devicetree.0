From: Marcin Obara <marcin_obara-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH v3 12/15] tpm/tpm_i2c_stm_st33: Remove
 useless i2c read on interrupt registers
Date: Tue, 14 Oct 2014 10:17:48 +0200
Message-ID: <CAPxFvEPT8wEt4BfZ7112aFpsowXV2WUHvsN5W9=iKUvmRpcBFw@mail.gmail.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
	<1413231817-5174-13-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231817-5174-13-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, tpmdd-devel <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wasn't last read required for flush write?

2014-10-13 22:23 GMT+02:00 Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Remove useless i2c read on TPM_INT_ENABLE and TPM_INT_STATUS
>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/char/tpm/tpm_i2c_stm_st33.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
> index 388bb64..ed4176e 100644
> --- a/drivers/char/tpm/tpm_i2c_stm_st33.c
> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
> @@ -184,7 +184,6 @@ static void clear_interruption(struct tpm_stm_dev *tpm_dev)
>
>         I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
>         I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
> -       I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
>  } /* clear_interruption() */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
