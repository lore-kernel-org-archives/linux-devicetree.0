From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: Aw: [PATCH v5 3/4] tpm/st33zp24/spi: Add st33zp24 spi phy
Date: Wed, 28 Jan 2015 13:36:25 -0700
Message-ID: <20150128203625.GB10610@obsidianresearch.com>
References: <1422395850-21644-1-git-send-email-christophe-h.ricard@st.com>
 <1422395850-21644-4-git-send-email-christophe-h.ricard@st.com>
 <trinity-1682f383-7165-419d-b9f7-ef1f205304d2-1422463682896@3capp-gmx-bs38>
 <54C934DD.2040109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C934DD.2040109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: RICARD Christophe <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Huewe <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 28, 2015 at 08:13:33PM +0100, RICARD Christophe wrote:
> Hi Peter,
> 
> A TPM command can be up to 2048 byte, A TPM response can be up to 1024 byte.
> Between command and response, there are latency byte (up to 15
> usually on st33zp24 2 are enough).
> 
> Overall when sending a command and expecting an answer we need in
> worst case:
> 2048 (for the TPM command) + 1024 (for the TPM answer).  We need
> some latency byte before the answer is available (max 15).
> We have 2048 + 1024 + 15.
> 
> I will go for a define making the code more readable together with a
> comment.

You can probably just make these static arrays inside your priv
structure and drop these independent allocations:

> >+ phy->spi_xfer.tx_buf = devm_kmalloc(&dev->dev, (TPM_BUFSIZE +
> >+ (TPM_BUFSIZE / 2) + MAX_SPI_LATENCY),
> >+ GFP_KERNEL);

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
