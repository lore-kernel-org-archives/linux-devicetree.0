From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree
 structure
Date: Wed, 8 Oct 2014 15:37:04 -0600
Message-ID: <20141008213704.GB13867@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
 <20141007223025.GE2366@obsidianresearch.com>
 <5434D00E.7000602@gmail.com>
 <20141008162922.GC4153@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC504766@SAFEX1MAIL3.st.com>
 <20141008205116.GA13867@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC50476E@SAFEX1MAIL3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0B9F1C5B86169C4EA9D042C251022E4938EC50476E-+EwDPpWUVoSRc5Omjj0epdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Cc: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 11:14:40PM +0200, Christophe Henri RICARD wrote:

> For your information, the lpcpd pin is named like this as per
> PCClientTPMSpecification is also known as TPMSTB on this product.
> The TPMSTB pin can be used in order to support D1 and D2 power
> management state.  I am actually sorry to refer to Microsoft website
> here ;) :

So, having the option to enter D1/D2 through that pin in the driver
seems fine, and it should just be enabled if the driver is told what
that pin is. No need for a module parameter, and no need for the
driver to fail probe if it isn't told how to access that GPIO.

However.. suspend/resume are called from the broader PM framework and
a platform might arrange things so the TPM is put into a deeper sleep
than D1/D2 (ie entirely powered off because the CPU was put into
suspend-to-ram and the peripheral power converter was switched off)

Thus the driver really must save the TPM state at suspend, and if the
volatile state was wiped after resume then it must be restored from
the saved state.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
