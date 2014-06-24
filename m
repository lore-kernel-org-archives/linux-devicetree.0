Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/6] OF: Export a number of __of_* methods
In-Reply-To: <423B32AE-166F-49EE-BCE8-029116F098FA@konsulko.com>
References: 
	<1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1403430039-15085-5-git-send-email-pantelis.antoniou@konsulko.com>
	<20140624192711.00190C40B7F@trevor.secretlab.ca>
	<423B32AE-166F-49EE-BCE8-029116F098FA@konsulko.com>
Date: Tue, 24 Jun 2014 21:19:19 +0100
Message-Id: <20140624201919.F011EC40D39@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 24 Jun 2014 22:38:25 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> > On Sun, 22 Jun 2014 12:40:37 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >> @@ -382,7 +382,7 @@ EXPORT_SYMBOL(of_find_all_nodes);
> >>  * Find a property with a given name for a given node
> >>  * and return the value.
> >>  */
> >> -static const void *__of_get_property(const struct device_node *np,
> >> +const void *__of_get_property(const struct device_node *np,
> >> 				     const char *name, int *lenp)
> >> {
> >> 	struct property *pp = __of_find_property(np, name, lenp);
> >> @@ -397,9 +397,13 @@ static const void *__of_get_property(const struct device_node *np,
> >> const void *of_get_property(const struct device_node *np, const char *name,
> >> 			    int *lenp)
> >> {
> >> -	struct property *pp = of_find_property(np, name, lenp);
> >> +	unsigned long flags;
> >> +	const void *value;
> >> 
> >> -	return pp ? pp->value : NULL;
> >> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> >> +	value = __of_get_property(np, name, lenp);
> >> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> >> +	return value;
> > 
> > Why is this changed?
> > 
> 
> Symmetry. All the others follow the same pattern.

Drop it, or split into a separate patch. I don't like patches that lump
together unrelated changes.

g.
