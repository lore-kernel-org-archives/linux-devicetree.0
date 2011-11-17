From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Best practice for compatible strings?
Date: Thu, 17 Nov 2011 08:46:04 -1000
Message-ID: <4EC5566C.4030508@firmworks.com>
References: <20111117182543.GD3044@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111117182543.GD3044-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the original instigator of the generic names scheme, I can tell you 
what I had in mind.  That may not be the way things have evolved, but at 
least it's a data point.

The idea is that there are devices for which there are preexisting 
drivers.  Hardware designers often design new hardware that is 
compatible with older hardware so that the old driver can be used.  The 
new hardware often has additional features that can be used with new 
drivers, but at least the device is basically functional with the old 
driver.

The point of a non-specific fallback entry in a compatible property is 
to match an old driver that is known to be present in some important 
extant version of an OS.

In the absence of a preexisting legacy programming model and the 
corresponding old driver, there isn't much point in trying to "invent" a 
non-specific name.  I suppose that, theoretically, it might be possible 
to come up with a least-common-denominator programming model across a 
family of newly-designed devices, but that's not the way it usually 
works in practice, except in the case of a programming model defined by 
a standards committee.  More typically, a particular device gets some 
traction in the market, and then people copy that.

This model of driver evolution is more compelling for operating systems 
with a different development and distribution model than Linux's.  In 
the Linux world, it is hard to point to a specific shipping version and 
say "we must be compatible with that because it is what is already out 
there".

The bottom line:  In my opinion, if there is no preexisting driver that 
you can't change, there is little need for a non-specific name in the 
compatible list.

On 11/17/2011 8:25 AM, Dave Martin wrote:
> Hi Grant,
>
> There seems to be some confusion about how to define and use compatible
> strings in the device tree.  The ePAPR specification doesn't seem to
> spell this out.  If, as is probable, this discussion has happened
> already then feel free to point me to the conclusions.  I don't mean
> to imply that everyone is confused, but I am.
>
> Anyway, my uncertainty boils down to how to know when do define/use more
> specific names, and when to define/use more general names.
>
> [Apologies for verboseness -- as you will see, I was having a hard
> time pinning down what the question is, never mind the answer...]
>
> For example, since the initial Verstaile Express upstream support will
> almost certainly not support all variants from a single machine
> definition, it's unclear whether we should have a "arm,vexpress"
> compatible string at all.  Logically, such a string would be generic
> such that it encompassed not only all versatile express based platforms
> which exist now, but all those which will ever exist in the future.
> Generic strings are attempts to foretell the future, and may turn out to
> be misguided.  However, without this string in device trees, if there
> are eventually hundreds of vexpress based platforms, then the relevant
> board support and drivers in the kernel would have to list all of them
> in their compatible lists.
>
> So, is there a rule for distinguishing between generic compatible
> strings which capture something meaningful (which are probably a good
> idea) and those which do not (i.e., a bad idea).
>
> Finally, is there a convention for what common prefixes should mean?
> It sort of looks like there ought to be, but this can be problematic:
>
> Logically, I might suppose that:
>
>    1) "arm,vexpress" is more general than "arm,vexpress-v2p-ca9".
>    2) "arm,vexpress-v2p-ca9" is not more general than
> "arm,vexpress-v2p-ca5s", nor vice versa.  However, they may have some
> common features which could be possibly described by any common prefix
> of the two strings (such as "arm,vexpress" or "arm,vexpress-v2p" or
> whatever.
>
> However, apart from the vendor prefix convention there does not seem to
> be any formal convention about the anatomy of compatible strings.
> "arm,vexpress-1" might have no connection whatever with "arm,vexpress"
> (except that they come from the same vendor).  Nonetheless, the visual
> similarity may tempt people to believe that there is a deeper
> connection even if there isn't.
>
> (1) causes a particular problem: if an initial attempt to define a
> generic compatible string fails because a future device doesn't fit the
> meaning of the initial generic compatible string, then a new, different
> string is required which does not just append a suffix.  It is desirable
> in such a case to define a _new_ super-generic string to encompass all
> the cases (including the new ones we didn't originally foresee) -- but
> it becomes impossible for that new generic string to be a common prefix
> of all the specific strings it encompasses, so that although the generic
> string can be logically generic, it will not look generic...
>
> Suppose in the future we have some crazy thing like
> "arm,vexpress-v2p-ca25", but it isn't compatible with the original
> definition of "arm,vexpress".  People reading the strings will naturally
> assume compatibility, since the strings look similar.  If we want a new
> super-generic string (we probably do, since we would want to consolidate
> the kernel support), it would have to be something like
> "arm,brand-spanking-new-vexpress", since calling the new string
> "arm,vexpress-*" would give a misleading (reversed) impression of
> compatibility.  But the relationship between that and any of the other
> compatible strings is non-obvious.  The tempting alternative,
> redefinition of "arm,vexpress" to encompass the new platform is
> presumably not an option, because it would mean that new device trees
> would be misinterpreted/mishandled by old kernels and vice versa.
>
> Part of the problem is that in this situation, the actual definition of
> "arm,vexpress" is likely never to be properly clarified -- it is assumed
> initially to be obvious, and an undocumented de facto meaning arises
> from the way this string gets baked into the code.  Because this
> definition may end up distributed around various bits of code and may
> not match what was originally intended, it may be nearly impossible to
> construct a sensible meaning post-hoc which does not conflict with the
> implementation at some or all points in time.
>
> This seems to imply that compatible strings with generic meanings need
> to be very carefully thought out and precisely specified if they are not
> to be useless.  Unfortunately, instinct tends to suggest that those
> levels of care or recision are not needed for generic things, resulting
> in compatible strings which are vague instead of being generic in a
> precise way.
>
> Possibly I've answered my own question here, but I'd be interested
> in your view on it...
>
> Cheers
> ---Dave
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
