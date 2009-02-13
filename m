From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: DTS syntax and DTC patches (was: Re: [Qemu-devel] [RFC]
	Machine description as data)
Date: Fri, 13 Feb 2009 13:51:01 +1100
Message-ID: <20090213025101.GC10476@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
	<20090213004305.GB8104@yookeroo.seuss> <4994D6C8.5050004@gmx.net>
	<20090213021704.GA10476@yookeroo.seuss> <4994DED9.6020803@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4994DED9.6020803-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>
Cc: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Coreboot <coreboot-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2009 at 03:45:45AM +0100, Carl-Daniel Hailfinger wrote:
> [Adding the coreboot mailing list to CC. It's moderated for
> non-subscribers, but it won't take long for legitimate mails to be
> approved.]
> 
> On 13.02.2009 03:17, David Gibson wrote:
> > On Fri, Feb 13, 2009 at 03:11:20AM +0100, Carl-Daniel Hailfinger wrote:
> >   
> >> On 13.02.2009 01:43, David Gibson wrote:
> >>     
> >>> On Thu, Feb 12, 2009 at 11:26:46AM +0100, Markus Armbruster wrote:
> >>>   
> >>>       
> >>>> I didn't mean to say they are a bad idea for FDTs, just that they're on
> >>>> an awkward level of abstraction for QEMU configuration.  There, I'd
> >>>> rather express a PCI address as "02:01.0" than as <0x00000220>.
> >>>> Translating text to binary is the machine's job, not the user's.
> >>>>     
> >>>>         
> >>> Ah, I see what you mean.  Hrm, there are several possibilities here,
> >>> we'll have to see which works out best for your purposes.
> >>>       
> >> Using the DTC version included in the coreboot v3 sources would solve
> >> that problem and give you a readable PCI address representation.
> >>     
> >
> > Hrm.. it would be nice if you'd co-ordinated with Jon and I about
> > this.  Then we could have at least the bits which make sense in
> > upstream dtc...
> >   
> 
> Probably the biggest obstacle for a full merge right now is that the
> coreboot v3 DTC is rather old and has been extended not only for a more
> readable DTS syntax variant, but also for additional output modes (C
> header and C code).

If the C output mode is what I'm guessing, it should be pretty easy to
add (we already have an asm output mode upstream).

The syntax changes will be trickier.  I want to review any new syntax
for dts very carefully, because I really, really don't want to have to
break backwards compatibility in future (I'm unhappy enough about the
dts-v0 to dts-v1 transition we've already have).

Can you summarise what the syntax changes are?  Maybe start a new
thread with just devicetree-discuss not the other lists for that.

> We (coreboot developers) are interested in reducing our diff with
> upstream DTC in order to improve maintainability of our DTC code.

Good :)

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
