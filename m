From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [RFC 4/7] soc: qcom: Add Shared Memory Manager driver
Date: Mon, 27 Oct 2014 17:34:26 -0700
Message-ID: <20141028003424.GP28611@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-5-git-send-email-bjorn.andersson@sonymobile.com>
 <5435AD8E.2000109@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5435AD8E.2000109@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed 08 Oct 14:33 PDT 2014, Jeffrey Hugo wrote:

[..]
> > + */
> > +struct smem_header {
> > +     struct smem_proc_comm proc_comm[4];
> > +     u32 version[32];
> > +     u32 smem_initialized;
> > +     u32 free_offset;
> > +     u32 available;
> > +     u32 unused;
> 
> I see that you inlined the smem_heap_info struct.  That is slightly
> problematic since we have some uses of that structure, and without it,
> accessing id 1 becomes complicated.  I would prefer you reintroduce it.
> 

Could you help me better understand what you mean here? I've scanned through
msm-3.4 and msm-3.10 and read your comment numerous times, but I can't find any
uses that needs it nor figure out why it would be difficult to access item 1.

> > +     struct smem_entry toc[SMEM_MAX_ITEMS];
> > +};

Thanks,
Bjorn
