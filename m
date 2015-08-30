From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] Documentation: dt-bindings: add documentation
 on new DT binding format
Date: Sun, 30 Aug 2015 15:04:33 -0700
Message-ID: <55E37DF1.3080102@gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com> <1440739433-6799-2-git-send-email-mporter@konsulko.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-2-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8/27/2015 10:23 PM, Matt Porter wrote:
> Documentation explaining the syntax and format of the YAML-based DT binding
> documentation.
> 
> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/dt-binding-format.txt      | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dt-binding-format.txt
> 
> diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/Documentation/devicetree/bindings/dt-binding-format.txt
> new file mode 100644
> index 0000000..f9acc22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dt-binding-format.txt
> @@ -0,0 +1,106 @@
> +--------------------------
> +Device Tree Binding Format
> +--------------------------
> +
> +Background
> +----------
> +
> +DT bindings historically were written as text in prose format which
> +led to issues in usability of that source documentation. Some of
> +these issues include the need to programmatically process binding
> +source documentation to do DTS validation, perform mass updates to
> +format/style, and to generate publishable documentation in HTML or
> +PDF form.
> +
> +Overview
> +--------
> +
> +The DT binding format is based on the YAML text markup language.
> +Although there are many text markup options available, YAML
> +fulfills all requirements considered for a DT binding source format
> +which include:
> +
> +1) Must be human readable
> +2) Must be easily translated to other data formats (XML, JSON, etc).
> +3) Must have sufficient tools and libraries to enable developers to
> +   build new tools for DT binding processing
> +4) Must have a complete spec to refer to syntax
> +
> +YAML is documentated in the specification found at
> +http://www.yaml.org/spec/1.2/spec.html
> +
> +The required YAML DT binding tag format and syntax are defined in
> +the following sections.
> +
> +YAML DT Binding Syntax
> +----------------------
> +
> +* Lines starting with "#" are comments and not part of the binding itself
> +* "%YAML 1.2" starts a file, indicating the version of YAML in use
> +* "---" starts a binding document
> +* "..." ends a binding document
> +* Multiple binding documents may exist in a single file
> +* Tabs are not permitted
> +* Scope is denoted by indentation of two spaces
> +* Key value pairs are denoted by "key: value"
> +* Sequences are denoted by "- "
> +* Scalar values may convert newlines to spaces and preserve blank
> +  lines for long description formatting using ">"
> +* Scalar values may escape all reserved characters and preserve
> +  newlines by using "|" to denote literal style
> +
> +For additional information on YAML syntax, refer to the specification
> +at http://www.yaml.org/spec/1.2/spec.html
> +
> +YAML DT Binding Format
> +----------------------
> +
> +The following YAML types are supported in the DT binding format:
> +
> +* [R] id: unique identifier in property form (e.g. skel-device)
> +
> +* [R] title: title of the binding
> +
> +* [O] maintainer: sequence of maintainers
> +      [R] name: name and email of maintainer or mailing list in RFC822
> +                form.
> +
> +* [O] description: full description of the binding
> +
> +* [O] compatible: sequence of valid compatible descriptors
> +      [R] name: the compatible string surrounded in double quotes
> +      [O] deprecated: a deprecated compatible string surrounded in
> +                      double quotes
> +      [O] description: description of the compatible string
> +
> +* [O] required: sequence of required properties:
> +      [R] name: name of the property surrounded in double quotes
> +      [R] description: description of the property
> +      [O] reference: optional reference to a binding id
> +
> +* [O] optional: sequence of optional properties:
> +      [R] name: name of the property surrounded in double quotes
> +      [R] description: description of the property
> +      [O] reference: optional reference to a binding id
> +
> +* [O] deprecated: sequence of deprecated properties:
> +      [R] name: name of the property surrounded in double quotes
> +      [R] description: description of the property
> +      [O] reference: optional reference to a binding id

I commented in reply to patch 0 that we should think through how
this structure will support adding new features as the next step
after converting existing bindings.

The specific case I started thinking about was the distinction between
required, optional, required-if, and optional-if.  A property might
be required in all cases, optional in all cases, required in some
specified cases, and/or optional in some specified cases.  So a
property could be both "required-if" and "optional-if".  Or it
might just be one of the two.

Here is where my YAML ignorance jumps out.  I really do not know the
best way to approach it.  And I do not know if the syntax I am using
is even remotely correct - I am trying to extrapolate from the examples
in the spec, without having read past the examples yet.  My naive knee
jerk alternatives where (by example, because I can explain it more
concisely that way instead of the way it should be described in this file):

---- (1)

required:
  - &P1
    name: "prop1"
    required-if: < some condition >

optional:
  - *P1
    optional-if: < some other condition>
  - name: "prop2"
    required: true
  - name: "prop3"
    optional: true

---- (2)

property:
  - name: "prop1"
    required-if: < some condition >
    optional-if: < some other condition >
  - name: "prop2"
    required: true
  - name: "prop3"
    optional: true


In a related question, I commented in my reply to patch 0 that some of
the information about the compatible got lost in the conversion from
the existing binding to the YAML format.  That led me to wonder why
the compatible property should be at the YAML top level (same as
"optional" and "required").  My (again naive, YAML amateur) thought
is that the form should be something like:

[O] property:
    [R] optional: | required: | required-if: | optional-if: | required-if: optional-if:
    [O] deprecated: a deprecated compatible string surrounded in
                    double quotes | ???
    [R] name: name of the property surrounded in double quotes
    [R] description: description of the property
    [O] reference: optional reference to a binding id

Apologies for bizarre format for "optional:", but for the purposes of this
comment, hopefully my intent will be clear.

Then "compatible" becomes just another "property:", just as it is in the
.dts, but any processing or analysis tool knows that the name "compatible"
is used in a very specific way and has magical meaning for .dts.

Then if compatible is just another "property:" then the information that
lost was in the conversion process would not be lost, it would appear
in "description:".


> +
> +* [R] example: sequence of examples:
> +      [R] dts: DT source of example usage. The example text must use
> +               literal style ("|") so that it retains indentation and
> +               newlines.
> +      [O] description: description of the example
> +
> +Note: [R] and [O] denote required and optional fields, respectively.
> +
> +Skeleton Binding
> +----------------
> +
> +The skeleton.yaml binding found in the top of the DT binding tree
> +is the canonical example of syntax and format to use when writing
> +a DT binding document. It is maintained with the latest formatting
> +conventions, making it the best starting point when writing a new DT
> +binding.

It would be good to have a comment of YAML style.  Looking at the spec,
there appear to be multiple ways to format content that is functionally
equivalent.  For example:

   # a flow sequence
   - [name        , hr, avg  ]
   - [Mark McGwire, 65, 0.278]
   - [Sammy Sosa  , 63, 0.288]

vs.

   # a flow mapping
   Mark McGwire: {hr: 65, avg: 0.278}
   Sammy Sosa: {
       hr: 63,
       avg: 0.288
     }

This is my first quick reading of the YAML spec, so maybe a flow sequence and
a flow mapping are not equivalent, but that was my naive impression.

I think that in the interest of human readability (requirement 1), that a
specific formatting style should be specified.  That will make life easier
for people who do not know YAML, but are (1) merely copying from existing binding
docs to create new ones, or (2) trying to understand how different bindings
differ.

-Frank
