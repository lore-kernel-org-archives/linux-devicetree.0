From: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 08/15] tpm/tpm_i2c_stm_st33: Add devicetree structure
Date: Tue, 14 Oct 2014 21:59:29 +0200
Message-ID: <20141014215929.751a8dc6@toffy-MacBookPro>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
	<1413231817-5174-9-git-send-email-christophe-h.ricard@st.com>
	<20141014173209.GD27232@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141014173209.GD27232-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Tue, 14 Oct 2014 11:32:09 -0600
Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> wrote:

> On Mon, Oct 13, 2014 at 10:23:30PM +0200, Christophe Ricard wrote:
> > Add tpm_stm_st33_i2c dts structure keeping backward compatibility
> > with static platform_data support as well.
> > In the mean time the code is made much simpler by:
> > - Moving all gpio_request to devm_gpio_request_one primitive
> 
> > - Moving request_irq to devm_request_threaded_irq
> 
> This should move to patch 11, and it doesn't look like threaded_irq is
> necessary anymore?
> 
> > +		pr_err("Failed to retrieve lpcpd-gpios from
> > dts.\n");
> 
> All these prints should be dev_err, I think, clinet->dev looks like it
> must be valid at this point.
> 
> This is a general comment actually, all the pr_* prints look like they
> have access to a struct device and should be dev_* prints.
> 
Ok. Basically every tpm device drivers use dev_* so... Let's go for it.

> > +	/* GPIO request and configuration */
> > +	r = devm_gpio_request_one(&client->dev, gpio,
> > +			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
> > +	if (r) {
> > +		pr_err("Failed to request lpcpd pin\n");
> 
> Ditto
> 
> > +		return -ENODEV;
> 
> Return r?
Ok

> 
> > +	pdata = client->dev.platform_data;
> > +	if (pdata == NULL) {
> > +		pr_err("No platform data\n");
> > +		return -EINVAL;
> > +	}
> 
> It would be nice if the platform data was optional since it is now
> the case that the only content (io_lpcd) is optional.
>
Yes. You are correct.
 
> > +		if (r) {
> > +			pr_err("%s : reset gpio_request failed\n",
> > __FILE__);
> > +			return -ENODEV;
> 
> Ditto
> 
> >  	tpm_dev = devm_kzalloc(&client->dev, sizeof(struct
> > tpm_stm_dev), GFP_KERNEL);
> >  	if (!tpm_dev) {
> >  		dev_info(&client->dev, "cannot allocate memory for
> > tpm data\n");
> 
> The print is redundant, kzalloc failure already prints lots of stuff
Ok. I will remove this one.

> 
> > +	platform_data = client->dev.platform_data;
> > +	if (!platform_data && client->dev.of_node) {
> > +		r = tpm_stm_i2c_of_request_resources(chip);
> > +		if (r) {
> > +			pr_err("No platform data\n");
> 
> If we go down this branch then tpm_stm_i2c_of_request_resources
> already printed, so this print is redundant
> 
Ok. I will remove them in the probe function and will extends a little
bit in the xxx_request_resources functions.

> > +			goto _tpm_clean_answer;
> > +		}
> > +	} else if (platform_data) {
> > +		r = tpm_stm_i2c_request_resources(client, chip);
> > +		if (r) {
> > +			pr_err("Cannot get platform resources\n");
> 
> Ditto
> 
> > +			goto _tpm_clean_answer;
> > +		}
> > +	} else {
> > +		pr_err("tpm_stm_st33 platform resources not
> > available\n");
> > +		goto _tpm_clean_answer;
> 
> Again, would be nice if platform data was optional
> 
Ok. I will remove this else branch.

> >  		intmask |= TPM_INTF_CMD_READY_INT
> > -			|  TPM_INTF_FIFO_AVALAIBLE_INT
> > -			|  TPM_INTF_WAKE_UP_READY_INT
> > -			|  TPM_INTF_LOCALITY_CHANGE_INT
> >  			|  TPM_INTF_STS_VALID_INT
> >  			|  TPM_INTF_DATA_AVAIL_INT;
> 
> This hunk should also go to patch 11, I think..
>
So basically merging this hunk with patch 11 would mean current
content + irq management improvement. It makes sense.
I will try to include your comments in a future v4.

> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
