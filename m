MIME-Version: 1.0
Date: Fri, 18 Jan 2019 11:57:12 -0600
References: <20190116145909.7x6n47a35xsjknj2@flea>
	<CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
	<20190117143510.3vmmxh2vc6mlp5i4@flea>
In-Reply-To: <20190117143510.3vmmxh2vc6mlp5i4@flea>
Message-ID: <CAL_JsqJ43C8Y+QLZkeCg6bWzppLKzpyNxQa9BxfjyKyfBb90Sw@mail.gmail.com>
Subject: Re: JSON schema and conditions
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 17, 2019 at 12:39 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> Thanks for you answer :)
>
> On Wed, Jan 16, 2019 at 02:50:09PM -0600, Rob Herring wrote:
> > On Wed, Jan 16, 2019 at 1:18 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > I've started playing a bit with the schemas, and one thing I cannot
> > > wrap my head around at the moment is how to express things like one
> > > property being required only by one compatible over a couple expressed
> > > in the binding document.
> > >
> > > Things like a reset property only being required for one particular SoC
> > > for example.
> > >
> > > Looking at the current examples, I could see two solutions, one where
> > > we could condition a dependency on a propery value, and the other
> > > where we could inherit another schema and just add more constraints.
> > >
> > > I haven't found a way to find either though. Is it covered currently?
> >
> > There's not really a concise way of saying 'if compatible is X, then
> > apply these constraints else these other constraints'. The only way
> > I've figured out how to do it is with a whole other section in the
> > schema:
> >
> > oneOf:
> >   - properties:
> >       compatible:
> >         contains:
> >           enum: [ a-compatible-to-match ]
> >       resets: true
> >     required:
> >       - resets
> >       - compatible
> >
> > This would be in addition to the main schema. I think this would
> > become bloated and hard to read/maintain, so I don't think we should
> > go with this approach.
>
> Yeah, I'm with you on that one. Speaking of which, I've seen that
> resets: true on a number of your patches, without getting exactly what
> it's supposed to mean. Is that because you want to use the schemas
> already defined for these?

Not so that that it gets used, but rather so the property can be
marked required and allowed (if additionalProperties is false). 'true'
or '{}' is used if we don't have any further constaints (or the
constraints are conditional).

> > I'm hoping this gets addressed in the json-schema spec as there's
> > some discussion of a '$data' keyword and data dependent schemas.
>
> Ok
>
> > Including/inheriting another schema can be done with "allOf: [ {$ref:
> > path/to/base/schema} ]". I'm currently using this for providers such
> > as clock or reset providers and for buses. This works well for
> > inheriting schemas which are collections of properties. See the GIC
> > conversions to json-schema I posted for an example. The main issue
> > with this approach that I've found is you have to list all the
> > inherited properties to make them required or if you have
> > 'addtionalProperties: false' (which is desirable IMO).
> >
> > If there's a lot of conditionals, there may not be much left common to
> > inherit and we may just want to split each compatible into a separate
> > doc. I'm also fine with leaving those constraints as comments or
> > description for now. That's no worse than what we have today.
> >
> > Note that so far, all the $ref values pointing to other files get
> > resolved to files in the yaml-bindings repo schemas. I don't think a
> > ref from the kernel tree to the kernel tree works currently. I need to
> > sort that out.
>
> Yeah, I've tried that already, and it indeed looks like it always try
> to look them up on your github repo (or the local cache), but will not
> try to locate it in the kernel tree.

Actually, this should already kind of work, but only if all schema
files are used. IOW, it doesn't work if you limit the schema files
setting DT_SCHEMA_FILES. A reference to '/schemas/foo/bar.yaml' will
match 'Documentation/devicetree/bindings/foo/bar.yaml'.

I looked at trying to fix this, but at the point I need to load the
reference I don't have the kernel source path, only the build path.
The easiest fix would be to ignore (or only warn on) unresolved
schemas, so we don't crash at least. Then you'd have to set
DT_SCHEMA_FILES to the inherited schema if you wanted to validate with
that.

Rob
