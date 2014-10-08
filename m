From: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Subject: RE: [tpmdd-devel] [PATCH 10/16] tpm/tpm_i2c_stm_st33: Replace
 wait_for_serirq_timeout by wait_for_tpm_stat
Date: Wed, 8 Oct 2014 22:26:57 +0200
Message-ID: <0B9F1C5B86169C4EA9D042C251022E4938EC504762@SAFEX1MAIL3.st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-11-git-send-email-christophe-h.ricard@st.com>
 <20141007221146.GC2366@obsidianresearch.com> <5434CDD6.4050200@gmail.com>
 <20141008162609.GA4153@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141008162609.GA4153-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

Patch 10/16 includes the following lines:
+		if (r == -ERESTARTSYS && freezing(current)) {
+			clear_thread_flag(TIF_SIGPENDING);
+			goto again;
+		}

Line 149 in this patch. I am surprise you are saying it does not occur.

Best Regards
Christophe

-----Original Message-----
From: Jason Gunthorpe [mailto:jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org] 
Sent: mercredi 8 octobre 2014 18:26
To: Christophe RICARD
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org; ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org; tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org; Christophe Henri RICARD; Jean-Luc BLANC
Subject: Re: [tpmdd-devel] [PATCH 10/16] tpm/tpm_i2c_stm_st33: Replace wait_for_serirq_timeout by wait_for_tpm_stat

On Wed, Oct 08, 2014 at 07:38:30AM +0200, Christophe RICARD wrote:
>  Hi Jason,
> 
> The freezer header is here for the freezing(current) function call in 
> get_burstcount().

But freezing(current) does not occur in patch 10/16.

Is this include in the right patch in the series?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
