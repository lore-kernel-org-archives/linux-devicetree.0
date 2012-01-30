From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] irq_domain/microblaze: Convert microblaze to use
 irq_domains
Date: Mon, 30 Jan 2012 06:30:17 -0700
Message-ID: <20120130133017.GE28397@ponder.secretlab.ca>
References: <1327613292-20580-1-git-send-email-grant.likely@secretlab.ca>
 <4F268222.5030403@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F268222.5030403-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2012 at 12:42:26PM +0100, Michal Simek wrote:
> Hi Grant,
> 
> Grant Likely wrote:
> >***totally untested.  Don't apply yet***
> >
> >Michal, I leave it to you to test this patch.  I've turned on SPARSE_IRQ, but
> >you may decide that isn't valuable.  I've compile tested it, but that's
> >about it (in fact, I had to hack head.S to get it to build because I don't have
> >an up-to-date compiler for microblaze.  It fails on an unknown opcode 'lwr')
> >
> 
> I have looked at it and I there is problem with virq allocation in irq_create_mapping
> which calles irq_alloc_desc(0) and then __irq_alloc_descs(-1, 0, 1, node, THIS_MODULE)
> where bitmap_find_next_zero_area returns 0 (start = 0) which is passed to alloc_descs
> which just return it.
> It doesn't matter if SPARSE_IRQ is enabled or not.
> Error log is below.
> 
> Can you give me hint how to fix it and what expected values are?

irq0 is getting allocated when it shouldn't be.  The fix is to change the
calls in irqdomain.c from irq_alloc_desc(0) to irq_alloc_desc_from(1, 0).

I've got the fix in my tree and I'm pushing it out to the following branch
in a few minutes:

git://git.secretlab.ca/git/linux-2.6 irqdomain/next

g.
