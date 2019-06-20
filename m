From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
Date: Thu, 20 Jun 2019 09:15:51 -0600
Message-ID: <CAL_JsqJYWW3TPhWy0=tGc_x99w3jZPsSxcKzQJWuE+FrS19t2g@mail.gmail.com>
References: <20190619215156.27795-1-robh@kernel.org> <20190620065508.GA24739@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620065508.GA24739@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 12:55 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> Thanks for starting the conversion of panel bindings to yaml.
>
> On Wed, Jun 19, 2019 at 03:51:53PM -0600, Rob Herring wrote:
> > Convert the common panel bindings to DT schema consolidating scattered
> > definitions to a single schema file.
> >
> > The 'simple-panel' binding just a collection of properties and not a
> > complete binding itself. All of the 'simple-panel' properties are
> > covered by the panel-common.txt binding with the exception of the
> > 'no-hpd' property, so add that to the schema.
> >
> > As there are lots of references to simple-panel.txt, just keep the file
> > with a reference to panel-common.yaml for now until all the bindings are
> > converted.
> Good idea.
>
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Note there's still some references to panel-common.txt that I need to
> > update or just go ahead and convert to schema.
> Better let it point to the .yaml variant, so this patchset does not
> depend on too much other bindings to be converted.

There's only 8 files referencing panel-common.txt which was why I was
debating just converting all of them.

> Then we can start the conversion of the remaining panel bindings.
> Any tooling that helps the conversions?

I have a doc2yaml script that helps with some of the boilerplate. It's
in my yaml-bindings-v2 branch[1].

> When this hits upstream I assume all future panel bindings shall be yaml
> based - so we have a few pending contributions that need to do something.

That would be ideal, but not strictly required. For pending things, no
reason to make folks redo things. Requiring schema really depends on
whomever is applying things to run at least 'make dt_binding_check'
before accepting.

>
> For the actual conversion below:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=yaml-bindings-v2
