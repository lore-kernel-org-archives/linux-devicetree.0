From: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Thu, 15 Nov 2018 20:34:32 -0500
Message-ID: <CAKON4OwdwVUtX+ZvXUCs-RLo0V=KKKNKzrtRM5GxejaQEL+NRA@mail.gmail.com>
References: <20180418222905.10414-1-robh@kernel.org> <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
 <CAKON4OxwAmmPv2+CEtT+eO3Uu8duCKD8OqyWj8+w2Y5SZ4bfOQ@mail.gmail.com> <CAL_JsqJd7F7=yyW5X0P4W0N+0UDA8MLPDGvbBBK+VqMKqajC7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJd7F7=yyW5X0P4W0N+0UDA8MLPDGvbBBK+VqMKqajC7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, grant.likely@arm.com, Mark Rutland <mark.rutland@arm.com>, geert+renesas@glider.be, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, shawnguo@kernel.org, bjorn.andersson@linaro.org, Arnd Bergmann <arnd@arndb.de>, sboyd@kernel.org, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 6:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 14, 2018 at 1:39 PM jonsmirl@gmail.com <jonsmirl@gmail.com> wrote:
> >
> > On Fri, Apr 20, 2018 at 9:36 PM Rob Herring <robh@kernel.org> wrote:
> > > I share the concern as I doubt most kernel developers don't know
> > > jsonschema. But then the alternative is us defining and writing our
> > > own thing which is C like 'cause that's what kernel developers
> > > understand. My hope is to simplify and restrict things enough that it
> > > writing a binding doc is straightforward without being jsonschema
> > > experts. That was the intent of this patch without going into all the
> > > details behind it.
> >
> > When schemas were first discussed long, long ago the idea was to have
> > a n arbitrator who controls the schema (like Grant/Rob) so there is no
> > need for general schema design knowledge in random kernel developers.
> >
> > First a developer should try and build their device tree using the
> > existing schema. Then only if they find that impossible to do so
> > should they propose schema changes. The schema arbitrator would then
> > look at those changes and work them into the existing schemas as
> > needed. Doing this via an arbitrator will ensure consistency in the
> > overall schema design while eliminating redundancy with slight
> > variations (like we have now).
> >
> > Another side effect of schemas is that as they evolve and enforce
> > commonality among driver implementation it will become possible to
> > turn those in-common pieces into driver libraries.
>
> If we replace 'schemas' everywhere above with 'bindings', then this
> pretty much describes the status quo today. Most device specific
> bindings are a collection of standard bindings. Occasionally, we have
> new common bindings. All the bindings get reviewed by me. The only
> real change here is submitters have to have some level of
> understanding of json-schema instead of just English (for writing free
> form text). I think it will continue to largely be following existing
> examples of other bindings.

What used to happen is that drivers would be written out of tree
without review of their bindings until mainline submission (if they
submit them at all).  With schema a driver writer who is working out
of tree can use the schema to validate their new device tree entries
before submitting them. That way they will know ahead of time if they
are making up something non-standard. It will also give them the heads
up that they can't just make up anything they want in the device tree
and that they are going to have to defend their design when asking for
the schema to be changed to support it. An example of where schema
would have been initially valuable is in the i2c bindings which
contain significant variation but the function is the same.

Maybe we are thinking about schema differently. I had envisioned
starting from a base generic schema that is capable of validating all
possible legal Linux device trees. This schema is more strict that
YAML syntax, but it obviously can't validate in detail.  Someone
working out of tree would always be able to validate against this
schema.

As this generic schema validates the device tree it will discover that
it can utilize more strict schema fragments. So by providing these
fragments you can validate to any desired level of conformance. The
end of that process is the json-schema bindings file. But if those
fragments are missing you can still validate, just not at a detailed
level.

A large set of schemas that work like this are used in ONVIF (security
cameras). A flavor of SOAP.
https://www.onvif.org/profiles/specifications/
These schemas are using XML stylesheets to make them pretty, use view
source to see the actual schemas.

The ONVIF schemas define points where vendors are allowed to insert
arbitrary items (ANY elements) and then they will use a vendor
supplied schema to validate the fragment if one is available. If not
the generic schema is used to validate the basic structure of the
vendor fragments.

>
> Rob



-- 
Jon Smirl
jonsmirl@gmail.com
