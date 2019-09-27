From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V3 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Fri, 27 Sep 2019 14:02:35 -0500
Message-ID: <CAHCN7x+V_-PZjhC_1K1kU+fnQYwWM4br1PTPEBd4Kks=sR5K7g@mail.gmail.com>
References: <20190925184239.22330-1-aford173@gmail.com> <20190925184239.22330-2-aford173@gmail.com>
 <20190927185153.GA982@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927185153.GA982@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Adam Ford <adam.ford@logicpd.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 1:51 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 25, 2019 at 01:42:37PM -0500, Adam Ford wrote:
> > This patch adds documentation of device tree bindings for the WVGA panel
> > Logic PD Type 28 display.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V3:  Correct build errors from 'make dt_binding_check'
> > V2:  Use YAML instead of TXT for binding
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > new file mode 100644
> > index 000000000000..74ba650ea7a0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > @@ -0,0 +1,31 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR X11)
>
> (GPL-2.0-only OR BSD-2-Clause) please.
>
> X11 is pretty much never right unless this is copyright X Consortium.
>

I copied the example from
Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml

Is there a better example I can use?  If what I did is wrong, then it
seems like that board is wrong too.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Adam Ford <aford173@gmail.com>
> > +
>
> You need:
>
> allOf:
>   - $ref: panel-common.yaml#
>
> > +properties:
> > +  compatible:
> > +    const: logicpd,type28
> > +
>
> > +  power-supply:
> > +    description: Regulator to provide the supply voltage
> > +    maxItems: 1
> > +
> > +  enable-gpios:
> > +    description: GPIO pin to enable or disable the panel
> > +    maxItems: 1
> > +
> > +  backlight:
> > +    description: Backlight used by the panel
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
>
> These 3 are all defined in the common schema, so you just need 'true'
> for the value to indicate they apply to this panel and to make
> 'additionalProperties: false' happy.

Sorry for my ignorance, but I am not familiar with the syntax here,
nor do I understand what is required.  Since there aren't many display
panels with yaml docs, I don't know what is expected and clearly the
one I used as a template didn't do it right either.

Is there a branch  where this stuff is located? I am just using the
latest linux-stable branch.

>
> > +
> > +required:
> > +  - compatible
>
> Are the rest really optional?

>From what I can tell, they are optional.  I am just adding some timing
info to an already existing driver.  It's not my driver.


>
> > +
> > +additionalProperties: false
> > --
> > 2.17.1
> >
