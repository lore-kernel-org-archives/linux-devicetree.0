From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] Documentation: dt-bindings: add documentation on
 new DT binding format
Date: Tue, 8 Sep 2015 17:36:43 +1000
Message-ID: <20150908073643.GE24774@voom.redhat.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-2-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440739433-6799-2-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 01:23:49AM -0400, Matt Porter wrote:
> Documentation explaining the syntax and format of the YAML-based DT bindi=
ng
> documentation.

Sorry I've taken so long to comment; I've had sickness and a backlog
of day-job work to deal with.

> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/dt-binding-format.txt      | 106 +++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dt-binding-format.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/Do=
cumentation/devicetree/bindings/dt-binding-format.txt
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

I've read through this.  At least tentatively, YAML seems like a
pretty good choice to me.  It seems to have a pretty good balance
between human readability and machine parsability.


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

I think the recommended indentation should be increased.  At just 2
spaces it's easy to lose track of indentation level if you scroll down
a page.

8 would match the kernel code style, but might get cumbersome since I
think our YAML structures will probably be more deeply nested in
practice than code blocks generally should be.

So, I'd suggest 4.

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

I find the wording above really confusing.  Mentioning "types" makes
me thinnk you're talking about the actual YAML tags, which usually
have typing information, but actually you seem to be talking about the
expected members of the top level YAML mapping.

Speaking of YAML tags, we really should specify the YAML schema we're
using here.  From the rest of the stuff, I'm assuming it's the "Core"
schema described in section 10.3 of the YAML spec.  That seems a
reasonable first choice to me, although eventually we may want to
define our own YAML schema.

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

So, when thinking about DT validation, I like to make a distinction
between the binding's "key" and its requirements.  By the "key"
(because I haven't thought of a better term) I mean the thing that
tells you this binding is in play.  From a validator's point of view,
given a DT node and a library of bindings, it needs to check that if
the node matches the key, then it must match all the binding's requirements.

For most bindings that will be a particular value listed in
'compatible', but there are other cases.  I'm fine if 'compatible' is
the only style of "key" we support initially, but I'd like to see a
higher level structural break between the "key" part of the binding
and the requirements.

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

I'm not sure if it will work better to put require / optional
etc. properties into different sections as you have here, or if it
would be better to tag each property with "required", "optional",
"required-when" and so forth.

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

So the other thing I'd like to see in our very first implementation is
at least minimal checking of the binding itself.  Initially, just
checking that it is valid YAML would be enough, I think.  But the
quoting and nesting rules in YAML are pretty subtle, so I could easily
see someone writing something based on existing examples that looks ok
to a human, but doesn't quite meet the YAML spec rules.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7pALAAoJEGw4ysog2bOS/R0P/1oFNHAA2BdTFAGLlLDJ5uxj
WBGKQ82z6ijm3AFlwMKW4V/SLlZ9n9GsNB+eNI3Iv6v+KWYPlZ8A+Wij5o+V6/r2
wENuwMs20nLKHz18fkubVaaQP5Pp2JFqeB4t42dkSJLwfx861770egqsq/V9dwft
jdDgg7bDEinIDy/Op9yyciIZS6ZIJUoLUtp8abNNfF3BlPQQ9jc5jOsE3y12aR7r
ATtCbbpT57Nx/ek2dDc2B7tssdnvlW6dhSP7etAC2dCQbSgym20m1dl5XkynJtTq
Irtj1PhRu3g2A+mu7sUgZEN5+RD/NcIHGUJ1WwTIh4C8+RmfWsJ+esM2PhLF8Ez2
SV+qOXaCKhwfkTvgv2vKhtOn5/1wwpr3mc8JyvjaXJ3ZJwgG6Qvw33oQ90tENDPC
GNVmLOy3zb2RDdPaAESjes9H1TJKkdvWWU9agEhRNzJ8m4SQ3O3nj0LEVLldYgF0
Lm+UxxFKZM8dbrqrZwjl/FS54kH8gleub1i2lpYmQ6W1bqn357COTulQuotPL1GR
fbLKxgK2YGkST80lBrGTtEKdTLtFqvoQKupGVPyIJroyO/pCa5lL5DRjUmt8sGcF
4tBM7io5GvtRbfZlN2imsxXu3q2di8958HePEugQs/tNCmDfJFBOA03gIlB80JGk
IEq35/aOAxKTqy/H35HC
=4rHa
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
