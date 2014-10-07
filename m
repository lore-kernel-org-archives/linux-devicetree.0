From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 14/16] tpm/tpm_i2c_stm_st33: Fix potential
 bug in tpm_stm_i2c_send
Date: Tue, 7 Oct 2014 16:04:25 -0600
Message-ID: <20141007220425.GB10616@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-15-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412712189-1234-15-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 10:03:07PM +0200, Christophe Ricard wrote:
> When sending data in tpm_stm_i2c_send, each loop iteration send buf.
> Send buf + i instead as the goal of this for loop is to send a number
> of byte from buf that fit in burstcnt. Once those byte are sent, we are
> supposed to send the next ones.

So, this driver never really worked? I'm guessing sending a larger
command (take ownership, for example) will exceed the burst count and
just blow up?

This should be marked for stable (please see
Documentation/stable_kernel_rules.txt)

Also, please make it the first patch in your series so it applies
cleanly to older kernels.

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
>  drivers/char/tpm/tpm_i2c_stm_st33.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
> index 8d32ade..de9f12e 100644
> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
> @@ -480,7 +480,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
>  		if (burstcnt < 0)
>  			return burstcnt;
>  		size = min_t(int, len - i - 1, burstcnt);
> -		r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf, size);
> +		r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf + i, size);
>  		if (r < 0)
>  			goto out_err;
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
