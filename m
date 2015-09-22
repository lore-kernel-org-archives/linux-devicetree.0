From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] Documentation: dt-bindings: add documentation on
 new DT binding format
Date: Tue, 22 Sep 2015 00:14:40 -0400
Message-ID: <20150922041439.GB14895@beef>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-2-git-send-email-mporter@konsulko.com>
 <CA+bK7J76Z6H4gh-UXxMWqUYrdRx1GYKFkAAtDUszpT_8k=RCQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+bK7J76Z6H4gh-UXxMWqUYrdRx1GYKFkAAtDUszpT_8k=RCQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 01, 2015 at 09:59:14AM -0700, Tim Bird wrote:
> On Thu, Aug 27, 2015 at 10:23 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Documentation explaining the syntax and format of the YAML-based DT binding
> > documentation.
> >
> > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/dt-binding-format.txt      | 106 +++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dt-binding-format.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/Documentation/devicetree/bindings/dt-binding-format.txt
> > new file mode 100644
> > index 0000000..f9acc22
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dt-binding-format.txt
> > @@ -0,0 +1,106 @@
> > +--------------------------
> > +Device Tree Binding Format
> > +--------------------------
> > +
> > +Background
> > +----------
> > +
> > +DT bindings historically were written as text in prose format which
> > +led to issues in usability of that source documentation. Some of
> > +these issues include the need to programmatically process binding
> > +source documentation to do DTS validation, perform mass updates to
> > +format/style, and to generate publishable documentation in HTML or
> > +PDF form.
> > +
> > +Overview
> > +--------
> > +
> > +The DT binding format is based on the YAML text markup language.
> > +Although there are many text markup options available, YAML
> > +fulfills all requirements considered for a DT binding source format
> > +which include:
> > +
> > +1) Must be human readable
> > +2) Must be easily translated to other data formats (XML, JSON, etc).
> > +3) Must have sufficient tools and libraries to enable developers to
> > +   build new tools for DT binding processing
> > +4) Must have a complete spec to refer to syntax
> > +
> > +YAML is documentated in the specification found at
> > +http://www.yaml.org/spec/1.2/spec.html
> > +
> > +The required YAML DT binding tag format and syntax are defined in
> > +the following sections.
> > +
> > +YAML DT Binding Syntax
> > +----------------------
> > +
> > +* Lines starting with "#" are comments and not part of the binding itself
> > +* "%YAML 1.2" starts a file, indicating the version of YAML in use
> 
> I think it would be good to specify a DT Binding Format version as well.
> I would expect we may expand the syntax, or we may alter it, so it
> would be good to have a number for our specific syntax.  This would
> help in some circumstances, if we make multiple passes over the
> documents to achieve our conversion.  Maybe this should be added
> below.

Added this in v2, thanks.

> 
> > +* "---" starts a binding document
> > +* "..." ends a binding document
> > +* Multiple binding documents may exist in a single file
> > +* Tabs are not permitted
> > +* Scope is denoted by indentation of two spaces
> > +* Key value pairs are denoted by "key: value"
> > +* Sequences are denoted by "- "
> > +* Scalar values may convert newlines to spaces and preserve blank
> > +  lines for long description formatting using ">"
> > +* Scalar values may escape all reserved characters and preserve
> > +  newlines by using "|" to denote literal style
> > +
> > +For additional information on YAML syntax, refer to the specification
> > +at http://www.yaml.org/spec/1.2/spec.html
> > +
> > +YAML DT Binding Format
> > +----------------------
> > +
> > +The following YAML types are supported in the DT binding format:
> > +
> 
> Based on my comment above, I recommend:
> [R] binding-format: 1
> 
> > +* [R] id: unique identifier in property form (e.g. skel-device)
> > +
> > +* [R] title: title of the binding
> > +
> > +* [O] maintainer: sequence of maintainers
> > +      [R] name: name and email of maintainer or mailing list in RFC822
> > +                form.
> > +
> > +* [O] description: full description of the binding
> > +
> > +* [O] compatible: sequence of valid compatible descriptors
> > +      [R] name: the compatible string surrounded in double quotes
> > +      [O] deprecated: a deprecated compatible string surrounded in
> > +                      double quotes
> > +      [O] description: description of the compatible string
> 
> compatible is a property like all the others, and I think it's confusing
> to have it in a separate section.  For example, when listing other
> properties, the "name:" field specifies the property name, but for
> the compatible section the "name:" field specifies the possible values
> for the compatible property.  This is (at least to me) quite confusing.
> 
> Can we make this a regular property, with an option 'deprecated' attribute.
> I guess we may need to distinguish between deprecated properties and
> deprecated vales of properties.
> The above 'deprecated' specifies deprecated values for the compatible
> property, while
> the section below specifies deprecated properties.  I don't see a way
> to indicate a deprecated
> value for a still-existing property, but that may be too much detail for now.

