From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Mega rename of device tree routines from of_*() to dt_*()
Date: Wed, 24 Nov 2010 10:32:11 -0800
Message-ID: <ee487d0b-ec9d-42a9-9c8e-39f83858cffc@SG2EHSMHS007.ehs.local>
References: <1290607413.12457.44.camel@concordia>
	<fa44e045-9600-4c46-939a-af246afab4f6@VA3EHSMHS019.ehs.local>
	<4CED48CE.5060300@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <4CED48CE.5060300-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: David Daney [mailto:ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org]
> Sent: Wednesday, November 24, 2010 9:18 AM
> To: Stephen Neuendorffer
> Cc: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org; LKML; linux-mips; microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org; devicetree-
> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-dev list; sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: Mega rename of device tree routines from of_*() to dt_*()
> 
> On 11/24/2010 09:02 AM, Stephen Neuendorffer wrote:
> >
> >
> >> -----Original Message-----
> >> From: linuxppc-dev-bounces+stephen=neuendorffer.name-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [mailto:linuxppc-dev-
> >> bounces+stephen=neuendorffer.name-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of Michael Ellerman
> >> Sent: Wednesday, November 24, 2010 6:04 AM
> >> To: LKML
> >> Cc: linux-mips; microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-
> dev
> >> list; sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: RFC: Mega rename of device tree routines from of_*() to dt_*()
> >>
> >> Hi all,
> >>
> >> There were some murmurings on IRC last week about renaming the of_*()
> >> routines. I was procrastinating at the time and said I'd have a look at
> >> it, so here I am.
> >>
> >> The thinking is that on many platforms that use the of_() routines
> >> OpenFirmware is not involved at all, this is true even on many powerpc
> >> platforms. Also for folks who don't know the OpenFirmware connection it
> >> reads as "of", as in "a can of worms".
> >>
> >> Personally I'm a bit ambivalent about it, the OF name is a bit wrong so
> >> it would be nice to get rid of, but it's a lot of churn.
> >>
> >> So I'm hoping people with either say "YES this is a great idea", or "NO
> >> this is stupid".
> >
> > Personally, I think it's a great idea, if only because I stared long and hard
> > at the code once upon a time trying to figure out what is really OF-related
> > and what isn't.  It's somewhat clearer now that drivers/of has been factored
> > out (although, shouldn't it be drivers/dt???)
> >
> > That said, it *is* alot of code churn.  If it's going to be done, I think it should be
> > done in concert with fixing a bunch of the function names which don't really follow any
> > sane naming convention, so that the backporting discontinuity only happens once.
> >
> 
> Oh, you mean things like:
> 
> of_{,un}register_platform_driver vs. platform_driver_{,un}register
> 
> That one is particularly annoying to me.
> 
> David Daney

Actually, I was particularly thinking of drivers/of/fdt.c, which I was recently hacking around with,
but I'm sure there are others... :)

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
