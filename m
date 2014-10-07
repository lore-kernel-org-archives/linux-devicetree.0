From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove useless
 i2c read on interrupt registers
Date: Tue, 7 Oct 2014 16:09:17 -0600
Message-ID: <20141007220917.GC10616@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-12-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412712189-1234-12-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 10:03:04PM +0200, Christophe Ricard wrote:
> Remove useless i2c read on TPM_INT_ENABLE and TPM_INT_STATUS
> 
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
>  drivers/char/tpm/tpm_i2c_stm_st33.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
> index e99bb78..660ff8b 100644
> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
> @@ -187,7 +187,6 @@ static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
>  
>  	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
>  	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
> -	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);

Hum, I don't have a chip datasheet here, but is this really useless?

It looks like a synchronizing read to me - ie completing the read at
the CPU is enough to know that the TPM itself has processed the prior
write and is known to have lowered the level triggered interrupt..

A read like this is the sort of thing that you'd expect to avoid the
udelay in your 'Add delay before release_locality to make sure irq are
cleared'

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
