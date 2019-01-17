Return-Path: <SRS0=X0H9=PZ=bootlin.com=maxime.ripard@kernel.org>
Date: Thu, 17 Jan 2019 15:35:10 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: JSON schema and conditions
Message-ID: <20190117143510.3vmmxh2vc6mlp5i4@flea>
References: <20190116145909.7x6n47a35xsjknj2@flea>
 <CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for you answer :)

On Wed, Jan 16, 2019 at 02:50:09PM -0600, Rob Herring wrote:
> On Wed, Jan 16, 2019 at 1:18 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> >
> > Hi,
> >
> > I've started playing a bit with the schemas, and one thing I cannot
> > wrap my head around at the moment is how to express things like one
> > property being required only by one compatible over a couple expressed
> > in the binding document.
> >
> > Things like a reset property only being required for one particular SoC
> > for example.
> >
> > Looking at the current examples, I could see two solutions, one where
> > we could condition a dependency on a propery value, and the other
> > where we could inherit another schema and just add more constraints.
> >
> > I haven't found a way to find either though. Is it covered currently?
>=20
> There's not really a concise way of saying 'if compatible is X, then
> apply these constraints else these other constraints'. The only way
> I've figured out how to do it is with a whole other section in the
> schema:
>=20
> oneOf:
>   - properties:
>       compatible:
>         contains:
>           enum: [ a-compatible-to-match ]
>       resets: true
>     required:
>       - resets
>       - compatible
>=20
> This would be in addition to the main schema. I think this would
> become bloated and hard to read/maintain, so I don't think we should
> go with this approach.

Yeah, I'm with you on that one. Speaking of which, I've seen that
resets: true on a number of your patches, without getting exactly what
it's supposed to mean. Is that because you want to use the schemas
already defined for these?

> I'm hoping this gets addressed in the json-schema spec as there's
> some discussion of a '$data' keyword and data dependent schemas.

Ok

> Including/inheriting another schema can be done with "allOf: [ {$ref:
> path/to/base/schema} ]". I'm currently using this for providers such
> as clock or reset providers and for buses. This works well for
> inheriting schemas which are collections of properties. See the GIC
> conversions to json-schema I posted for an example. The main issue
> with this approach that I've found is you have to list all the
> inherited properties to make them required or if you have
> 'addtionalProperties: false' (which is desirable IMO).
>=20
> If there's a lot of conditionals, there may not be much left common to
> inherit and we may just want to split each compatible into a separate
> doc. I'm also fine with leaving those constraints as comments or
> description for now. That's no worse than what we have today.
>=20
> Note that so far, all the $ref values pointing to other files get
> resolved to files in the yaml-bindings repo schemas. I don't think a
> ref from the kernel tree to the kernel tree works currently. I need to
> sort that out.

Yeah, I've tried that already, and it indeed looks like it always try
to look them up on your github repo (or the local cache), but will not
try to locate it in the kernel tree.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
