From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: esdhc binding compatiable
Date: Mon, 4 May 2009 16:11:10 -0500
Message-ID: <20090504211110.GC28413@ld0162-tx32.am.freescale.net>
References: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54E4E37F-460A-4BB4-9DE1-670360D649A6-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Phillips Kim-R1AAHA <Kim.Phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 04, 2009 at 08:54:28AM -0500, Kumar Gala wrote:
> There has been some discussion on various lists about what the binding  
> doc says w/regards to compat binding for eSHDC on 83xx, 85xx, pxxxx.
> 
> My thinking is that we wanted to avoid "fsl,eshdc" as possibly being  
> to generic (some theory that esdhc might be same or similar controller  
> on iMX devices from FSL).  If that's the case I'm thinking something  
> like:

If it's the *same* controller, then it should have the same compatible
(and the same driver).

> fsl,pq-eshdc	(covers 83xx, 85xx family)
> fsl,qoirq-esdhc (covers any new p2xxx, p4xxx, etc..)

And then a new one when marketing changes the name again?  It was first
introduced on a "pq" chip (among those chips which are currently using a
device tree at all), so use "pq" if we need a prefix.

Newer versions could have "qoriq" as a prefix if those versions never
appeared on a "pq" chip.

I'm inclined to leave the prefix off, though, if the block is truly
shared (naming and version numbering intact) across Freescale.

> and if imx needs it
> 
> fsl,imx-esdhc
> 
> this would be the base compatible.  In addition to that we've  
> discussed having a fsl,pq-eshdc-vX.Y compat to match the IP version in  
> the specific SoC.

I think we should only have the versioned compatible (with significant
older but compatible versions listed additionally).  Otherwise it's
not obvious that "fsl,esdhc" is really "fsl,esdhc-v1.0".

-Scott
