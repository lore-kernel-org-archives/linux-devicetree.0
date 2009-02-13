From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 12:05:50 +1100
Message-ID: <20090213010550.GE8104@yookeroo.seuss>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<87prhnwltz.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87prhnwltz.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 12, 2009 at 07:29:12PM +0100, Markus Armbruster wrote:
> "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> writes:
[snip]
> > However, every board that's being produced for powerpc has the DTB at
> > least available.  It has to be, or (recent?) Linux kernels flat out
> > won't work.  This suggests that it might be a good idea to look at
> > this format.
> >
> > There's DTS and DTB.  One is the source, the other is the binary
> > created from the source.  I'd recommend that qemu actually use the DTB
> > rather than the DTS to implement things.  This way one could have a
> > nicer syntax like the above and generate the DTB, or one could use the
> > DTS provided by a vendor if there was a more specific board they
> > wanted qemu to emulate.
> 
> As far as I know, dtc can decompile DTB into DTS.

That's correct.  However, like many decompilation processes,
converting dts->dtb->dts is usually a lossy process to some extent.
dts has multiple ways to represent some things for readability
reasons, which don't affect the content of the compiled tree.

> I'm not a fan of DTS syntax either, but if we choose FDT, then inventing
> an alternative syntax seems rather pointless to me.

If you have suggestions for improving dts that don't involve
completely breaking compatibility with existing trees, we might be
able to incorporate them into dtc to make everyone's life easier.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
