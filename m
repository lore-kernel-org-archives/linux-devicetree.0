From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/2] ftpm: firmware TPM running in TEE
Date: Wed, 3 Apr 2019 09:40:44 -0300
Message-ID: <20190403124044.GA15230@ziepe.ca>
References: <20190402193316.15144-1-sashal@kernel.org>
 <20190402193316.15144-2-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402193316.15144-2-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, linux-kernel@microsoft.com, bryankel@microsoft.com, thiruan@microsoft.com, suredd@microsoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 03:33:16PM -0400, Sasha Levin wrote:

> +/*
> + * Undo what has been done in ftpm_tee_probe
> + */
> +static void ftpm_tee_deinit(struct ftpm_tee_private *pvt_data)
> +{
> +	/* Release the chip */
> +	if (pvt_data->state & STATE_REGISTERED_FLAG)
> +		tpm_chip_unregister(pvt_data->chip);
> +
> +	if (pvt_data->ctx != NULL)	{
> +
> +		/* Free the shared memory pool */
> +		if (pvt_data->state & STATE_TEE_SHMALLOC_FLAG)
> +			tee_shm_free(pvt_data->shm);
> +
> +		/* close the existing session with fTPM TA*/
> +		if (pvt_data->state & STATE_TEE_OPENED_FLAG)
> +			tee_client_close_session(pvt_data->ctx,
> +				pvt_data->session);
> +
> +		/* close the context with TEE driver */
> +		tee_client_close_context(pvt_data->ctx);
> +	}

all these flags are ugly, just use a normal goto unwind during probe
please


> +
> +	/* memory allocated with devm_kzalloc() is freed automatically */
> +}
> +
> +/*
> + * ftpm_tee_probe initialize the fTPM
> + * @param: pdev, the platform_device description.
> + * @return: 0 in case of success.
> + *	 or a negative value describing the error.
> + */
> +static int ftpm_tee_probe(struct platform_device *pdev)
> +{
> +	int rc;
> +	struct tpm_chip *chip;
> +	struct device *dev = &pdev->dev;
> +	struct ftpm_tee_private *pvt_data = NULL;
> +	struct tee_ioctl_open_session_arg sess_arg;
> +
> +	dev_dbg(dev, "%s++\n", __func__);

Please don't push tracing like this to the upstream kernel, we have
ftrace and what not to do this generally :(

> +	pvt_data = devm_kzalloc(dev, sizeof(struct ftpm_tee_private),
> +				GFP_KERNEL);
> +	if (!pvt_data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, pvt_data);
> +
> +	/* Open context with TEE driver */
> +	pvt_data->ctx = tee_client_open_context(NULL, ftpm_tee_match, NULL,
> +						NULL);
> +	if (IS_ERR(pvt_data->ctx))	{
> +		dev_err(dev, "%s:tee_client_open_context failed\n", __func__);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	/* Open a session with fTPM TA*/
> +	memset(&sess_arg, 0, sizeof(sess_arg));
> +	memcpy(sess_arg.uuid, ftpm_ta_uuid.b, TEE_IOCTL_UUID_LEN);
> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> +	sess_arg.num_params = 0;
> +
> +	rc = tee_client_open_session(pvt_data->ctx, &sess_arg, NULL);
> +	if ((rc < 0) || (sess_arg.ret != 0)) {
> +		dev_err(dev, "%s:tee_client_open_session failed, err=%x\n",
> +			__func__, sess_arg.ret);
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +	pvt_data->session = sess_arg.session;
> +	pvt_data->state |= STATE_TEE_OPENED_FLAG;
> +
> +	/* Allocate dynamic shared memory with fTPM TA */
> +	pvt_data->shm = tee_shm_alloc(pvt_data->ctx,
> +				(MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE),
> +				TEE_SHM_MAPPED | TEE_SHM_DMA_BUF);
> +	if (IS_ERR(pvt_data->shm)) {
> +		dev_err(dev, "%s:tee_shm_alloc failed\n", __func__);
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +	pvt_data->state |= STATE_TEE_SHMALLOC_FLAG;
> +
> +	/* Allocate new struct tpm_chip instance */
> +	chip = tpm_chip_alloc(dev, &ftpm_tee_tpm_ops);

Why not tpmm_chip_alloc ? Using devm in other places

Doesn't this leak memory? I don't see a put_device cleanup for chip_alloc?

> +	if (IS_ERR(chip)) {
> +		dev_err(dev, "%s:tpm_chip_alloc failed\n", __func__);
> +		rc = PTR_ERR(chip);
> +		goto out;
> +	}
> +
> +	pvt_data->chip = chip;
> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +
> +	/* Create a character device for the fTPM */
> +	rc = tpm_chip_register(pvt_data->chip);

It is a bad idea to do things after tpm_chip_register, it should be
the last thing done during probe except for error cleanup via a goto
unwind.

Jason
