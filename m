From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] irq_domain/microblaze: Convert microblaze to use
 irq_domains
Date: Fri, 27 Jan 2012 08:51:29 +0100
Message-ID: <4F225781.5010502@monstr.eu>
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

Grant Likely wrote:
> ***totally untested.  Don't apply yet***
> 
> Michal, I leave it to you to test this patch.  I've turned on SPARSE_IRQ, but
> you may decide that isn't valuable.  I've compile tested it, but that's
> about it (in fact, I had to hack head.S to get it to build because I don't have
> an up-to-date compiler for microblaze.  It fails on an unknown opcode 'lwr')
> 
> This builds on top of my irq_domain tree:
> git://git.secretlab.ca/git/linux-2.6 irqdomain/next
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> Cc: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/microblaze/Kconfig               |    2 +
>  arch/microblaze/include/asm/hardirq.h |    2 +-
>  arch/microblaze/include/asm/irq.h     |   41 +----------------------
>  arch/microblaze/kernel/intc.c         |   58 +++++++++++++++++++-------------
>  arch/microblaze/kernel/irq.c          |   22 ++-----------
>  5 files changed, 41 insertions(+), 84 deletions(-)

I will look at it and let you know.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
