From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: esdhc binding compatiable
Date: Mon, 4 May 2009 19:34:16 -0500
Message-ID: <20090504193416.7ec102bd.kim.phillips@freescale.com>
References: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>
	<20090504211110.GC28413@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090504211110.GC28413-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Phillips Kim-R1AAHA <Kim.Phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 4 May 2009 16:11:10 -0500
Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> I'm inclined to leave the prefix off, though, if the block is truly
> shared (naming and version numbering intact) across Freescale.

agreed.

> > this would be the base compatible.  In addition to that we've  
> > discussed having a fsl,pq-eshdc-vX.Y compat to match the IP version in  
> > the specific SoC.
> 
> I think we should only have the versioned compatible (with significant
> older but compatible versions listed additionally).  Otherwise it's

I'd say 'all' instead of 'significant', because one never knows what
the driver might think significant as it gets developed further down
the road.

> not obvious that "fsl,esdhc" is really "fsl,esdhc-v1.0".

minor nit:  I'd remove the "-v" to make it "fsl,esdhc1.0".  It's really
no loss of clarity, and it saves space.

Kim
