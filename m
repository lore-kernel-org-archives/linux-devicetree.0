MIME-Version: 1.0
Date: Wed, 16 Jan 2019 14:50:09 -0600
References: <20190116145909.7x6n47a35xsjknj2@flea>
In-Reply-To: <20190116145909.7x6n47a35xsjknj2@flea>
Message-ID: <CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
Subject: Re: JSON schema and conditions
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 16, 2019 at 1:18 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> I've started playing a bit with the schemas, and one thing I cannot
> wrap my head around at the moment is how to express things like one
> property being required only by one compatible over a couple expressed
> in the binding document.
>
> Things like a reset property only being required for one particular SoC
> for example.
>
> Looking at the current examples, I could see two solutions, one where
> we could condition a dependency on a propery value, and the other
> where we could inherit another schema and just add more constraints.
>
> I haven't found a way to find either though. Is it covered currently?

There's not really a concise way of saying 'if compatible is X, then
apply these constraints else these other constraints'. The only way
I've figured out how to do it is with a whole other section in the
schema:

oneOf:
  - properties:
      compatible:
        contains:
          enum: [ a-compatible-to-match ]
      resets: true
    required:
      - resets
      - compatible

This would be in addition to the main schema. I think this would
become bloated and hard to read/maintain, so I don't think we should
go with this approach. I'm hoping this gets addressed in the
json-schema spec as there's some discussion of a '$data' keyword and
data dependent schemas.

Including/inheriting another schema can be done with "allOf: [ {$ref:
path/to/base/schema} ]". I'm currently using this for providers such
as clock or reset providers and for buses. This works well for
inheriting schemas which are collections of properties. See the GIC
conversions to json-schema I posted for an example. The main issue
with this approach that I've found is you have to list all the
inherited properties to make them required or if you have
'addtionalProperties: false' (which is desirable IMO).

If there's a lot of conditionals, there may not be much left common to
inherit and we may just want to split each compatible into a separate
doc. I'm also fine with leaving those constraints as comments or
description for now. That's no worse than what we have today.

Note that so far, all the $ref values pointing to other files get
resolved to files in the yaml-bindings repo schemas. I don't think a
ref from the kernel tree to the kernel tree works currently. I need to
sort that out.

Rob
