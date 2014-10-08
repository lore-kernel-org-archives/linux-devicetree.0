From: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Subject: RE: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add
 devicetree structure
Date: Wed, 8 Oct 2014 22:41:36 +0200
Message-ID: <0B9F1C5B86169C4EA9D042C251022E4938EC504766@SAFEX1MAIL3.st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
 <20141007223025.GE2366@obsidianresearch.com> <5434D00E.7000602@gmail.com>
 <20141008162922.GC4153@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141008162922.GC4153-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

I have currently seen both. I agree on the principles as it is simplifying the code a little bit.
I including this clean up in this patch Add devicetree structure for a future v2 submission

Best Regards
Christophe

-----Original Message-----
From: Jason Gunthorpe [mailto:jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org] 
Sent: mercredi 8 octobre 2014 18:29
To: Christophe RICARD
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org; ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org; tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org; Christophe Henri RICARD; Jean-Luc BLANC
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree structure

On Wed, Oct 08, 2014 at 07:47:58AM +0200, Christophe RICARD wrote:
> >>+	if (interrupts) {
> >>+		r = devm_gpio_request_one(&client->dev, pdata->io_serirq,
> >>+					GPIOF_IN, "TPM IO_SERIRQ");
> >Similarly, I wonder if pdata->io_serirq is just duplication of
> >client->irq and that should be set by the creator instead?

> pdata->io_serirq stores the gpio number which will be converted into
> irq number.  pdata->io_serirq is only use by static platform 
> configuration not devicetree configuration

Right, but the driver never uses it as a GPIO, so accepting a GPIO is actually less flexible - a platform may connect the TPM to a dedicated IRQ pin, for instance.

The creator should just specify the irq in client->irq, however that is typically done..

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
