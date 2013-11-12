From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] of: set dma_mask to point to coherent_dma_mask
Date: Tue, 12 Nov 2013 10:19:55 +0000
Message-ID: <20131112101955.GF16735@n2100.arm.linux.org.uk>
References: <1383109522-6879-1-git-send-email-robherring2@gmail.com> <20131102180724.D8FC5C40F02@trevor.secretlab.ca> <alpine.DEB.2.02.1311061642270.26077@kaball.uk.xensource.com> <alpine.DEB.2.02.1311111658100.26077@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1311111658100.26077-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 04:59:14PM +0000, Stefano Stabellini wrote:
> On Wed, 6 Nov 2013, Stefano Stabellini wrote:
> > On Sat, 2 Nov 2013, Grant Likely wrote:
> > > On Wed, 30 Oct 2013 00:05:22 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > 
> > > > Platform devices created by DT code don't initialize dma_mask pointer to
> > > > anything. Set it to coherent_dma_mask by default if the architecture
> > > > code has not set it.
> > > > 
> > > > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > 
> > > I believe this is okay. I haven't done any testing to back up that
> > > opinion though.
> > 
> > Tested-by: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
> 
> BTW I hope you are planning on sending this upstream soon, because
> without it I can very easily corrupt my root fs by simply booting the system.

What's the mechanism for that corruption?  Having the DMA mask not set
should not cause DMA corruption - that hints at something else being
wrong, and that needs to be investigated.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
