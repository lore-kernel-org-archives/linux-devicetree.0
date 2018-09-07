From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] of: Convert to using %pOFn instead of device_node.name
Date: Fri, 7 Sep 2018 09:58:01 -0500
Message-ID: <CAL_JsqKg+Y=BNWEXZY=TR5S8Vi9rpmN8LFpGjLt=qWG3WtUwrg@mail.gmail.com>
References: <20180828155254.10709-1-robh@kernel.org> <20180828155254.10709-4-robh@kernel.org>
 <20180907122928.GA5821@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907122928.GA5821@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 7, 2018 at 7:29 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Aug 28, 2018 at 10:52:53AM -0500, Rob Herring wrote:
> > In preparation to remove the node name pointer from struct device_node,
> > convert printf users to use the %pOFn format specifier.
> >
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/of/device.c   |  4 ++--
> >  drivers/of/of_mdio.c  | 12 ++++++------
> >  drivers/of/of_numa.c  |  4 ++--
> >  drivers/of/overlay.c  |  4 ++--
> >  drivers/of/platform.c |  8 ++++----
> >  drivers/of/unittest.c | 12 ++++++------
> >  6 files changed, 22 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index 5957cd4fa262..daa075d87317 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -219,7 +219,7 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
> >               return -ENODEV;
> >
> >       /* Name & Type */
> > -     csize = snprintf(str, len, "of:N%sT%s", dev->of_node->name,
> > +     csize = snprintf(str, len, "of:N%pOFnT%s", dev->of_node,
> >                        dev->of_node->type);
> >       tsize = csize;
> >       len -= csize;
>
> This seems to cause the modalias to be improperly constructed. As a
> consequence, automatic module loading at boot time is now broken. I
> think the reason why this fails is because vsnprintf() will skip all
> alpha-numeric characters after a call to pointer(). Presumably this
> is meant to be a generic way of skipping whatever specifiers we throw
> at it.
>
> Unfortunately for the case of OF modaliases, this means that the 'T'
> character gets eaten, so we end up with something like this:
>
>         # udevadm info /sys/bus/platform/devices/54200000.dc
>         [...]
>         E: MODALIAS=of:Ndc<NULL>Cnvidia,tegra124-dc
>         [...]
>
> instead of this:
>
>         # udevadm info /sys/bus/platform/devices/54200000.dc
>         [...]
>         E: MODALIAS=of:NdcT<NULL>Cnvidia,tegra124-dc
>         [...]

Oops. Thanks for finding this.

> Everything is back to normal if I revert this patch. However, since
> that's obviously not what we want, I think perhaps what we need is a
> way for pointer() (and its implementations) to report back how many
> characters in the format string it consumed so that we can support
> these kinds of back-to-back strings.

I don't think we can change it because if I have something like
%pOFMoreWords and then later on want to add 'M' as a new modifier we'd
break any existing cases with 'M'. Of course, I could search the tree
for that case and find unused characters, but that seems fragile
(though silently throwing away the characters does too).

> If nobody else has the time I can look into coding up a fix, but in the
> meantime it might be best to back this one out until we can handle the
> OF modalias format string.

There's an easy fix though. Just replace the 'T' with a '%c'.

I found one other case in the clock code and one in soundbus (which I
haven't posted yet).

Rob
