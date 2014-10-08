From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree
 structure
Date: Wed, 8 Oct 2014 14:51:16 -0600
Message-ID: <20141008205116.GA13867@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
 <20141007223025.GE2366@obsidianresearch.com>
 <5434D00E.7000602@gmail.com>
 <20141008162922.GC4153@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC504766@SAFEX1MAIL3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0B9F1C5B86169C4EA9D042C251022E4938EC504766-+EwDPpWUVoSRc5Omjj0epdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Cc: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 10:41:36PM +0200, Christophe Henri RICARD wrote:
> Hi Jason,
> 
> I have currently seen both. I agree on the principles as it is
> simplifying the code a little bit.  I including this clean up in
> this patch Add devicetree structure for a future v2 submission

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
