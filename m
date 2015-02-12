From: Ashley Lai <ashley@ashleylai.com>
Subject: Re: [tpmdd-devel] [PATCH] Added Little Endian support to vtpm
 module
Date: Thu, 12 Feb 2015 10:00:23 -0600 (CST)
Message-ID: <alpine.DEB.2.10.1502120839140.4598@ant>
References: <b5cb25ed725511cbb675c2dfb5da00f6@imap.linux.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <b5cb25ed725511cbb675c2dfb5da00f6@imap.linux.ibm.com>
Sender: stable-owner@vger.kernel.org
To: honclo <honclo@imap.linux.ibm.com>
Cc: tpmdd-devel@lists.sourceforge.net, ashley@ashleylai.com, PeterHuewe@gmx.de, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vicky,

Thanks for the patch.

In ibmvtpm_crq_process(), do we need to swap the 
whole crq buffer?  Have you test this code path?

Please add the description to the patch as Peter suggested.

Thanks,
--Ashley Lai

On Wed, 11 Feb 2015, honclo wrote:

> From 879f34c59d828ff0dfa735cf626e97c1345f610d Mon Sep 17 00:00:00 2001
> From: Hon Ching(Vicky) Lo <honclo@linux.vnet.ibm.com>
> Date: Wed, 11 Feb 2015 23:21:51 -0500
> Subject: [PATCH] Added Little Endian support to vtpm module
>
> Signed-off-by: Hon Ching(Vicky) Lo <honclo@linux.vnet.ibm.com>
> Signed-off-by: Joy Latten <jmlatten@linux.vnet.ibm.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c |   20 ++++++++++++--------
>  1 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
> b/drivers/char/tpm/tpm_ibmvtpm.c
> index af74c57..1632242 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -148,7 +148,8 @@ static int tpm_ibmvtpm_send(struct tpm_chip *chip,
> u8 *buf, size_t count)
>  	crq.len = (u16)count;
>  	crq.data = ibmvtpm->rtce_dma_handle;
>
> -	rc = ibmvtpm_send_crq(ibmvtpm->vdev, word[0], word[1]);
> +	rc = ibmvtpm_send_crq(ibmvtpm->vdev, cpu_to_be64(word[0]),
> +			      cpu_to_be64(word[1]));
>  	if (rc != H_SUCCESS) {
>  		dev_err(ibmvtpm->dev, "tpm_ibmvtpm_send failed rc=%d\n", rc);
>  		rc = 0;
> @@ -186,7 +187,8 @@ static int ibmvtpm_crq_get_rtce_size(struct
> ibmvtpm_dev *ibmvtpm)
>  	crq.valid = (u8)IBMVTPM_VALID_CMD;
>  	crq.msg = (u8)VTPM_GET_RTCE_BUFFER_SIZE;
>
> -	rc = ibmvtpm_send_crq(ibmvtpm->vdev, buf[0], buf[1]);
> +	rc = ibmvtpm_send_crq(ibmvtpm->vdev, cpu_to_be64(buf[0]),
> +			      cpu_to_be64(buf[1]));
>  	if (rc != H_SUCCESS)
>  		dev_err(ibmvtpm->dev,
>  			"ibmvtpm_crq_get_rtce_size failed rc=%d\n", rc);
> @@ -212,7 +214,8 @@ static int ibmvtpm_crq_get_version(struct
> ibmvtpm_dev *ibmvtpm)
>  	crq.valid = (u8)IBMVTPM_VALID_CMD;
>  	crq.msg = (u8)VTPM_GET_VERSION;
>
> -	rc = ibmvtpm_send_crq(ibmvtpm->vdev, buf[0], buf[1]);
> +	rc = ibmvtpm_send_crq(ibmvtpm->vdev, cpu_to_be64(buf[0]),
> +			      cpu_to_be64(buf[1]));
>  	if (rc != H_SUCCESS)
>  		dev_err(ibmvtpm->dev,
>  			"ibmvtpm_crq_get_version failed rc=%d\n", rc);
> @@ -327,7 +330,8 @@ static int tpm_ibmvtpm_suspend(struct device *dev)
>  	crq.valid = (u8)IBMVTPM_VALID_CMD;
>  	crq.msg = (u8)VTPM_PREPARE_TO_SUSPEND;
>
> -	rc = ibmvtpm_send_crq(ibmvtpm->vdev, buf[0], buf[1]);
> +	rc = ibmvtpm_send_crq(ibmvtpm->vdev, cpu_to_be64(buf[0]),
> +			      cpu_to_be64(buf[1]));
>  	if (rc != H_SUCCESS)
>  		dev_err(ibmvtpm->dev,
>  			"tpm_ibmvtpm_suspend failed rc=%d\n", rc);
> @@ -472,11 +476,11 @@ static void ibmvtpm_crq_process(struct ibmvtpm_crq
> *crq,
>  	case IBMVTPM_VALID_CMD:
>  		switch (crq->msg) {
>  		case VTPM_GET_RTCE_BUFFER_SIZE_RES:
> -			if (crq->len <= 0) {
> +			if (be16_to_cpu(crq->len) <= 0) {
>  				dev_err(ibmvtpm->dev, "Invalid rtce size\n");
>  				return;
>  			}
> -			ibmvtpm->rtce_size = crq->len;
> +			ibmvtpm->rtce_size = be16_to_cpu(crq->len);
>  			ibmvtpm->rtce_buf = kmalloc(ibmvtpm->rtce_size,
>  						    GFP_KERNEL);
>  			if (!ibmvtpm->rtce_buf) {
> @@ -497,11 +501,11 @@ static void ibmvtpm_crq_process(struct ibmvtpm_crq
> *crq,
>
>  			return;
>  		case VTPM_GET_VERSION_RES:
> -			ibmvtpm->vtpm_version = crq->data;
> +			ibmvtpm->vtpm_version = be32_to_cpu(crq->data);
>  			return;
>  		case VTPM_TPM_COMMAND_RES:
>  			/* len of the data in rtce buffer */
> -			ibmvtpm->res_len = crq->len;
> +			ibmvtpm->res_len = be16_to_cpu(crq->len);
>  			wake_up_interruptible(&ibmvtpm->wq);
>  			return;
>  		default:
> -- 
> 1.7.1
>
>
> ------------------------------------------------------------------------------
> Dive into the World of Parallel Programming. The Go Parallel Website,
> sponsored by Intel and developed in partnership with Slashdot Media, is your
> hub for all things parallel software development, from weekly thought
> leadership blogs to news, videos, case studies, tutorials and more. Take a
> look and join the conversation now. http://goparallel.sourceforge.net/
> _______________________________________________
> tpmdd-devel mailing list
> tpmdd-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/tpmdd-devel
>
