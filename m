From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 00/15] ST33 I2C TPM driver cleanup
Date: Tue, 14 Oct 2014 12:51:02 -0600
Message-ID: <20141014185102.GI27232@obsidianresearch.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413231817-5174-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 13, 2014 at 10:23:22PM +0200, Christophe Ricard wrote:

>   tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other
>     similar product
>   tpm/tpm_i2c_stm_st33: Fix few coding style error reported by
>     scripts/checkpatch.pl
>   tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
>   tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
>     tpm_i2c_buffer[0], [1] buffer.
>   tpm/tpm_i2c_stm_st33: Remove reference to io_serirq
>   tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return
>     code
>   tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
>   tpm/tpm_i2c_stm_st33/dts/st33zp24_i2c: Add DTS Documentation
>   tpm/tpm_i2c_stm_st33: Few code cleanup
>   tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
>   tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
>   tpm/tpm_i2c_stm_st33: Change License header to have up to date address
>     information
>   tpm/tpm_i2c_stm_st33: Increment driver version to 1.2.1.


You can add my

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

On the above in the series

Thanks,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
