From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH RFC 1/8] powerpc: mpc512x_dma: add support for data
 transfers between memory and i/o memory
Date: Sun, 14 Jul 2013 13:07:08 +0200
Message-ID: <20130714110708.GC7080@book.gsilab.sittig.org>
References: <1373642781-32631-1-git-send-email-gsi@denx.de>
 <1373642781-32631-2-git-send-email-gsi@denx.de>
 <51E277E5.8050305@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E277E5.8050305-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
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
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 14, 2013 at 12:05 +0200, Lars-Peter Clausen wrote:
> 
> On 07/12/2013 05:26 PM, Gerhard Sittig wrote:
> [...]
> ]
> > +		if (mchan->tcd_nunits)
> > +			tcd->nbytes = mchan->tcd_nunits * 4;
> > +		else
> > +			tcd->nbytes = 64;
> 
> Just wondering where does the magic 64 come from?

"Inherited" from Alexander's submission.  By coincidence the SDHC
client happened to work with this constraint, as did Alexander's
LPB test suite.  I'm not aware of other DMA clients as of now
(except for the memory transfer, which runs a different prep
routine).

It looks like there is more potential for generalization and auto
adapting to user input (adjusting configurable inner-loop
parameters to exactly fullfill the overall job from the user's
spec yet meet the chunking constraints of the hardware).


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
