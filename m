From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 14/16] tpm/tpm_i2c_stm_st33: Fix potential
 bug in tpm_stm_i2c_send
Date: Wed, 8 Oct 2014 10:27:54 -0600
Message-ID: <20141008162754.GB4153@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-15-git-send-email-christophe-h.ricard@st.com>
 <20141007220425.GB10616@obsidianresearch.com>
 <5434CC35.5090104@gmail.com>
 <CALD+uuxM2018GrkDL+6fUbWijYTRYbqB-YFNQRkCj=ZEkPkgng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALD+uuxM2018GrkDL+6fUbWijYTRYbqB-YFNQRkCj=ZEkPkgng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Christophe RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 09:38:39AM +0200, Christophe Ricard wrote:
>    I would just add an additional comment to my previous message.
>    After reviewing Documentation/stable_kernel_rules.txt, it looks like it
>    is *not* necessary to send this patch marked as stable because of the
>    following rule:
>    "- It must fix a real bug that bothers people (not a, "This could be a
>    problem..." type thing)."
>    As argued previously this patch is more an algorithm fix luckily never
>    seen with the current ST33 I2C TPM devices.
>    I looks like a "This could be a problem..."
>    Do you agree with this ?

Yes, please clarify your patch description with something like:

'This never happens in practice because the burst count is XXX bytes
and the largest TPM command is YYY bytes.'

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
