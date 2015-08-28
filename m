From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Fri, 28 Aug 2015 13:49:37 -0400
Message-ID: <20150828174937.GB24203@beef>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-3-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 09:53:06AM -0500, Rob Herring wrote:
> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Add a skeleton DT binding document that serves as the canonical
> > example for implementing YAML-based DT bindings documentation.
> > The skeleton binding illustrates use of all fields and variations
> > described in the dt-binding-format.txt documentation.
> >
> > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Documentation/devicetree/bindings/skeleton.yaml
> > new file mode 100644
> > index 0000000..175965f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/skeleton.yaml
> > @@ -0,0 +1,98 @@
> > +%YAML 1.2
> > +---
> > +id: skel-device
> > +
> > +title: Skeleton Device
> > +
> > +maintainer:
> > +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> We'd want to tie this into get_maintainers.pl obviously.

Right, I broke my rule of "no new tags for content we don't already
have" by adding this. It stems out of the discussion at LPC where
Mark suggested we could avoid the core bindings being moved by adding
maintainer info into the binding itself.

This is an area where more docs are needed. Ideally, on the first pass
conversion we would not attempt to populate these. I had considered
that we *could* only add maintainer: tags on core bindings to and
adjust get_maintainers.pl to use that info to override the standard
directory-based info if it exists. I don't think it's necessary to add
a specific maintainer for all of the peripheral bindings if the default
is the subsystem maintainer and the dt list. We could at least start
directing core binding discussion to the -spec list which is where I
think you'd like it.

> > +
> > +description: >
> > +  The Skeleton Device binding represents the SK11 device produced by
> > +  the Skeleton Corporation. The binding can also support compatible
> > +  clones made by second source vendors.
> > +
> > +compatible:
> > +  - name: "skel,sk11"
> > +  - name: "faux,fx11"
> 
> Is this an OR or AND? We need both.

True, this only covers the OR case atm.

> The complicated case is "one of {specific names} followed by {generic name}."

I need to rethink these. I do have deprecated: tag for that case and
possibly "name:" gets split to "generic:" and "specific:" and we can
then do the right thing.

For the above I would have:

compatible:
  - specific: "skel,sk11"
  - specific: "faux,fx11"

and something like the Allwinner simple framebuffer would be:

compatible:
  - generic: "simple-framebuffer"
  - specific: "allwinner,simple-framebuffer"

where our validator would insist on seeing one of the specific: tags
along with the generic: tag. A lot of bindings, given current doc
patterns would just have two tags like above.

> > +    description: A clone of the original sk11 device
> > +
> > +required:
> > +  - name: "reg"
> 
> We definitely need type info from the start.

Are you sure? Ugh.

My big contention here is that we don't carry that content in the
docs today so we shouldn't try to add it in the initial conversion.

I think you are right in that we should have it documented in the
schema but I'm concerned that we make the starting conversion
effort too large by adding type info to all converted docs.

I think we gain a lot even without at the start, but I understand
why we need it and how it will help reduce the review firehose
with the associated validation tools.

> 
> > +    description: chip select address of skeleton device
> > +    reference: spi-slave
> 
> I would like to not have to list properties if the inherited binding
> lists it. The problem is we need to say how many cells and the order
> (not a problem here, but for mmio devices).

Yeah, make sense.

> Perhaps we can list the reference at the top level for the node
> instead of for every property.

That's a good point. I was wondering if per prop references would
get unwieldy once we actually add them into all the converted docs.
There's a huge number of existing docs without proper references.

Ok, I'll take a look at collecting references per group of properties.

> 
> > +  - name: "spi-max-frequency"
> > +    description: >
> > +      Maximum SPI clocking speed of skeleton device in Hz, must be
> > +      1000000
> > +    reference: spi-slave
> 
> Rather than listing the property and having constraint in description,
> perhaps we could add constraints like this:
> 
> - spi-max-frequency-range: 1000000 1000000
> 
> Or groups of constraints:
> 
> - spi-max-frequency-constraints:
>   range: 1000000 1000000
>   some-other-constraint: <value>

I was hoping to avoid this to start due to my argument for keeping it
simple for the first pass at conversion. However, the latter looks
flexible enough. We have cases with enumerated values as well to handle
the require some thought.

> > +
> > +optional:
> > +  - name: "spi-cs-high"
> > +    description: >
> > +      Set if skeleton device configuration straps are set for chip
> > +      select polarity high
> > +    reference: spi-slave
> > +
> > +deprecated:
> > +  - name: "skel,deprecated1"
> > +    description: >
> > +      First of two deprecated properties.
> > +  - name: "skel,deprecated2"
> > +    description: >
> > +      Second of two deprecated properties.
> > +
> > +example:
> > +  - dts: |
> > +      sk11@0 {
> > +              compatible = "skel,sk11";
> > +              reg = <0>;
> > +              spi-max-frequency = <1000000>;
> > +              spi-cs-high;
> > +      };
> 
> At least in this example, we could generate it. Examples are nice, but
> we have dts files full of examples already. I get a fair number of
> "fix the example" patches, so maybe we should eliminate the simple
> ones.

Yeah, I would say that a huge majority of the examples we have now
become useless with this format. I like that idea of just generating
it for those users trying to read and understand what it looks like in
dts form. Less room for error. We can retain the examples field for
those complex examples that need human intervention to craft and
describe them properly.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
