From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 5/5] of/irq: merge of_irq_map_one()
Date: Fri, 18 Jun 2010 09:57:25 +1000
Message-ID: <1276819045.8826.45.camel@pasglop>
References: <20100604212134.10552.70717.stgit@angua>
	<20100604212155.10552.19260.stgit@angua>
	<1276152002.1962.55.camel@pasglop>
	<AANLkTinmDFBvAjcjrgf3RHuiXgNxVV20yLzBaqhE5lrk@mail.gmail.com>
	<1276219072.1962.82.camel@pasglop>
	<AANLkTin5K0IL5iKj9i9qBucSpQz2-p5wIvUtC4iU0jUP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTin5K0IL5iKj9i9qBucSpQz2-p5wIvUtC4iU0jUP-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-06-17 at 17:11 -0600, Grant Likely wrote:
> On Thu, Jun 10, 2010 at 7:17 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Thu, 2010-06-10 at 17:36 -0600, Grant Likely wrote:
> >>
> >> Okay.  I had been trying to avoid #ifdefs in the common code, but
> >> you're probably right.  I'll rework.
> >
> > Not even ifdef's ... just move the quirk map there. You can always
> > #define the quirk variable to 0 on archs that have no quirks, to
> > make it compile away if you believe it represents bloat, but they
> > are simple well localized things so I doubt it matters.
> 
> They're pretty small, but powermac32 is the only code that actually
> uses the quirk facility.  Everything else parses sanely it would
> appear.  I'd rather have them localized to the powermac code and
> eliminate the quirks from the common code.

Maybe, but the way you end up gutting out some internal functions of the
parser so they can be overriden by the arch is just plain gross :-) And
more bloat than just having a localized quirk test which can easily
compile to nothing when powermac isn't built.

IE. I'd rather you then add some kind of of_irq_map_fixup() or something
like that in the generic code that can be an empty inline when powermac
isn't there, and be defined by powerpc to do the right thing then,
rather than move the core of the function to a separate weak version.

Because the day you fix a bug in the weak variant, or change a calling
convention, you'll forget to also update the "overrides" in the arch.

> If other platforms show up with bad irq mappings, then I want to take
> the approach of fixing the data rather than adding more quirks cases.
> 
> Anyway, let me try my hand at reworking to be a lot clearer and see
> what it looks like.

Ben.
