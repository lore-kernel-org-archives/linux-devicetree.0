From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: Add device_type access helper functions
Date: Wed, 5 Sep 2018 08:17:03 -0500
Message-ID: <CAL_JsqJn5ksPsRzs=zYMwPv+WkNtjuAcvycOKJtvFP1BCxF7+A@mail.gmail.com>
References: <20180830185229.20393-1-robh@kernel.org> <4253073f-5ddf-a01c-4d3e-5c6a13068903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4253073f-5ddf-a01c-4d3e-5c6a13068903@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 10:55 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 08/30/18 11:52, Rob Herring wrote:
> > In preparation to remove direct access to device_node.type, add
> > of_node_is_type() and of_node_get_device_type() helpers to check and
> > retrieve the device type.
> >
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  include/linux/of.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index a40f63a36afa..506beca9588d 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -980,6 +980,18 @@ static inline struct device_node *of_find_matching_node(
> >       return of_find_matching_node_and_match(from, matches, NULL);
> >  }
> >
> > +static inline const char *of_node_get_device_type(const struct device_node *np)
> > +{
> > +     return of_get_property(np, "type", NULL);
>
> I'm a little confused.  The patch comment says "remove direct access to device_node.type.
> device_node.type is set to the value of the property "device_type" in populate_node(),
> but of_node_get_device_type() is looking for property "type".

Crap. That should be device_type.

>
> > +}> +
> > +static inline bool of_node_is_type(const struct device_node *np, const char *type)
> > +{
> > +     const char *match = of_node_get_device_type(np);
> > +
> > +     return np && match && type && !of_prop_cmp(match, type);
> > +}
> > +
> >  /**
> >   * of_property_count_u8_elems - Count the number of u8 elements in a property
> >   *
> >
>
> I'd like to see one or two examples of how you plan to use of_node_get_device_type()
> (outside of of_node_is_type()) and examples of planned use of of_node_is_type() so
> I can better understand anticipated usage.  Complete, clean patches not needed for
> the examples, just enough text for me to see the resulting code change where the
> helpers are used.

See my dt/testing branch. Most cases are of_node_is_type which
replaces strcmp's of node->type. I'll be sending out the patches soon.

Rob
