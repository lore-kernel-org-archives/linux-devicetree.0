From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Empty node & property flag accessors when !OF
Date: Fri, 20 Mar 2015 12:12:23 +0000
Message-ID: <20150320121223.16D69C4076B@trevor.secretlab.ca>
References: <1421859957-24457-1-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqKxtJH=JyruyuMLXSFfTLdswOLa=AfGEbROsSSOhLLDkg@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKxtJH=JyruyuMLXSFfTLdswOLa=AfGEbROsSSOhLLDkg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jan 2015 17:13:51 -0600
, Rob Herring <robherring2@gmail.com>
 wrote:
> +Wolfram
> 
> On Wed, Jan 21, 2015 at 11:05 AM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
> > Introduce empty node and property flag accessors when CONFIG_OF is not
> > defined.
> > This allows us to use them without ifdef'ing them in places where it
> > makes sense to do so.
> >
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> I've asked Wolfram to apply. While not a fix itself, this is needed
> for an I2C related fix for 3.19.

I don't see this in mainline or linux-next, so I've applied to my tree.
Thanks.

g.

> 
> Rob
> 
> > ---
> >  include/linux/of.h | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index dfde07e..7ede449 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -616,6 +616,38 @@ static inline const char *of_prop_next_string(struct property *prop,
> >         return NULL;
> >  }
> >
> > +static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
> > +{
> > +       return 0;
> > +}
> > +
> > +static inline int of_node_test_and_set_flag(struct device_node *n,
> > +                                           unsigned long flag)
> > +{
> > +       return 0;
> > +}
> > +
> > +static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
> > +{
> > +}
> > +
> > +static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
> > +{
> > +}
> > +
> > +static inline int of_property_check_flag(struct property *p, unsigned long flag)
> > +{
> > +       return 0;
> > +}
> > +
> > +static inline void of_property_set_flag(struct property *p, unsigned long flag)
> > +{
> > +}
> > +
> > +static inline void of_property_clear_flag(struct property *p, unsigned long flag)
> > +{
> > +}
> > +
> >  #define of_match_ptr(_ptr)     NULL
> >  #define of_match_node(_matches, _node) NULL
> >  #endif /* CONFIG_OF */
> > --
> > 1.7.12
> >
