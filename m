Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/6] of: Do not free memory at of_node_release
In-Reply-To: <44A964DB-2C39-4E5B-BD7B-61973942B25A@konsulko.com>
References: 
	<1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1403430039-15085-2-git-send-email-pantelis.antoniou@konsulko.com>
	<20140624141004.9E989C40B84@trevor.secretlab.ca>
	<0E39F7E8-1141-4D6D-A251-3F0DDEA9AA29@konsulko.com>
	<20140624202121.7A8E3C40D39@trevor.secretlab.ca>
	<44A964DB-2C39-4E5B-BD7B-61973942B25A@konsulko.com>
Date: Wed, 25 Jun 2014 20:24:25 +0100
Message-Id: <20140625192425.18500C40AE6@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 24 Jun 2014 23:23:35 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Hi Grant,
> 
> On Jun 24, 2014, at 11:21 PM, Grant Likely wrote:
> 
> > On Tue, 24 Jun 2014 17:23:35 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >> Hi Grant,
> >> 
> >> On Jun 24, 2014, at 5:10 PM, Grant Likely wrote:
> >> 
> >>> On Sun, 22 Jun 2014 12:40:34 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >>>> The life-cycle of nodes and properties does not allow us to release
> >>>> the memory taken by a device_node. Pointer to properties and nodes
> >>>> might still be in use in drivers, so any memory free'ing is dangerous.
> >>>> 
> >>>> Simply move all the properties to the deadprops list, and the node
> >>>> itself to of_alldeadnodes until the life-cycles issues are resolved.
> >>> 
> >>> Ummm. this looks wrong. The release function is supposed to be the place
> >>> to do the freeing, and with our discussion the other day about moving to
> >>> rcu, but keeping of_node_get/put() for anything that needs to hold a
> >>> long term reference, that means the lifecycle issues are pretty much
> >>> resolved. I don't think this patch is necessary.
> >>> 
> >> 
> >> Well, I thought about it too. This is the culmination of that process :)
> >> 
> >> The problem is not the node life-cycle, it's the properties. We can't
> >> tell for sure who and where has a pointer to the properties of the node,
> >> and when we free the node, the current code iterates over the properties
> >> list and frees them. This works only because in my tests, of_node_release
> >> only gets called when using overlays created nodes.
> > 
> > If a caller want's to use the value of a property, then it needs to
> > of_node_get() the node. Property lifecycle is strictly attached to the
> > lifecycle of it's node.
> > 
> 
> Taking bets if that's always the case?

Any users that do are buggy. I don't want to change the lifecycle model.

That said, what I would consider merging a patch that makes a
configuration or runtime option to never free nodes or properties,
and/or clears the memory so we know if anyone tries to manipulate them.

g.
