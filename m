From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 00/16] ST33 I2C TPM driver cleanup
Date: Tue, 7 Oct 2014 16:25:25 -0600
Message-ID: <20141007222525.GD2366@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 10:02:53PM +0200, Christophe Ricard wrote:
> Hi Peter,
> 
> The following patchset brings:
> - Some few code clean up from code style up to structure
> - Device tree support keeping static platform data configuration support.
> - Fix irq support.
> - Update the GPLv2 license header

I really don't have much to say about this - it looks like the older
driver was never being used so if you have reviewed and tested it
again in a new system I think that is an improvement..

Can you put this on a github or something? It would be nice to see the
file new .c file rather than looking at patches..
 
>   tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
>   tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
>     tpm_i2c_buffer[0], [1] buffer.

I'm very happy to see this, this is much better than the old way.

>   tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return
>     code

This is very churny, and I didn't think 'r' was a kernel convention..

>   tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*

What is the part branding? We still have 'st33' in various places..
 
>   tpm/tpm_i2c_stm_st33: Add devicetree structure
>   tpm: dts: st33zp24_i2c: Add DTS Documentation

Peter: FYI, the protocol for device tree stuff is to wait for an ack
from the device tree maintainers on the documentation patch..

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
