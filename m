From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] dtc/libfdt: sparse fixes
Date: Thu, 15 Nov 2012 14:53:05 +1100
Message-ID: <20121115035305.GH32290@truffula.fritz.box>
References: <20121113183430.472a0d989815fbd73ee9b437@freescale.com>
 <20121114102303.GF32290@truffula.fritz.box>
 <20121114184630.64242a970b40c2b3b55f54a2@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121114184630.64242a970b40c2b3b55f54a2-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 06:46:30PM -0600, Kim Phillips wrote:
> On Wed, 14 Nov 2012 21:23:03 +1100
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> > Hrm.  The patch comment shows a lot of sparse warnings, but the patch
> > looks like the basic conversion of the code from uint32_t to
> > annontated fdt32_t types.
> 
> not sure what you're getting at: isn't this to be expected?  Anyway,
> I'm going to guess you mean to re-word the commit message.

Ah, I see what you're getting at, and yes.  The current message
suggests this is fixing real endian problems found by sparse, rather
than being almost a mechanical replacement of uint32_t with fdt32_t.
If there are real bug fixes, I'd prefer to see that broken out into a
different patch.

> >  I also never saw a 3/4.  Has something gone
> > wrong with the patch sending?
> 
> I sent 3/4 in reply-to your comments on v1 of the patch, and the
> rest without the reply-to reference, so 3/4 might show up out of
> order in your inbox, depending on how it's configured.  I'll send
> the entire series with the same reference - jdl's comments to v2 -
> instead next time.

Ok.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
