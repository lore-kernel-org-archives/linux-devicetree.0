From: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Wed, 14 Nov 2018 14:39:29 -0500
Message-ID: <CAKON4OxwAmmPv2+CEtT+eO3Uu8duCKD8OqyWj8+w2Y5SZ4bfOQ@mail.gmail.com>
References: <20180418222905.10414-1-robh@kernel.org> <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, grant.likely@arm.com, Mark Rutland <mark.rutland@arm.com>, geert+renesas@glider.be, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, shawnguo@kernel.org, bjorn.andersson@linaro.org, Arnd Bergmann <arnd@arndb.de>, sboyd@kernel.org, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 20, 2018 at 9:36 PM Rob Herring <robh@kernel.org> wrote:
> I share the concern as I doubt most kernel developers don't know
> jsonschema. But then the alternative is us defining and writing our
> own thing which is C like 'cause that's what kernel developers
> understand. My hope is to simplify and restrict things enough that it
> writing a binding doc is straightforward without being jsonschema
> experts. That was the intent of this patch without going into all the
> details behind it.

When schemas were first discussed long, long ago the idea was to have
a n arbitrator who controls the schema (like Grant/Rob) so there is no
need for general schema design knowledge in random kernel developers.

First a developer should try and build their device tree using the
existing schema. Then only if they find that impossible to do so
should they propose schema changes. The schema arbitrator would then
look at those changes and work them into the existing schemas as
needed. Doing this via an arbitrator will ensure consistency in the
overall schema design while eliminating redundancy with slight
variations (like we have now).

Another side effect of schemas is that as they evolve and enforce
commonality among driver implementation it will become possible to
turn those in-common pieces into driver libraries.

-- 
Jon Smirl
jonsmirl@gmail.com
