From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree
 structure
Date: Wed, 8 Oct 2014 10:29:22 -0600
Message-ID: <20141008162922.GC4153@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
 <20141007223025.GE2366@obsidianresearch.com>
 <5434D00E.7000602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5434D00E.7000602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 07:47:58AM +0200, Christophe RICARD wrote:
> >>+	if (interrupts) {
> >>+		r = devm_gpio_request_one(&client->dev, pdata->io_serirq,
> >>+					GPIOF_IN, "TPM IO_SERIRQ");
> >Similarly, I wonder if pdata->io_serirq is just duplication of
> >client->irq and that should be set by the creator instead?

> pdata->io_serirq stores the gpio number which will be converted into
> irq number.  pdata->io_serirq is only use by static platform
> configuration not devicetree configuration

Right, but the driver never uses it as a GPIO, so accepting a GPIO is
actually less flexible - a platform may connect the TPM to a dedicated
IRQ pin, for instance.

The creator should just specify the irq in client->irq, however that is
typically done..

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
