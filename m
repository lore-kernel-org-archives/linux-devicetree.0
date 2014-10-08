From: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Subject: RE: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add
 devicetree structure
Date: Wed, 8 Oct 2014 23:14:40 +0200
Message-ID: <0B9F1C5B86169C4EA9D042C251022E4938EC50476E@SAFEX1MAIL3.st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
 <20141007223025.GE2366@obsidianresearch.com> <5434D00E.7000602@gmail.com>
 <20141008162922.GC4153@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC504766@SAFEX1MAIL3.st.com>
 <20141008205116.GA13867@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141008205116.GA13867-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jason,

For your information, the lpcpd pin is named like this as per PCClientTPMSpecification is also known as TPMSTB on this product.
The TPMSTB pin can be used in order to support D1 and D2 power management state.
I am actually sorry to refer to Microsoft website here ;) : http://msdn.microsoft.com/en-us/library/windows/hardware/ff543162%28v=vs.85%29.aspx.
As mention by our product datasheet:
"In order to reach D1/D2 state, the TPMSTB pin must be connected to a GPIO signal.
In state D1/D2, the contents of the volatile memory is *preserved*."

Also "... the implementation of the LPCPD# pin on a TPM is platform and chipset implementation specific." Cf PCClientTPMSpecification.

I am currently giving the opportunity to an integrator to use this feature. 

I don't mind removing the power_mgt module option but don't you think there might be interest for an integrator to update their TPM power management policy on their platform ?

Best Regards
Christophe
-----Original Message-----
From: Jason Gunthorpe [mailto:jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org] 
Sent: mercredi 8 octobre 2014 22:51
To: Christophe Henri RICARD
Cc: Christophe RICARD; peterhuewe-Mmb7MZpHnFY@public.gmane.org; ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org; tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org; Jean-Luc BLANC
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree structure

On Wed, Oct 08, 2014 at 10:41:36PM +0200, Christophe Henri RICARD wrote:
> Hi Jason,
> 
> I have currently seen both. I agree on the principles as it is 
> simplifying the code a little bit.  I including this clean up in this 
> patch Add devicetree structure for a future v2 submission

I was just looking at what the remaining lpcpd GPIO does, and..

1) I think you can probably just make this optional, if it is not
   specified in the DT or through platform data, just don't fiddle with
   it. This makes the driver much friendlier - ie it can be manually
   attached via sysfs for instance.

2) This looks fishy:

static int tpm_st33_i2c_pm_suspend(struct device *dev)
	if (power_mgt) {
		gpio_set_value(pin_infos->io_lpcpd, 0);
	} else {
		ret = tpm_pm_suspend(dev);
	}

   I can't think of a reason why the driver wouldn't need to call
   tpm_pm_suspend to save the internal state? Ditto for restore?

   I'm also suspicious of the power_mgt module option, that should
   probably go away entirely?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
