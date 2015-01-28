From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: Aw: [PATCH v5 3/4] tpm/st33zp24/spi: Add st33zp24 spi phy
Date: Wed, 28 Jan 2015 14:53:45 -0700
Message-ID: <20150128215345.GA5211@obsidianresearch.com>
References: <1422395850-21644-1-git-send-email-christophe-h.ricard@st.com>
 <1422395850-21644-4-git-send-email-christophe-h.ricard@st.com>
 <trinity-1682f383-7165-419d-b9f7-ef1f205304d2-1422463682896@3capp-gmx-bs38>
 <54C934DD.2040109@gmail.com>
 <20150128203625.GB10610@obsidianresearch.com>
 <78f08c37-9a15-4007-88f6-2c79ba113e6f@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <78f08c37-9a15-4007-88f6-2c79ba113e6f-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org
Cc: RICARD Christophe <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 28, 2015 at 10:49:39PM +0100, peterhuewe-Mmb7MZpHnFY@public.gmane.org wrote:

> >> I will go for a define making the code more readable together with a
> >> comment.
> >
> >You can probably just make these static arrays inside your priv
> >structure and drop these independent allocations:
> 
> Hmm, doesn' t spi stuff need dma'able buffers?

Well, the buffer allocation is already devm_kalloc, so it won't change
the properties to combine it with the devm_kalloc that creates the
priv structure.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
