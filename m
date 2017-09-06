From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] of: do not leak console options
Date: Wed, 6 Sep 2017 14:40:33 +0200
Message-ID: <20170906124033.GB3143@pathway.suse.cz>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
 <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
 <20170827071910.GA581@tigerII.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170827071910.GA581@tigerII.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Sun 2017-08-27 16:19:10, Sergey Senozhatsky wrote:
> Hello,
> 
> (Cc Andrew, Grant)
> 
> On (08/25/17 17:37), Rob Herring wrote:
> > On Sat, Aug 26, 2017 at 02:36:47AM +0900, Sergey Senozhatsky wrote:
> > > If add_preferred_console() returns error then we must free a
> > > copy of `of_stdout_options' that we create right before the
> > > console registration.
> > > 
> > > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > > ---
> > >  drivers/of/base.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > > index 260d33c0f26c..9fcf7011d206 100644
> > > --- a/drivers/of/base.c
> > > +++ b/drivers/of/base.c
> > > @@ -1779,10 +1779,17 @@ EXPORT_SYMBOL_GPL(of_alias_get_highest_id);
> > >   */
> > >  bool of_console_check(struct device_node *dn, char *name, int index)
> > >  {
> > > +	bool ret;
> > > +	char *options;
> > > +
> > >  	if (!dn || dn != of_stdout || console_set_on_cmdline)
> > >  		return false;
> > > -	return !add_preferred_console(name, index,
> > > -				      kstrdup(of_stdout_options, GFP_KERNEL));
> > > +
> > > +	options = kstrdup(of_stdout_options, GFP_KERNEL);
> > 
> > The real question is why are we doing the kstrdup in the first place. 
> 
> I wouldn't know :) let's find that out
> 
> the patch used to pass `of_stdout_options' in v1 and v2
> https://patches.linaro.org/patch/41559/
> 
> starting from v3 options are kstrdup-ed
> https://patchwork.kernel.org/patch/5398761/

I was curious. The const char * was suggested by Grant Likely,
see https://lkml.kernel.org/r/CACxGe6tQ5rWzCUcS+_fFY+rjEyua2khApAoCVKpTuJAghU=N_w@mail.gmail.com
I guess that the reason was to make the of_find_node_by_path()
API clean.

> > AFAICT, the only reason is options within the console/printk code is a 
> > char * and not a const char *. I can't imagine that options need 
> > modifications?
> 
> as far as I can tell, ->match callback has side efects, sometimes.

I hope that the match() callbacks does not have this kind of side
effects. I think that they initialize some stuff, assign some values.
But I hope that they do not modify given strings, like console
name or options. At leats I am unable to find any place.
But I am not 100% sure.

Sigh, the console code really needs clean up.

Best Regards,
Petr
