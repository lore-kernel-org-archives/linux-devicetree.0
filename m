From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH] of: do not leak console options
Date: Wed, 6 Sep 2017 22:29:23 +0900
Message-ID: <20170906132923.GA805@jagdpanzerIV.localdomain>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
 <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
 <20170827071910.GA581@tigerII.localdomain>
 <20170906124033.GB3143@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170906124033.GB3143@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@secretlab.ca>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

Hello,

On (09/06/17 14:40), Petr Mladek wrote:
[..]
> > I wouldn't know :) let's find that out
> > 
> > the patch used to pass `of_stdout_options' in v1 and v2
> > https://patches.linaro.org/patch/41559/
> > 
> > starting from v3 options are kstrdup-ed
> > https://patchwork.kernel.org/patch/5398761/
> 
> I was curious. The const char * was suggested by Grant Likely,
> see https://lkml.kernel.org/r/CACxGe6tQ5rWzCUcS+_fFY+rjEyua2khApAoCVKpTuJAghU=N_w@mail.gmail.com
> I guess that the reason was to make the of_find_node_by_path()
> API clean.

ok, thanks.

> > > AFAICT, the only reason is options within the console/printk code is a 
> > > char * and not a const char *. I can't imagine that options need 
> > > modifications?
> > 
> > as far as I can tell, ->match callback has side efects, sometimes.
> 
> I hope that the match() callbacks does not have this kind of side
> effects. I think that they initialize some stuff, assign some values.
> But I hope that they do not modify given strings, like console
> name or options. At leats I am unable to find any place.
> But I am not 100% sure.

yeah, seems like we can pass just char *options.

const-ifying options (and brl options) on the printk side would probably
be a better solution. need to check if we can do that, tho. that also
would require touching printk API, struct console, struct console_cmdline,
->match callbacks of every console in the kernel, etc. not like a big deal,
just potentially a bit of a noisy patch.


Rob, Grant,
will this dirty hack work for you? I can respin the patch.

---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 260d33c0f26c..e6839045c454 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1781,8 +1781,8 @@ bool of_console_check(struct device_node *dn, char *name, int index)
 {
 	if (!dn || dn != of_stdout || console_set_on_cmdline)
 		return false;
-	return !add_preferred_console(name, index,
-				      kstrdup(of_stdout_options, GFP_KERNEL));
+
+	return !add_preferred_console(name, index, (char *)of_stdout_options);
 }
 EXPORT_SYMBOL_GPL(of_console_check);
 
-- 
2.14.1
