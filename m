Return-Path: <linux@roeck-us.net>
Message-ID: <53A990E9.7060002@roeck-us.net>
Date: Tue, 24 Jun 2014 07:53:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] of: Do not free memory at of_node_release
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>	<1403430039-15085-2-git-send-email-pantelis.antoniou@konsulko.com> <20140624141004.9E989C40B84@trevor.secretlab.ca>
In-Reply-To: <20140624141004.9E989C40B84@trevor.secretlab.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On 06/24/2014 07:10 AM, Grant Likely wrote:
> On Sun, 22 Jun 2014 12:40:34 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
>> The life-cycle of nodes and properties does not allow us to release
>> the memory taken by a device_node. Pointer to properties and nodes
>> might still be in use in drivers, so any memory free'ing is dangerous.
>>
>> Simply move all the properties to the deadprops list, and the node
>> itself to of_alldeadnodes until the life-cycles issues are resolved.
>
> Ummm. this looks wrong. The release function is supposed to be the place
> to do the freeing, and with our discussion the other day about moving to
> rcu, but keeping of_node_get/put() for anything that needs to hold a
> long term reference, that means the lifecycle issues are pretty much
> resolved. I don't think this patch is necessary.
>
I am also a bit concerned about its implications. Does it mean that repeated
insertion/removal of an overlay will result in memory leaks ? I am sure
we'll find a bunch of memory leaks over time, but this looks like an
intentional one, which could be easy to create trouble if a system is
supposed to stay up for months or years.

Thanks,
Guenter
