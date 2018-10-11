From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] dt-bindings: Add bindings for aliases node
Date: Thu, 11 Oct 2018 16:50:15 -0700
Message-ID: <20181011235015.GO22824@google.com>
References: <20180925210255.172734-1-mka@chromium.org>
 <153906464468.119890.12038987094612660933@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153906464468.119890.12038987094612660933@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 10:57:24PM -0700, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2018-09-25 14:02:55)
> > Add a global binding for the 'aliases' node. This includes an initial list
> > of standardized alias names for some hardware components that are commonly
> > found in 'aliases'.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/aliases.txt | 47 +++++++++++++++++++
> 
> Any chance we can get a documentation update for the devicetree spec as
> well?

I'm not involved in the DT spec process, but I'd certainly welcome an
update ;-)

> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/aliases.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/aliases.txt b/Documentation/devicetree/bindings/aliases.txt
> > new file mode 100644
> > index 000000000000..d64ed1c7eb34
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/aliases.txt
> > @@ -0,0 +1,47 @@
> > +The aliases node
> > +----------------
> > +
> > +The aliases node contains properties that represent aliases to device tree
> > +nodes. The name of the property is the alias name, the value is the path of
> > +a the device tree node that corresponds to the alias. The path may be
> 
> s/a //

ack

> > +specified as a string or a phandle.
> > +
> > +Alias names are often suffixed with a numeric ID, especially when there may
> > +be multiple instances of the same type. The ID typically corresponds to the
> > +hardware layout, it may also be used by drivers for a stable mapping of
> > +device names and hardware entities.
> 
> Indicate the numeric ID is a u32 or something like that?

ok

> > +
> > +Alias names
> > +-----------
> > +
> > +The devicetree specification doesn't require the use of specific alias
> > +names to refer to hardware entities of a given type, however the Linux
> > +kernel aims for a certain level of consistency.
> > +
> > +The following standardized alias names shall be used for their
> > +corresponding hardware components:
> > +
> > +  bluetoothN           Bluetooth controller
> 
> Can we use syntax like:
> 
> 	bluetooth<N>
> 
> to indicate that <N> is an unsigned integer?

sounds good

Thanks for the review!

Matthias
