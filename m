From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: set dma_mask to point to coherent_dma_mask
Date: Tue, 12 Nov 2013 07:01:14 +0000
Message-ID: <20131112070114.73AE3C421A6@trevor.secretlab.ca>
References: <1383109522-6879-1-git-send-email-robherring2@gmail.com> <20131102180724.D8FC5C40F02@trevor.secretlab.ca> <alpine.DEB.2.02.1311061642270.26077@kaball.uk.xensource.com> <alpine.DEB.2.02.1311111658100.26077@kaball.uk.xensource.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1311111658100.26077-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Nov 2013 16:59:14 +0000, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org> wrote:
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

Gah! That's pretty nasty. It is in Rob's for-next branch, but it hasn't
been marked for backporting to stable. Best thing to do here is for
either you or Rob to repost the patch to stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and
include the commit id from Rob's tree. It's not upstream yet, but it
will be soon.

How far back in kernel releases do you want the patch backported to?

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
