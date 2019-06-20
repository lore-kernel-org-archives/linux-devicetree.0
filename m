From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
Date: Thu, 20 Jun 2019 16:01:19 -0600
Message-ID: <CAL_Jsq+LME4N4aoUsw946hBGO4y8Q8yBVa2coeSZMr1Ns_XrSg@mail.gmail.com>
References: <20190619215156.27795-1-robh@kernel.org> <20190620090122.GB26689@ulmo>
 <CAL_JsqKC-RDjdMQWM6yk_HiWu-WwuU+vUf946t=TDJAxnqMW7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKC-RDjdMQWM6yk_HiWu-WwuU+vUf946t=TDJAxnqMW7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 8:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jun 20, 2019 at 3:01 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Wed, Jun 19, 2019 at 03:51:53PM -0600, Rob Herring wrote:
> > > Convert the common panel bindings to DT schema consolidating scattered
> > > definitions to a single schema file.
> > >
> > > The 'simple-panel' binding just a collection of properties and not a
> > > complete binding itself. All of the 'simple-panel' properties are
> > > covered by the panel-common.txt binding with the exception of the
> > > 'no-hpd' property, so add that to the schema.
> > >
> > > As there are lots of references to simple-panel.txt, just keep the file
> > > with a reference to panel-common.yaml for now until all the bindings are
> > > converted.
> > >
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Note there's still some references to panel-common.txt that I need to
> > > update or just go ahead and convert to schema.
> > >
> > >  .../bindings/display/panel/panel-common.txt   | 101 -------------
> > >  .../bindings/display/panel/panel-common.yaml  | 143 ++++++++++++++++++
> > >  .../bindings/display/panel/panel.txt          |   4 -
> > >  .../bindings/display/panel/simple-panel.txt   |  29 +---
> > >  4 files changed, 144 insertions(+), 133 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.yaml
> >
> > I know it was this way before, but perhaps remove the redundant panel-
> > prefix while at it?
>
> Sure.

On 2nd thought, I prefer it as-is. The reason being the schema
including this file are more readable with:

allOf:
  - $ref: panel-common.yaml#

Compared to one of:

$ref: common.yaml#
$ref: /schemas/display/panel/common.yaml#

I suppose we could automagically include a 'common.yaml' file if
existing in the same directory. That's a bigger change though...

Rob