I've made an attempt at this in v2. There's some ugly fall-out I haven't
decided the best way to handle. That is, I can show a allowable
compatible strings including a specific, generic type syntax using
C-like expressions. However, showing deprecated compatible requires
a special key. I'll be interested if anybody can suggestion something
cleaner. There's definitely a trade-off in folding compatibles into
properties

> 
> 
> > +* [O] required: sequence of required properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
> 
> I would recommend we add types and value constraints to the
> binding schema:
> 
> [O] type: type of value for this property, and if specified must be
> one of the following (without quotes):
> "string", "number", "array", "phandle"

I modified this a bit to be "string", "int", "array", "phandle", and
"empty". I find "empty" to be useful for those properties and a
validator will find that useful to validate those boolean type
property switches it encounters i.e. skip constraint checking

> [O] value constraint: specifies a limit on the value for a property.
> This can be specified as English text, or be a range or choice constraint.
> The latter two should be expressed with the following exact english
> phrases (without quotes):
> "must be in the range x to y, inclusive"
> where x and y are numbers
> "must be one of <choice 1>, <choice 2>, ..."
> where <choice x> is a string, which should be quoted
> if it includes a comma.

Got them, but Pantelis' C syntax suggestion for constraints seemed
popular and flexible so I went with that initially, please let me
know what you think of that.

> 
> Any other constraint is expressed in free-form English text

Yes, I believe the description field can hold this information
until bindings are fully converted with constraint info in the 
C-syntax (if we stick with that).

> I would recommend adding these to this binding schema doc, but
> not requiring them on the first conversion pass of the docs.

Sounds good.

> Basically my idea is that you want the each pass over the binding
> documents to be as painless as possible.  Every time a user encounters
> something they're not sure about, it will slow them down.  There will
> be lots of ambiguous situations, and we want the process to be as
> lossless as possible, so I would recommend a strategy of doing as
> much as people can, and if in doubt just put any outstanding text
> in the descriptions.  The descriptions will always be free-form text,
> and we can come along later and convert these to types, constraints,
> as we see fit.

Agreed!

> > +* [O] optional: sequence of optional properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
> > +
> > +* [O] deprecated: sequence of deprecated properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
> > +
> > +* [R] example: sequence of examples:
> > +      [R] dts: DT source of example usage. The example text must use
> > +               literal style ("|") so that it retains indentation and
> > +               newlines.
> > +      [O] description: description of the example
> > +
> 
> I'd recommend having a top-level notes section:
> * [O] note: any other notes about this node that are not covered by
> preceding property descriptions.

Added in v2, thanks.

> 
> > +Note: [R] and [O] denote required and optional fields, respectively.
> 
> I'd put this note before the format description.

Done, thanks.

> 
>  -- Tim
> 
> > +
> > +Skeleton Binding
> > +----------------
> > +
> > +The skeleton.yaml binding found in the top of the DT binding tree
> > +is the canonical example of syntax and format to use when writing
> > +a DT binding document. It is maintained with the latest formatting
> > +conventions, making it the best starting point when writing a new DT
> > +binding.
> > --
