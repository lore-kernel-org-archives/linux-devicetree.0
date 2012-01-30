From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] irq_domain/microblaze: Convert microblaze to use
 irq_domains
Date: Mon, 30 Jan 2012 12:42:26 +0100
Message-ID: <4F268222.5030403@monstr.eu>
References: <1327613292-20580-1-git-send-email-grant.likely@secretlab.ca>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327613292-20580-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

Grant Likely wrote:
> ***totally untested.  Don't apply yet***
> 
> Michal, I leave it to you to test this patch.  I've turned on SPARSE_IRQ, but
> you may decide that isn't valuable.  I've compile tested it, but that's
> about it (in fact, I had to hack head.S to get it to build because I don't have
> an up-to-date compiler for microblaze.  It fails on an unknown opcode 'lwr')
> 

I have looked at it and I there is problem with virq allocation in irq_create_mapping
which calles irq_alloc_desc(0) and then __irq_alloc_descs(-1, 0, 1, node, THIS_MODULE)
where bitmap_find_next_zero_area returns 0 (start = 0) which is passed to alloc_descs
which just return it.
It doesn't matter if SPARSE_IRQ is enabled or not.
Error log is below.

Can you give me hint how to fix it and what expected values are?

Thanks,
Michal

Error log:

NR_IRQS:64
XPS intc #0 at 0xc8000000, num_irq=6, edge=0x0
irq: Allocated domain of type 2 @0xc7802760
irq: irq_create_mapping(0xc7802760, 0x2)
irq: -> using domain @c7802760
irq: -> virq allocation failed
XPS timer #0 at 0xc8002000, irq=0



-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
