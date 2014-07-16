Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/5] of: Introduce tree change __foo_post methods.
In-Reply-To: <179F42A4-1312-467B-9185-544E5189FEA5@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-5-git-send-email-pantelis.antoniou@konsulko.com>
	<20140710005552.E74F0C41B68@trevor.secretlab.ca>
	<179F42A4-1312-467B-9185-544E5189FEA5@konsulko.com>
Date: Wed, 16 Jul 2014 07:20:46 -0600
Message-Id: <20140716132046.22023C40FC8@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, 11 Jul 2014 23:04:55 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Hi Grant,
> 
> On Jul 10, 2014, at 3:55 AM, Grant Likely wrote:
> 
> > On Fri,  4 Jul 2014 19:58:48 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >> diff --git a/drivers/of/base.c b/drivers/of/base.c
> >> index 0d50318..b52fd6b 100644
> >> --- a/drivers/of/base.c
> >> +++ b/drivers/of/base.c
> >> @@ -127,13 +127,24 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
> >> 	return name;
> >> }
> >> 
> >> -static int __of_add_property_sysfs(struct device_node *np, struct property *pp)
> >> +static int __of_add_property_sysfs(struct device_node *np, struct property *pp,
> >> +		int ignore_dup_name)
> >> {
> >> 	int rc;
> >> 
> >> 	/* Important: Don't leak passwords */
> >> 	bool secure = strncmp(pp->name, "security-", 9) == 0;
> >> 
> >> +	/* ignore duplicate name (transaction case) */
> >> +	if (ignore_dup_name) {
> >> +		struct kernfs_node *kn = sysfs_get_dirent(np->kobj.sd,
> >> +				pp->name);
> >> +		if (kn) {
> >> +			sysfs_put(kn);
> >> +			return 0;
> >> +		}
> >> +	}
> >> +
> > 
> > What is this? There is no mention of it in the commit text, and the comment
> > is far from sufficient. Under what conditions would this be valid? I'm
> > particularly concerned because this changes behaviour and the new
> > behaviour is used in the next hunk, so clearly it's not
> > transaction-only?
> > 
> > I've dropped this hunk from the version I have in my tree.
> > 
> 
> You need it. When you attach a new node to the tree, and then add a new
> property to the same node, you end up calling __of_add_property_sysfs twice.
> 
> This is the easiest way to get around the problem.

Ugh. That's nasty. It only papers over the problem and when something
goes wrong it will silently fail. If this is necessary then it says to
me that there is a problem in the design. Either the property should be
modified direcly on the node before the node is attached, or modifying
properties on an added node should be illegal.

> >> +
> >> /**
> >>  * of_attach_node - Plug a device node into the tree and global list.
> >>  */
> >> @@ -120,7 +125,7 @@ int of_attach_node(struct device_node *np)
> >> 	__of_attach_node(np);
> >> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> >> 
> >> -	of_node_add(np);
> >> +	__of_attach_node_post(np);
> >> 	return 0;
> >> }
> >> 
> >> @@ -160,6 +165,11 @@ void __of_detach_node(struct device_node *np)
> >> 	of_node_set_flag(np, OF_DETACHED);
> >> }
> >> 
> >> +void __of_detach_node_post(struct device_node *np)
> >> +{
> >> +	of_node_remove(np);
> >> +}
> > 
> > Also silly.
> > 
> 
> It's regular...

Heh, my point was that of_node_remove() can be renamed.

g.
