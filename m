From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 5/8] powerpc: override dma_get_required_mask by
	platform hook and ops
Date: Thu, 19 May 2011 17:43:56 +1000
Message-ID: <1305791036.7481.52.camel@pasglop>
References: <1305152704-4864-1-git-send-email-nacc@us.ibm.com>
	<1305152704-4864-6-git-send-email-nacc@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1305152704-4864-6-git-send-email-nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nishanth Aravamudan <nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: cbe-oss-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, FUJITA Tomonori <fujita.tomonori-Zyj7fXuS5i5L9jVzuh4AOg@public.gmane.org>, Sonny Rao <sonnyrao-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Will Schmidt <will_schmidt-DhXWPJtHtuFWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2011-05-11 at 15:25 -0700, Nishanth Aravamudan wrote:
> From: Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>
> 
> The hook dma_get_required_mask is supposed to return the mask required
> by the platform to operate efficently.  The generic version of
> dma_get_required_mask in driver/base/platform.c returns a mask based
> only on max_pfn.  However, this is likely too big for iommu systems
> and could be too small for platforms that require a dma offset or have
> a secondary window at a high offset.

The result of those 3 patches doesn't build on top of my current tree,
the generic dma_ops lacks the dma_get_required_mask hook. I'll have a
look again after the merge window.

Cheers,
Ben.
