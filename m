From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH] of: do not leak console options
Date: Sun, 27 Aug 2017 16:19:10 +0900
Message-ID: <20170827071910.GA581@tigerII.localdomain>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
 <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Hello,

(Cc Andrew, Grant)

On (08/25/17 17:37), Rob Herring wrote:
> On Sat, Aug 26, 2017 at 02:36:47AM +0900, Sergey Senozhatsky wrote:
> > If add_preferred_console() returns error then we must free a
> > copy of `of_stdout_options' that we create right before the
> > console registration.
> > 
> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > ---
> >  drivers/of/base.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 260d33c0f26c..9fcf7011d206 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1779,10 +1779,17 @@ EXPORT_SYMBOL_GPL(of_alias_get_highest_id);
> >   */
> >  bool of_console_check(struct device_node *dn, char *name, int index)
> >  {
> > +	bool ret;
> > +	char *options;
> > +
> >  	if (!dn || dn != of_stdout || console_set_on_cmdline)
> >  		return false;
> > -	return !add_preferred_console(name, index,
> > -				      kstrdup(of_stdout_options, GFP_KERNEL));
> > +
> > +	options = kstrdup(of_stdout_options, GFP_KERNEL);
> 
> The real question is why are we doing the kstrdup in the first place. 

I wouldn't know :) let's find that out

the patch used to pass `of_stdout_options' in v1 and v2
https://patches.linaro.org/patch/41559/

starting from v3 options are kstrdup-ed
https://patchwork.kernel.org/patch/5398761/

> AFAICT, the only reason is options within the console/printk code is a 
> char * and not a const char *. I can't imagine that options need 
> modifications?

as far as I can tell, ->match callback has side efects, sometimes.

for example,

register_console()
	newcon->match(newcon, c->name, c->index, c->options)

for amba-pl011.c ends up in pl011_console_match(), which calls

	uart_parse_earlycon(options, &iotype, &addr, &options)

and uart_parse_earlycon() does the following

int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr,
			char **options)
{
	if (strncmp(p, "mmio,", 5) == 0) {
		*iotype = UPIO_MEM;
		p += 5;
	} else if (strncmp(p, "mmio16,", 7) == 0) {
		*iotype = UPIO_MEM16;
		p += 7;
	} else if (strncmp(p, "mmio32,", 7) == 0) {
		*iotype = UPIO_MEM32;
		p += 7;
	} else if (strncmp(p, "mmio32be,", 9) == 0) {
		*iotype = UPIO_MEM32BE;
		p += 9;
	} else if (strncmp(p, "mmio32native,", 13) == 0) {
		*iotype = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) ?
			UPIO_MEM32BE : UPIO_MEM32;
		p += 13;
	} else if (strncmp(p, "io,", 3) == 0) {
		*iotype = UPIO_PORT;
		p += 3;
	} else if (strncmp(p, "0x", 2) == 0) {
		*iotype = UPIO_MEM;
	} else {
		return -EINVAL;
	}

	/*
	 * Before you replace it with kstrtoull(), think about options separator
	 * (',') it will not tolerate
	 */
	*addr = simple_strtoull(p, NULL, 0);
	p = strchr(p, ',');
	if (p)
		p++;

	*options = p;
	return 0;
}

that's just one example I found after a very quick grepping. may be
there are other control paths that can change ->options.
wondering if something like this was the reason for kstrdup().

	-ss
