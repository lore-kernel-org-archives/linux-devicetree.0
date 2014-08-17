Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/4] of: dynamic: Handle special properties changes
In-Reply-To: <E4E20FCC-BE25-457E-9B5F-2284EEC3B13B@konsulko.com>
References: 
	<1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1406578009-30154-5-git-send-email-pantelis.antoniou@konsulko.com>
	<20140729055729.2DCBDC40C93@trevor.secretlab.ca>
	<E4E20FCC-BE25-457E-9B5F-2284EEC3B13B@konsulko.com>
Date: Sun, 17 Aug 2014 16:52:56 +0100
Message-Id: <20140817155256.868F4C40C61@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 29 Jul 2014 09:28:25 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Hi Grant,
> On Jul 29, 2014, at 8:57 AM, Grant Likely wrote:
> 
> > On Mon, 28 Jul 2014 23:06:49 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> >> Some node properties are 'special', that is fields in the node
> >> are pointing at it. These are "name", "device_type", and
> >> the phandles ("phandle", "linux,phandle" & "ibm,handle").
> >> 
> >> Instead of trying to handle them at node attachment, handle
> >> them when the property changes.
> > 
> > Why?
> > 
> 
> Because that's the only way for those properties to be correct.
> 
> Take for instance the case where one attaches a subtree to a node
> of the live tree.
> 
> The sequence will be:
> 
> attach_node
> add_property
> add_property
> ....
> 
> At the moment of attachment the special properties are unknown.
> 
> You could argue about attaching the node after the properties
> attachment, but that's makes the sequence of attachment unnatural,
> and imposes an arbitrary limitation to the users of that API.

As far as the data structure is concerned, I don't want to see that.
Each individual added node can and should be complete when it is passed
to the apply function. The mechanics are a lot simpler and easier to
audit if that is enforced.

This doesn't even have to change the API. The prop add/modify functions
can easily check if the node is unattached and queued to be added. If it
is then the property can be added directly.

g.
