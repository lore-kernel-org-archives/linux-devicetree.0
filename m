From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 10/16] tpm/tpm_i2c_stm_st33: Replace
 wait_for_serirq_timeout by wait_for_tpm_stat
Date: Wed, 8 Oct 2014 14:41:17 -0600
Message-ID: <20141008204117.GB11752@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-11-git-send-email-christophe-h.ricard@st.com>
 <20141007221146.GC2366@obsidianresearch.com>
 <5434CDD6.4050200@gmail.com>
 <20141008162609.GA4153@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC504762@SAFEX1MAIL3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0B9F1C5B86169C4EA9D042C251022E4938EC504762-+EwDPpWUVoSRc5Omjj0epdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Cc: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 10:26:57PM +0200, Christophe Henri RICARD wrote:
> Hi Jason,
> 
> Patch 10/16 includes the following lines:
> +		if (r == -ERESTARTSYS && freezing(current)) {
> +			clear_thread_flag(TIF_SIGPENDING);
> +			goto again;
> +		}
> 
> Line 149 in this patch. I am surprise you are saying it does not occur.

Okay, I see it now, it is in request_locality, not get_burstcount

And I see this code fragment is copied from commit 20b87bbfada, so it
seems reasonable - though I wonder if all wait_event's need similar
protection?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
