From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v1 08/10] tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in
 2 layers (core + phy)
Date: Mon, 12 Jan 2015 13:26:53 -0700
Message-ID: <20150112202653.GC11295@obsidianresearch.com>
References: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
 <1420888831-17491-9-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420888831-17491-9-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: PeterHuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 10, 2015 at 12:20:29PM +0100, Christophe Ricard wrote:

For reference:

> -static int tpm_stm_i2c_remove(struct i2c_client *client)
> -{
> -       struct tpm_chip *chip =
> -               (struct tpm_chip *) i2c_get_clientdata(client);
> -
> -       if (chip)
> -                tpm_chip_unregister(chip);
> -
> -       return 0;
> -}

Became:

> +static int st33zp24_i2c_remove(struct i2c_client *client)
> +{
> +	void *tpm_data = i2c_get_clientdata(client);
> +
> +	if (tpm_data)
> +		st33zp24_remove(tpm_data);
> +
> +	return 0;
> +}

The value of i2c_get_clientdata hasn't/can't be changed, it must be
the tpm_chip, so tpm_data should be tpm_chip *, not void *.

The 'if (tpm_data)' is an anti-pattern, please remove it

Same comment applies to patch 9

> +int st33zp24_remove(void *tpm_data)
> +{
> +	struct st33zp24_dev *tpm_dev = (struct st33zp24_dev *)tpm_data;
> +	struct tpm_chip *chip = tpm_dev->chip;
> +
> +	if (chip)
> +		tpm_chip_unregister(chip);
> +
> +	return 0;
> +}

Now this looks wrong. st33zp24_dev is the TPM_VPRIV of the chip, but
tpm_data is the tpm_chip already, so that cast is surely wrong.

Again, remove the 'if (chip)' anti-pattern.

> +static struct st33zp24_phy_ops i2c_phy_ops = {
> +       .send = st33zp24_i2c_send,
> +       .recv = st33zp24_i2c_recv,
> +};

Should be 'static const struct', same comment for patch 9

> +       tpm_dev = devm_kzalloc(dev, sizeof(struct st33zp24_dev),
> +                              GFP_KERNEL);
> +       if (!tpm_dev)
> +               return -ENOMEM;
> +
> +       chip = tpmm_chip_alloc(dev, &st33zp24_tpm);
> +       if (IS_ERR(chip))
> +               return PTR_ERR(chip);

It is idomatic in the TPM drivers for the tpmm_chip_alloc to be first,
then the priv allocation to be second. Someday we might merge the two
calls.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
