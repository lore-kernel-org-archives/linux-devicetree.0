Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 5/5] of: Transactional DT support.
In-Reply-To: <0E971359-9791-43D0-86C3-2CE81457934E@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-6-git-send-email-pantelis.antoniou@konsulko.com>
	<20140711052437.2232BC40B84@trevor.secretlab.ca>
	<0E971359-9791-43D0-86C3-2CE81457934E@konsulko.com>
Date: Wed, 16 Jul 2014 07:39:31 -0600
Message-Id: <20140716133931.6F2D0C40FC8@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, 11 Jul 2014 23:28:45 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> On Jul 11, 2014, at 8:24 AM, Grant Likely wrote:
> > On Fri,  4 Jul 2014 19:58:49 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >> +static int __of_transaction_entry_apply(struct of_transaction *oft,
> >> +		struct of_transaction_entry *te)
> >> +{
> >> +	struct property *old_prop;
> >> +	unsigned long flags;
> >> +	int ret, state;
> >> +
> >> +	ret = 0;
> >> +
> >> +	state = __of_transaction_entry_device_state(oft, te, 0);
> >> +
> >> +	switch (te->action) {
> >> +	case OF_RECONFIG_ATTACH_NODE:
> >> +	case OF_RECONFIG_DETACH_NODE:
> >> +		ret = of_reconfig_notify(te->action, te->np);
> >> +		break;
> >> +	case OF_RECONFIG_ADD_PROPERTY:
> >> +	case OF_RECONFIG_REMOVE_PROPERTY:
> >> +	case OF_RECONFIG_UPDATE_PROPERTY:
> >> +		ret = of_property_notify(te->action, te->np, te->prop);
> >> +		break;
> >> +	}
> > 
> > The way I read this, the notifier is sent as each entry is applied. So
> > the sequence would be:
> > 	entry 1 notify
> > 	entry 1 apply
> > 	entry 2 notify
> > 	entry 2 apply
> > 	etc.
> > Correct?
> > 
> Yes.
> 
> > For this patch, that is probably exactly what should happen because it
> > matches the existing behaviour. However, it isn't what we want. We need
> > a seperate patch to reorganize the notifiers to be emitted after the
> > change takes place as we discussed on IRC, and powerpc needs to be moved
> > to the new model. At the same time, all of the notifiers need to be
> > emitted together instead of interleaved with the individual entries so
> > that the order looks like this:
> > 	entry 1 apply
> > 	entry 2 apply
> > 	etc.
> > 	entry 1 notify
> > 	entry 2 notify
> > 	etc.
> 
> It is simple enough to do. We will break anyone that depended on the old
> notifier behaviour, but I doubt there's anyone out there.

PowerPC has some dependency, but I'm working on fixing that.

> > 
> >> +
> >> +	if (ret) {
> >> +		pr_err("%s: notifier error @%s\n", __func__,
> >> +				te->np->full_name);
> >> +		return ret;
> >> +	}
> >> +
> >> +	mutex_lock(&of_mutex);
> > 
> > This doesn't look right. The mutex need to be held over the entire time
> > of applying changes. It cannot be dropped between entries of the
> > changeset. ie:
> > 
> > 	mutex_lock()
> > 	entry 1 apply
> > 	entry 2 apply
> > 	etc.
> > 	mutex_unlock()
> > 	entry 1 notify
> > 	entry 2 notify
> > 	etc.
> > 
> > If the mutex gets obtained and droped for each entry, then there is no
> > protection against another thread making a modification in the middle.
> > 
> 
> Remember that of_mutex is not the only mutex at play. Overlays have
> another mutex taken before applying anything.

I want of_mutex to be available to cover the entire period where the
tree needs to be stable for the purpose of making modifications,
regardless of the user. Overlays is just one user and I don't want to
relay on overlay locking to get the core behaviour correct.

g.
