From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Make sure appended device tree data won't overlap
	kernel BSS
Date: Fri, 13 May 2011 15:09:52 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1105131507150.5787@xanadu.home>
References: <20110429102623.GX3755@atomide.com>
	<alpine.LFD.2.00.1104290909310.24613@xanadu.home>
	<20110429135334.GR5126@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1104291509540.24613@xanadu.home>
	<20110504072317.GU2092@atomide.com>
	<alpine.LFD.2.00.1105040936040.24613@xanadu.home>
	<20110509111929.GA11410@atomide.com>
	<20110509144949.GE30958@atomide.com>
	<20110512125952.GN31483@atomide.com>
	<alpine.LFD.2.00.1105130930330.2762@xanadu.home>
	<20110513112120.GO31483@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110513112120.GO31483-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 13 May 2011, Tony Lindgren wrote:

> * Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> [110513 00:35]:
> > On Thu, 12 May 2011, Tony Lindgren wrote:
> > >
> > > +		str	r1, [sp, #0]		@ save offset into stack
> > 
> > This is actually outside the stack area if you want to be strictly 
> > correct.  Should be "str r1, [sp, #-4]!".
> 
> Thanks, yes we should use it like stack now. Updated patch below.
>  
> > Anyway, both this patch tand the DT append patch won't apply or work 
> > correctly anymore due to my latest cleanup series without minor 
> > adjustments.
> 
> OK, no problem. Got those cleanup patches available somewhere?

They,re available in branch 'zImage_fixes' of git://git.linaro.org/people/nico/linux
and in RMK's devel-stable branch as well.


Nicolas
