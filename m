Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/6] of: Do not free memory at of_node_release
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140624203357.GA23620@roeck-us.net>
Date: Wed, 25 Jun 2014 00:02:27 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC6D689C-ED96-48B2-BF90-92492FC65791@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-2-git-send-email-pantelis.antoniou@konsulko.com> <20140624141004.9E989C40B84@trevor.secretlab.ca> <0E39F7E8-1141-4D6D-A251-3F0DDEA9AA29@konsulko.com> <20140624202121.7A8E3C40D39@trevor.secretlab.ca> <44A964DB-2C39-4E5B-BD7B-61973942B25A@konsulko.com> <20140624203357.GA23620@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Guenter,

On Jun 24, 2014, at 11:33 PM, Guenter Roeck wrote:

> On Tue, Jun 24, 2014 at 11:23:35PM +0300, Pantelis Antoniou wrote:
>> Hi Grant,
>>=20
>> On Jun 24, 2014, at 11:21 PM, Grant Likely wrote:
>>=20
>>> On Tue, 24 Jun 2014 17:23:35 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>>>> Hi Grant,
>>>>=20
>>>> On Jun 24, 2014, at 5:10 PM, Grant Likely wrote:
>>>>=20
>>>>> On Sun, 22 Jun 2014 12:40:34 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>>>>>> The life-cycle of nodes and properties does not allow us to =
release
>>>>>> the memory taken by a device_node. Pointer to properties and =
nodes
>>>>>> might still be in use in drivers, so any memory free'ing is =
dangerous.
>>>>>>=20
>>>>>> Simply move all the properties to the deadprops list, and the =
node
>>>>>> itself to of_alldeadnodes until the life-cycles issues are =
resolved.
>>>>>=20
>>>>> Ummm. this looks wrong. The release function is supposed to be the =
place
>>>>> to do the freeing, and with our discussion the other day about =
moving to
>>>>> rcu, but keeping of_node_get/put() for anything that needs to hold =
a
>>>>> long term reference, that means the lifecycle issues are pretty =
much
>>>>> resolved. I don't think this patch is necessary.
>>>>>=20
>>>>=20
>>>> Well, I thought about it too. This is the culmination of that =
process :)
>>>>=20
>>>> The problem is not the node life-cycle, it's the properties. We =
can't
>>>> tell for sure who and where has a pointer to the properties of the =
node,
>>>> and when we free the node, the current code iterates over the =
properties
>>>> list and frees them. This works only because in my tests, =
of_node_release
>>>> only gets called when using overlays created nodes.
>>>=20
>>> If a caller want's to use the value of a property, then it needs to
>>> of_node_get() the node. Property lifecycle is strictly attached to =
the
>>> lifecycle of it's node.
>>>=20
>>=20
>> Taking bets if that's always the case?
>>=20
> For my part I prefer to take the bet (and handle the consequences) =
over
> a potential memory leak.
>=20

It's your call really. But let me just demonstrate why this is harder =
than it appears,
with a small example.

The of_node_get() method is not invoked for instance when reading string =
properties.

The of_property_read_string() method will return a pointer to the string =
property value.
That means that potentially all drivers that call =
of_property_read_string() will have to
be converted to taking a reference of the node using of_node_get(), or =
the of_property_read_string()
must do so in the background.

Also note that the release method is never called on non-dynamic node =
since that memory is
never released.

FWIW, the overlay code until now operated just fine releasing the nodes, =
but I can't=20
guarantee you won't be screwed sometime by an errand driver :)

> Guenter

Regards

-- Pantelis
