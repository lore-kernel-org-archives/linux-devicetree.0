From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/4] dtc/libfdt: sparse fixes
Date: Wed, 14 Nov 2012 18:46:30 -0600
Message-ID: <20121114184630.64242a970b40c2b3b55f54a2@freescale.com>
References: <20121113183430.472a0d989815fbd73ee9b437@freescale.com>
 <20121114102303.GF32290@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121114102303.GF32290-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Nov 2012 21:23:03 +1100
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

> Hrm.  The patch comment shows a lot of sparse warnings, but the patch
> looks like the basic conversion of the code from uint32_t to
> annontated fdt32_t types.

not sure what you're getting at: isn't this to be expected?  Anyway,
I'm going to guess you mean to re-word the commit message.

>  I also never saw a 3/4.  Has something gone
> wrong with the patch sending?

I sent 3/4 in reply-to your comments on v1 of the patch, and the
rest without the reply-to reference, so 3/4 might show up out of
order in your inbox, depending on how it's configured.  I'll send
the entire series with the same reference - jdl's comments to v2 -
instead next time.

Kim
